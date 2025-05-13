if type -q uv
    uv generate-shell-completion fish | source
    source "$HOME/.local/bin/env.fish"
end

if type -q uvx
    uvx generate-shell-completion fish | source
end
