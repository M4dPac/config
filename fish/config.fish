fish_vi_key_bindings
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -d /opt/nvim-linux64/bin
    fish_add_path -a /opt/nvim-linux64/bin
end

fish_add_path -a "$HOME/.local/bin"
# set -x PATH "$HOME/.local/bin" $PATH

# List Directory
alias l='lsd -lh' # long list
alias ls='lsd -1' # short list
alias ll='lsd -lha --group-directories-first' # long list all
alias ld='lsd -lhd */' # long list dirs
alias lld='lsd -lhd .*/' # long list all dirs
alias lt='lsd --tree' # list folder as tree

alias v='nvim'
alias bat='batcat'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
