function fish_user_key_bindings
    bind -M insert \eg __prepend_collect # Alt+C для collect -c
    bind -M default \eg __prepend_collect # Alt+C для collect -c
end

function __prepend_collect
    set -l cmd (commandline)
    set -l pos (commandline -C) # сохранить позицию курсора

    if string match -q 'collect -c *' -- $cmd
        # убрать "git "
        commandline -r (string replace 'collect -c ' '' -- $cmd)
        commandline -C (math $pos - 4) # скорректировать позицию
    else
        commandline -C 0
        commandline -i 'collect -c '
        commandline -C (math $pos + 4) # вернуть курсор
    end
end
