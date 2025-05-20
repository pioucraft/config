# reset
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/hypr
rm -rf $HOME/.config/waybar

# tmux
cp ./.tmux.conf ~/.tmux.conf
echo "Tmux was configured"

# neovim
cp -r ./nvim ~/.config/nvim 
echo "Neovim was configured"
echo "Please install packer from GitHub, and configure Copilot"

# hyprland
cp -r ./hypr ~/.config/hypr
sed -i "1s/.*/$(head -n 1 config.env)/" ~/.config/hypr/hyprland.conf
echo "Hyprland was configured"

# waybar
cp -r ./waybar ~/.config/waybar
echo "Waybar was configured"

# zsh/bash
grep -qxF "source $HOME/git/pioucraft/config/bash/.bashrc" $HOME/.bashrc || echo "source $HOME/git/pioucraft/config/bash/.bashrc" >> $HOME/.bashrc
grep -qxF "source $HOME/git/pioucraft/config/bash/.bash_env" $HOME/.bashrc || echo "source $HOME/git/pioucraft/config/bash/.bash_env" >> $HOME/.bashrc
echo "Zsh/Bash was configured"

# reload 
hyprctl reload
