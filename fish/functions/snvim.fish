# ~/.config/fish/functions/snvim.fish
function snvim --description "sudo nvim with user config"
    sudo /home/user/.local/bin/nvim $argv
end
