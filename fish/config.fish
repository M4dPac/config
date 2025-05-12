fish_vi_key_bindings
set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH "$HOME/.local/bin" $PATH
source "$HOME/.cargo/env.fish"
