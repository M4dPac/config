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

    # Цвет для venv (можно изменить)
    # set -l venv_color (set_color --bold cyan)

    # Если venv активирован, добавляем его имя в prompt
    set -l venv_prompt
    if set -q VIRTUAL_ENV
        set venv_prompt "$green-("(path basename "$VIRTUAL_ENV")")$reset"
    end

    # Определяем символ промпта
    set -l prompt_symbol "󰮯"
    set -l prompt_end "$blue\$$reset"
    if [ (id -u) = 0 ]
        set prompt_symbol "💀" # Заменить на череп для root
        set prompt_end "$red#$reset"
    end


    echo -ne "$green┌──"
    echo -ne "($blue$bold$USER$prompt_symbol$hostname$green)"
    echo -ne "-[$reset$bold$(prompt_pwd)$green]$reset"
    echo -ne "$venv_prompt\n"
    echo -ne "$green   └─$stat$prompt_end "
end
