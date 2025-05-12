function fish_prompt
    # Цвета и стили (используем ANSI-escape последовательности)
    set -l reset "\033[0m"
    set -l bold "\033[1m"
    set -l red "\033[31m"
    set -l green "\033[32m"
    set -l blue "\033[34m"
    set -l yellow "\033[33m"

    set -l ifconfig ()

    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    # Определяем символ промпта
    set -l prompt_symbol "㉿"
    set -l prompt_end "$blue\$$reset"
    if [ (id -u) = 0 ]
        set prompt_symbol "💀" # Заменить на череп для root
        set prompt_end "$red#$reset"
    end

    # Дополнительные элементы
    set -l debian_chroot (if test -n "$debian_chroot"; then echo "($debian_chroot)"; end)
    set -l venv (if test -n "$VIRTUAL_ENV"; then echo "(basename $VIRTUAL_ENV)"; end)

    # Тип промпта (можно переключать через переменную)
    switch twoline # Или "oneline", "backtrack"
        case twoline
            echo -ne "$green┌──$debian_chroot$venv($blue$bold$USER$prompt_symbol$hostname$green)-[$reset$bold$(prompt_pwd)$green]\n$green   └─$stat$prompt_end "
        case oneline
            echo -ne "$red$bold$user@$blue%m$reset:$green$bold$(prompt_pwd)$reset# "
        case backtrack
            echo -ne "$red$bold$user@$blue%m$reset:$green$bold$(prompt_pwd)$reset# "
    end
end
