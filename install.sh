#!/bin/bash

checkInstalled() {
    if type -p "$1" > /dev/null; then
        echo "Found "$1""
    else
        echo "Installing "$1"" || pacman --noconfirm -S "$1"
    fi
}

if type -p zsh > /dev/null; then
    echo "Found zsh"
else
    echo "Installing zsh" || pacman --noconfirm -S zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-theme-powerlevel10K
fi
# Setting zsh as default shell
chsh -s /bin/zsh "$name" > /dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"

# Install software
# TODO: Add polybar from the AUR 
checkInstalled vim
checkInstalled kitty
checkInstalled htop
checkInstalled dunst
checkInstalled neofetch
checkInstalled picom
checkInstalled ranger
checkInstalled redshift
checkInstalled feh
checkInstalled light
checkInstalled i3lock
checkInstalled libnotify
checkInstalled scrot
checkInstalled flameshot

error(){
    #clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
    printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}


echo "\nWelcome!\n"
echo "Installing my dotfiles now! Make sure to be running as root."
echo "Note that this program is still work in progress!\n"

# Check if user is root.
pacman --noconfirm --needed -Sy dialog || error "Are you sure you're running this as the root user or are on an Arch-based system?"

# Setting up colors for pacman
#grep -q "^Color" /etc/pacman.conf || sed -i "s/^#Color$/Color" /etc/pacman.conf


# Installing the dotfiles!
# Note to self: I should prob just made a function for all this... smh.
mv ~/.config/i3 ~/.config/i3-BACKUP
mv ~/.config/picom ~/.config/picom-BACKUP
mv ~/.config/polybar ~/.config/polybar-BACKUP
mv ~/.config/kitty ~/.config/kitty-BACKUP
mv ~/.config/dunst ~/.config/dunst-BACKUP
mv ~/.config/ranger ~/.config/ranger-BACKUP
mv ~/.oh-my-zsh ~/.oh-my-zsh-BACKUP
#mv ~/.config/ ~/.config/
mv ~/.zshrc ~/.zshrc-BACKUP
mv ~/.vimrc ~/.vimrc-BACKUP

cp -r .config/i3 ~/.config/i3 || sed -i "s/foxmaccloud/$name/g" ~/.config/i3/config
cp -r .config/picom ~/.config/picom
cp -r .config/polybar ~/.config/polybar
cp -r .config/kitty ~/.config/kitty
cp -r .config/dunst ~/.config/dunst
cp -r .config/ranger ~/.config/ranger
cp -r .oh-my-zsh ~/.oh-my-zsh
cp -r .zshrc ~/.zshrc || sed -i "s/foxmaccloud/$name/g" ~/.config/i3/config
cp -r .vimrc ~/.vimrc

# Setting up wallpapers
if [! -f ~/Pictures/Wallpapers]; then
    mkdir -p ~/Pictures/Wallpapers
fi
cp wallhaven-13lyrw.png ~/Pictures/Wallpapers/
cp wallhaven-j59zrp.jpg ~/Pictures/Wallpapers/

# TODO: Fix me!
reloadDaemons(){
    systemctl enable "$1"
    systemctl start "$1"
}

echo "Installed successfully!"
