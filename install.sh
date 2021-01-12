#!/bin/bash

printf "\nWelcome!\n\n"
printf "Installing my dotfiles now! Make sure to be running as root.\n"
printf "Note that this program is still work in progress!\n\n"

yesnoPrompt() {
    while true; do
    read -p "$1 (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) printf "Please answer with yes or no.\n";;
    esac
done
}

yesnoPrompt "Do you still wish to continue?"

error(){
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
    #printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

checkInstalled() {
    if type -p "$1" > /dev/null; then
        printf "Found "$1"\n"
    else
        printf "Installing "$1"\n" && pacman --noconfirm --needed -S "$1"
    fi
}

# Check if user is root.
if [["$EUID" -ne 0]]; then
    error "Are you sure you're running this as the root user or are on an Arch-based system?"
fi
#pacman --noconfirm --needed -Sy dialog || error "Are you sure you're running this as the root user or are on an Arch-based system?"


# Get user home dir
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6 | cut -d "/" -f3)
yesnoPrompt "Installing under the user $USER_HOME! Is this the correct user?"


if type -p zsh > /dev/null; then
    printf "Found zsh\n"
else
    printf "Installing zsh\n" && pacman --noconfirm --needed -S zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-theme-powerlevel10K
    # Setting zsh as default shell
    chsh -s /bin/zsh "$USER_HOME" > /dev/null 2>&1
    sudo -u "$USER_HOME" mkdir -p "/home/$USER_HOME/.cache/zsh/"
fi

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
checkInstalled exa

# Setting up colors for pacman
#grep -q "^Color" /etc/pacman.conf || sed -i "s/^#Color$/Color" /etc/pacman.conf

# Installing the dotfiles!
# Note to self: I should prob just made a function for all this... smh.
mv $USER_HOME/.config/i3 $USER_HOME/.config/i3-BACKUP 2>/dev/null
mv $USER_HOME/.config/picom $USER_HOME/.config/picom-BACKUP 2>/dev/null
mv $USER_HOME/.config/polybar $USER_HOME/.config/polybar-BACKUP 2>/dev/null
mv $USER_HOME/.config/kitty $USER_HOME/.config/kitty-BACKUP 2>/dev/null
mv $USER_HOME/.config/dunst $USER_HOME/.config/dunst-BACKUP 2>/dev/null
mv $USER_HOME/.config/ranger $USER_HOME/.config/ranger-BACKUP 2>/dev/null
mv $USER_HOME/.oh-my-zsh $USER_HOME/.oh-my-zsh-BACKUP 2>/dev/null
#mv $USER_HOME/.config/ $USER_HOME/.config/
mv $USER_HOME/.zshrc $USER_HOME/.zshrc-BACKUP 2>/dev/null
mv $USER_HOME/.vimrc $USER_HOME/.vimrc-BACKUP 2>/dev/null

cp -r .config/i3 $USER_HOME/.config/i3 && sed -i "s/foxmaccloud/$USER_HOME/g" $USER_HOME/.config/i3/config
cp -r .config/picom $USER_HOME/.config/picom
cp -r .config/polybar $USER_HOME/.config/polybar
cp -r .config/kitty $USER_HOME/.config/kitty
cp -r .config/dunst $USER_HOME/.config/dunst
cp -r .config/ranger $USER_HOME/.config/ranger
cp -r .oh-my-zsh $USER_HOME/.oh-my-zsh
cp -r .zshrc $USER_HOME/.zshrc && sed -i "s/foxmaccloud/$USER_HOME/g" $USER_HOME/.zshrc
cp -r .vimrc $USER_HOME/.vimrc

# Setting up wallpapers
if [! -f $USER_HOME/Pictures/Wallpapers]; then
    mkdir -p $USER_HOME/Pictures/Wallpapers
fi
cp wallhaven-13lyrw.png $USER_HOME/Pictures/Wallpapers/
cp wallhaven-j59zrp.jpg $USER_HOME/Pictures/Wallpapers/

# TODO: Fix me!
reloadDaemons(){
    systemctl enable "$1"
    systemctl start "$1"
}

printf "\nInstalled successfully!\n"
