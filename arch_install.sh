#!/bin/bash

set -x

# Цвета для вывода
RED="\033[0;31m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"

# Функция для безопасного выполнения команд
run() {
	echo -e "${BLUE}Выполняю:${NC} $*"
	if ! "$@"; then
		echo -e "${RED}Ошибка при выполнении команды:${NC} $*"
		exit 1
	fi
	echo
}

update-mirrorlist() {
	if ! grep -q "reflector -p https -f 10 --threads 20 --download-timeout 10 --age 6 --ipv4 --sort score --save /etc/pacman.d/mirrorlist" /etc/pacman.d/mirrorlist; then
		run reflector -p https -f 10 --threads 20 --download-timeout 10 --age 6 --ipv4 --sort score --save /etc/pacman.d/mirrorlist 2>/dev/null
	fi
}

# Предупреждение о рисках
echo -e "${RED}ВНИМАНИЕ!${NC} Скрипт форматирует диск и устанавливает систему. Нажмите Ctrl+C для отмены"
sleep 5

# Убедитесь, что у вас есть привилегии суперпользователя
if [ "$EUID" -ne 0 ]; then
	echo -e "${RED}Недостаточно прав.${NC} Пожалуйста, запустите как root."
	exit 1
fi

# Проверка активного сетевого соединения
echo -e "${BLUE}Проверка сетевого соединения...${NC}"
if ! ping -4 -c 1 -W 1 archlinux.org &>/dev/null; then
	echo -e "${RED}Не обнаружено сетевого соединения. Пожалуйста, настройте ваше сетевое соединение.${NC}"
	wifi-menu
	if ! ping -4 -c 1 -W 1 archlinux.org &>/dev/null; then
		echo -e "${RED}Настройка сети не удалась. Выход.${NC}"
		exit 1
	fi
fi

# Проверка IPv6
echo -e "${BLUE}Проверяю IPv6...${NC}"
if ! ping -6 -c 1 -W 1 2001:4860:4860::8888 &>/dev/null; then
	echo -e "\n${YELLOW}IPv6 не доступен. Отключаю...${NC}"
	cat <<EOF >/etc/sysctl.d/99-disable-ipv6.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
	sysctl -p --quiet /etc/sysctl.d/99-disable-ipv6.conf
	echo -e "${YELLOW}IPv6 отключен${NC}"
else
	echo "✅ Доступен"
fi
echo

# Обновление системных часов
timedatectl set-ntp true

# Обновление списка зеркал для быстсрой загрузчика
update-mirrorlist
sed -ri "s/^#(Color)$/\1/" /etc/pacman.conf
sed -ri "s/^#(ParallelDownloads\s=)\s[0-9]+$/\1 10\nILoveCandy/" /etc/pacman.conf

# Список доступных устройств хранения данных
echo -e "${BLUE}Доступные устойства хранения данных:${NC}"
lsblk

# Запрос устройства для использования
echo -e "${YELLOW}Введите устройство для установки Arch Linux (по умолчанию: /dev/sda): ${NC}"
read disk
${disk:="/dev/sda"}

# Убедитесь, что пользователь предоставил действительное устройство
if [ ! -b "$disk" ]; then
	echo -e "${RED}Недопустимое устройство: ${NC}${disk}"
	exit 1
fi
echo

# Запрос имени пользователя и пароля
echo -e "${YELLOW}Введите пароль для root (по умолчанию: 2):${NC}"
while true; do
	read -s -p "Пароль: " pass_root
	${pass_root:="2"}
	echo
	read -s -p "Повторите пароль: " pass_root2
	${pass_root2:="2"}
	echo
	[ "$pass_root" = "$pass_root2" ] && break
	echo -e "${RED}Пароли не совпадают!${NC}"
done
echo

encrypted_root_password=$(openssl passwd -6 "$pass_root")
unset pass_root
unset pass_root2

echo -e "${YELLOW}Введите ваше имя пользователяш (по умолчанию: user): ${NC}"
read username
${username:="user"}

echo -e "${YELLOW}Введите пароль для пользователя user (по умолчанию: 1):${NC}"
while true; do
	read -s -p "Пароль: " pass_user
	${pass_user:="2"}
	echo
	read -s -p "Повторите пароль: " pass_user2
	${pass_user2:="2"}
	echo
	[ "$pass_user" = "$pass_user2" ] && break
	echo -e "${RED}Пароли не совпадают!${NC}"
done
echo

encrypted_user_password=$(openssl passwd -6 "$pass_user")
unset pass_user
unset pass_user2

# Разметка диска
run parted -s "$disk" mklabel gpt
run parted -s "$disk" mkpart EFI fat32 1MiB 256MiB
run parted -s "$disk" set 1 boot on
run parted -s "$disk" mkpart primary 256MiB 100%

# Форматирование
run mkfs.vfat "${disk}1"
run mkfs.ext4 -F "${disk}2"

# Монтирование
run mount "${disk}2" /mnt
run mkdir -p /mnt/boot/
run mount "${disk}1" /mnt/boot/

# Установка базовых пакетов с firmware
base_pkgs="base linux linux-firmware linux-headers base-devel dhcpcd net-tools iproute2 networkmanager vim git efibootmgr iwd sudo openssh zsh fish"
for pkgs in $base_pkgs; do
	run pacstrap -K /mnt "$pkgs"
done
# pacstrap -K /mnt "base linux linux-firmware base-devel lvm2 dhcpcd net-tools iproute2 networkmanager vim efibootmgr iwd sudo"

# Генерация fstab
genfstab -U /mnt >>/mnt/etc/fstab

# Получаем uuid диска
# uuid=$(blkid -s UUID -o value "${disk}"2)

# Переход в новую систему chroot
run arch-chroot /mnt /bin/bash <<EOF
set -x
systemctl enable NetworkManager
systemctl enable sshd


# Локализация
echo
echo "Настройка локализации"
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
sed -i 's/#ru_RU.UTF-8/ru_RU.UTF-8/' /etc/locale.gen
locale-gen

# Настройка часового пояса
echo
echo "Настройка времени"
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

# Hostname
echo
echo "Настройка hostname"
echo "arch" > /etc/hostname
cat << EOL > /etc/hosts
127.0.0.1  localhost
::1        localhost
127.0.1.1  arch.localdomain arch
EOL

# Обновление списка зеркал для быстсрой загрузчика
$(update-mirrorlist)
sed -ri "s/^#(Color)$/\1/" /etc/pacman.conf
sed -ri "s/^#?(ParallelDownloads\s=)\s[0-9]+$/\1 10\nILoveCandy/" /etc/pacman.conf

# Установка паролей (переданы из основного скрипта)
echo
echo "Настройка паролей"
usermod -s "/usr/bin/fish" -p "$encrypted_root_password" root
useradd -m -G wheel,users,video -s /bin/bash $username
usermod -s "/bin/fish" -p "$encrypted_user_password" "$username"
sed -ri "s/^(root ALL=\(ALL:ALL\) ALL)/\1\n${username} ALL=(ALL:ALL) ALL/" /etc/sudoers

# Установка загрузчика
echo
echo "Настройка загрузчика"
bootctl install --path=/boot
echo -e "default arch.conf\ntimeout 5\nconsole-mode max\neditor no" > /boot/loader/loader.conf

cat <<CFG > /boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=${disk}2
CFG

cat /boot/loader/entries/arch.conf | sed "s/linux.img/linux-fallback.img/" > /boot/loader/entries/arch-fallback.conf

# Безопасность
echo
echo "Настройка безопасности"
chmod 600 /boot/loader/random-seed
chmod -R 700 /boot/loader/keys
chown root:root /boot/loader/random-seed
EOF

# Финальные шаги
run umount -R /mnt
echo -e "${GREEN}Установка завершена.${NC} Перезагрузите систему и войдите в пользователя 'user'"
