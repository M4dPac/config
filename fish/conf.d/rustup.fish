# rustup shell setup
# if not contains "$HOME/.cargo/bin" $PATH
#     # Prepending path in case a system-installed rustc needs to be overridden
#     set -x PATH "$HOME/.cargo/bin" $PATH
# end

if test -d "$HOME/.cargo/bin"
    fish_add_path -a ~/.cargo/bin
end
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end
