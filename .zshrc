#                   ▒███████▒  ██████  ██░ ██  ██▀███   ▄████▄  
#                   ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█  
#                   ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄ 
#                     ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
#                   ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
#                   ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
#                   ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒   
#                   ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░        
#                     ░ ░          ░   ░  ░  ░   ░     ░ ░      
#                     ░                                  ░        
#
#               .zshrc configuration by FoxMaccloud for FoxMaccloud



# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/foxmaccloud/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="xiong-chiamiov"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git branch)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



#My shit...
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='[\u@\h \w]\$ '
#echo -e "\nAh shit!\nHere we go again..."
#echo -e '\n\e[01;30m ▚ \e[0;30m ▞ \e[01;31m ▚ \e[0;31m ▞ \e[01;32m ▚ \e[0;32m ▞ \e[01;33m ▚ \e[0;33m ▞ \e[01;34m ▚ \e[0;34m ▞ \e[01;35m ▚ \e[0;35m ▞ \e[01;36m ▚ \e[0;36m ▞ \e[01;37m ▚ \e[0;37m ▞'

#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"


[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

#PS1="\[\e[32m\][\[\e[0m\]\A\[\e[32m\]]\[\e[0m\]\[\e[31m\]*\[\e[0m\]\[\e[32m\][\[\e[0m\]\u\[\e[32m\]]\[\e[0m\]\[\e[34m\]*\[\e[0m\]\[\e[32m\][\[\e[0m\]\W\[\e[32m\]]\[\e[0m\]\[\e[31m\]*\[\e[0m\]\[\e[36m\][\[\e[34m\]\$\[\e[36m\]]\[\e[0m\]"


#TERM='rxvt-unicode-256color'
TERM='xterm-kitty'

# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'


#making life easier
alias ra="ranger"
alias spi="sudo pacman -S"
alias sps="pacman -Ss"
alias syu="sudo pacman -Syu"
alias sc="sudo pacman -Sc"
alias spr="sudo pacman -Rns"
alias api="yay -S" 
alias aps="yay -Ss"
alias apu="yay -Syu"
alias apr="yay -Rns"
#alias ll="ls -l"
alias l="exa -l --group-directories-first"
alias ll="exa -al --group-directories-first"
alias lg="exa -al --git --group-directories-first"
alias li="exa -abghHliS --group-directories-first"
alias lt="exa -a --long --tree --grid"
alias py="python"
alias py2="python2"
alias pip="pip3"
alias Wgcc="i686-w64-mingw32-gcc"
alias xclip='xclip -selection clipboard'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias wifi="sudo wifi-menu" # can also use networkmanager (nm)
alias steam="flatpak run com.valvesoftware.Steam"
#alias pdf="okular"
alias pdf="zathura"
alias sxiv="sxiv -a"
alias powershell="pwsh"
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
#alias cd.="cd ../"
#alias cd..="cd ../../"
#alias cd...="cd ../../../"
alias htb="cd /home/foxmaccloud/Documents/HTB/"
alias q="exit"
alias c="clear"
alias cal="cal -n 3 -m"
alias ccat='pygmentize -g -O linenos=1'
#alias yolo='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias yas='yarn start'

yolo() {
    message=$(curl -s http://whatthecommit.com/index.txt)
    git commit -m "$message"
    echo "\n $message \n"
}

pushgit() {
    git add .
    yolo
    git push
}

alias updatePrograms='/home/foxmaccloud/Programs/updatePrograms.sh'
alias gobuster='/home/foxmaccloud/Programs/gobuster/gobuster'
alias evil-winrm='/home/foxmaccloud/Programs/evil-winrm/evil-winrm.rb'
alias dnsrecon='/home/foxmaccloud/Programs/dnsrecon/dnsrecon.py'
#alias kerbrute='/home/foxmaccloud/go/bin/kerbrute'
alias ropstar='/home/foxmaccloud/Programs/ropstar/ropstar.py'
alias hashcat="hashcat --opencl-device-types=1,2"


alias \?='duck'


alias hosts="sudo vim /etc/hosts"
alias suspend="systemctl suspend"



impacket() {
    if [ -f $1 ]; then
        ls /home/foxmaccloud/Programs/impacket/examples/
    else
        /home/foxmaccloud/Programs/impacket/examples/$1.py
    fi
}


extract () {
if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
	*)     echo "'$1' cannot be extracted via extract()" ;;
     esac
 else
     echo "'$1' is not a valid file"
 fi
}

compasm() {
if [ -f "$1" ]; then
    case "$1" in
        *.asm) nasm -f elf -F dwarf -g "$1" && echo "compiling and generating debug information!";;
        *) echo "'$1' is not an asm file...";;
    esac
else
    echo "'$1' does not exsist..."
fi
}

runasm() {
if [ -f "$2" ]; then
		ld -m elf_i386 -o "$1" "$2" && echo "making executable!";
	else
		echo "Something went wrong!";
fi
}

findname() {
    find / -name $1 2>/dev/null;
}


cvim() {
    vim $1 && chmod +x $1;
}

genshellcode(){
    /home/foxmaccloud/Documents/Programming/Shell/ShellcodeGenerator/genshellcode.sh $1
}

nse() {
    if [ "$1" ]; then
        exa -alh /usr/share/nmap/scripts/ | grep "$1"
    else
        exa -alh /usr/share/nmap/scripts/
    fi
}

urlencode () {
declare str="$*"
declare encoded=""
for ((i=0; i<${#str}; i++ ))
do
  c=${str:$i:1}
  case "$c" in
    [-_.~a-zA-Z0-9]) x="$c" ;;
    *) printf -v x '%%%02x' "'$c" ;;
  esac
  encoded+="$x"
done
echo "$encoded"
}

duck () {
  declare url=$(urlencode "$*")
  #lynx -accept_all_cookies "https://duckduckgo.com/lite?q=$url"
  links "https://duckduckgo.com/lite?q=$url"
}

termColors() {
    for code in {30..37}; do \
        echo -en "\e[${code}m"'\\e['"$code"'m'"\e[0m"; \
        echo -en "  \e[$code;1m"'\\e['"$code"';1m'"\e[0m"; \
        echo -en "  \e[$code;3m"'\\e['"$code"';3m'"\e[0m"; \
        echo -en "  \e[$code;4m"'\\e['"$code"';4m'"\e[0m"; \
        echo -e "  \e[$((code+60))m"'\\e['"$((code+60))"'m'"\e[0m"; \
    done
}
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/foxmaccloud/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
