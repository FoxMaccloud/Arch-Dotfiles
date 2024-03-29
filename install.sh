#!/bin/bash

# Made by FoxMaccloud

printf "\nWelcome!\n\n"
printf "Installing my dotfiles now! Make sure to be running as root.\n"
printf "Note that this program is still work in progress!\n"

yesnoPrompt() {
    while true; do
    printf "\n"
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

# Install aur
getAur(){
    SCRIPTPATH='dirname $SCRIPT'
    mkdir /tmp/aur
    git clone https://aur.archlinux.org/yay.git /tmp/aur
    sudo chown -R $USER_HOME:$USER_HOME /tmp/aur/aur-git
    cd /tmp/aur/aur-git
    sudo -u "$USER_HOME" makepkg --noconfirm -si 2>$1
    cd $SCRIPTPATH
}

# Check that packages are installed
checkInstalled() {
    if type -p "$1" > /dev/null; then
        printf "Found "$1"\n"
    else
        printf "Installing "$1"\n" && pacman --noconfirm --needed -S "$1" 2>/dev/null
    fi
}

# Setup youcompleteme vim plugin
installYCM(){
    cd /home/$SUDO_USER/.vim/plugged/youcompleteme
    python3 install.py --all 2>$1
    cd $SCRIPTPATH
}

# Check if user is root.
if [[ "$EUID" -ne 0 ]]; then
    error "Are you sure you're running this as the root user?"
    if ! type -p pacman > /dev/null; then
    error "Are on an Arch-based system?"
    fi
fi
#pacman --noconfirm --needed -Sy dialog || error "Are you sure you're running this as the root user or are on an Arch-based system?"


# Get user home dir
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6 | cut -d "/" -f3)
yesnoPrompt "Installing under the user \"$USER_HOME\" Is this the correct user?"

# Check that zsh is installed
if type -p zsh > /dev/null; then
    printf "Found zsh\n"
else
    printf "Installing zsh\n" && pacman --noconfirm --needed -S zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-theme-powerlevel10K 2>/dev/null
    # Setting zsh as default shell
    chsh -s /bin/zsh "$USER_HOME" > /dev/null 2>&1
    sudo -u "$USER_HOME" mkdir -p "/home/$USER_HOME/.cache/zsh/"
fi

# Get oh my zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git /home/$USER_HOME/.oh-my-zsh


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
mv /home/$USER_HOME/.config/i3 /home/$USER_HOME/.config/i3-BACKUP 2>/dev/null
mv /home/$USER_HOME/.config/picom /home/$USER_HOME/.config/picom-BACKUP 2>/dev/null
mv /home/$USER_HOME/.config/polybar /home/$USER_HOME/.config/polybar-BACKUP 2>/dev/null
mv /home/$USER_HOME/.config/kitty /home/$USER_HOME/.config/kitty-BACKUP 2>/dev/null
mv /home/$USER_HOME/.config/dunst /home/$USER_HOME/.config/dunst-BACKUP 2>/dev/null
mv /home/$USER_HOME/.config/ranger /home/$USER_HOME/.config/ranger-BACKUP 2>/dev/null
#mv /home/$USER_HOME/.oh-my-zsh /home/$USER_HOME/.oh-my-zsh-BACKUP 2>/dev/null
#mv $USER_HOME/.config/ $USER_HOME/.config/
mv /home/$USER_HOME/.zshrc /home/$USER_HOME/.zshrc-BACKUP 2>/dev/null
mv /home/$USER_HOME/.vimrc /home/$USER_HOME/.vimrc-BACKUP 2>/dev/null

# Checks that files already exsists in the system.
checkexists() {
    if [[ ! -f /home/$USER_HOME/.config/$1 ]]; then
        mkdir -p /home/$USER_HOME/.config/$1
    fi
}

checkexists i3 && cp -r .config/i3 /home/$USER_HOME/.config/i3 && sed -i "s/foxmaccloud/$USER_HOME/g" /home/$USER_HOME/.config/i3/config
checkexists picom && cp -r .config/picom /home/$USER_HOME/.config/picom
checkexists polybar && cp -r .config/polybar /home/$USER_HOME/.config/polybar
checkexists kitty && cp -r .config/kitty /home/$USER_HOME/.config/kitty
checkexists dunst && cp -r .config/dunst /home/$USER_HOME/.config/dunst
checkexists ranger- && cp -r .config/ranger /home/$USER_HOME/.config/ranger
#cp -r .oh-my-zsh /home/$USER_HOME
cp -r .zshrc /home/$USER_HOME && sed -i "s/foxmaccloud/$USER_HOME/g" /home/$USER_HOME/.zshrc
cp -r .vimrc /home/$USER_HOME

# Setting up wallpapers
if [ ! -f /home/$USER_HOME/Pictures/Wallpapers ]; then
    mkdir -p /home/$USER_HOME/Pictures/Wallpapers
fi
cp wallhaven-13lyrw.png /home/$USER_HOME/Pictures/Wallpapers/
cp wallhaven-j59zrp.jpg /home/$USER_HOME/Pictures/Wallpapers/


# Fix ownership for files
chGrpOwn(){
    chown -R $USER_HOME /home/$USER_HOME/$1
    chgrp -R $USER_HOME /home/$USER_HOME/$1
}
chGrpOwn .config/i3
chGrpOwn .config/picom
chGrpOwn .config/polybar
chGrpOwn .config/kitty
chGrpOwn .config/dunst
chGrpOwn .config/ranger
chGrpOwn .oh-my-zsh
chGrpOwn .zshrc
chGrpOwn .vimrc
chGrpOwn Pictures
chown -R $USER_HOME /home/$USER_HOME/Pictures


# TODO: Fix me!
reloadDaemons(){
    systemctl enable "$1"
    systemctl start "$1"
}

printf "\nInstalled successfully!\n"
