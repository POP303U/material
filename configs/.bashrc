######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vim mode yay
set -o vi
shopt -s histappend
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTSIZE=~/.bash_history
HISTFILESIZE=10000000
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoreboth

################################################################################
##  MAIN                                                                      ##
################################################################################

export PROMPT_COMMAND=shortened_pwd # store current shortened path in $CURRENT_PATH
export QT_QPA_PLATFORMTHEME=qt5ct
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.config/emacs/bin
export PATH=$PATH:~/.config/wofi/scripts
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.bin/colorscripts
export PATH=$PATH:~/.config/hypr/scripts
export PATH=$PATH:~/.bin
export SUDO_PROMPT='sudo (%p@%h) password: ' # doas like password thing
export SUDO=sudo
export TERM_PROGRAM=tmux
export TERMINAL=/usr/bin/kitty
export EDITOR=nvim
export VISUAL=nvim
export PROJECTS="/mnt/sdc1/Projects/"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m' 
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_so=$'\e[45;93m' 
export LESS_TERMCAP_se=$'\e[0m'
export GRC="$(command -v grc)"

# get list of packages that needs this package
function_depends() {
    search=$(echo "$1")
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}

###################################
#
# Good aliases
#
###################################

alias depends='function_depends'

# cd into subdirectories easily
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias 1.='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'

# Set editor to neovim
alias edit='${EDITOR}'
alias v='nvim'

# neofetch btw
alias btw='clear -T $TERM; neofetch' # i use arch btw 

# coloring with grc + make commands defaults better
alias colourify="$([[ $GRC != "" ]] && echo "grc -es")"
alias blkid='colourify blkid'
alias configure='colourify ./configure'
alias df='colourify df'
alias diff='colourify diff'
alias docker='colourify docker'
alias docker-compose='colourify docker-compose'
alias docker-machine='colourify docker-machine'
alias du='colourify du'
alias env='colourify env'
alias free='colourify free'
alias fdisk='colourify fdisk'
alias findmnt='colourify findmnt'
alias make='colourify make'
alias gcc='colourify gcc'
alias g++='colourify g++'
alias id='colourify id'
alias ip='colourify ip'
alias iptables='colourify iptables'
alias as='colourify as'
alias gas='colourify gas'
alias journalctl='colourify journalctl'
alias kubectl='colourify kubectl'
alias ld='colourify ld'
alias lsof='colourify lsof'
alias lsblk='colourify lsblk'
alias lspci='colourify lspci'
alias netstat='colourify netstat'
alias ping='colourify ping'
alias ss='colourify ss'
alias traceroute='colourify traceroute'
alias traceroute6='colourify traceroute6'
alias head='colourify head'
alias tail='colourify tail'
alias dig='colourify dig'
alias mount='colourify mount'
alias ps='colourify ps'
alias mtr='colourify mtr'
alias semanage='colourify semanage'
alias getsebool='colourify getsebool'
alias ifconfig='colourify ifconfig'
alias sockstat='colourify sockstat'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias free='free -mt'
alias pacman='sudo pacman --color auto'
alias sudo='sudo '

# get current bootloader
alias boot="sudo bootctl status | grep Product"

# give the list of all installed desktops - xsessions desktops
alias xd="ls -1 /usr/share/xsessions"
alias xdw="ls -1 /usr/share/wayland-sessions"

# permissions
alias prm-folder-fix="chmod 0755 $1"
alias prm-exe="chmod u+x $1"

# cargo aliases
alias cb="cargo build "
alias ci="cargo install --path ."
alias cl="cargo clean "
alias cn="cargo new "
alias ct="cargo test "
alias cr="cargo run "

# list users
alias userlist="cut -d: -f1 /etc/passwd | sort"

# systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# get error messages
alias jctl="journalctl -p 3 -xb"

# alias to notify when command finished ex: (pacman -Syu ; alert "Updates finished")
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# extract music with metadata, with video
alias yt-dlpxa='yt-dlp -x --add-metadata '${1}''
alias yt-dlpa='yt-dlp --add-metadata '${1}''

# print image with kitty
alias kt-img='kitty +kitten icat '${1}''

# resizing
alias res16x9='convert '$1' -resize 1920x1080^ -gravity center -extent 1920x1080 '$2''

# my own fetching tool yay
alias hyprfetch='clear -T $TERM; hyprfetch'

# dunst debugging tools
alias dunst-pkill='pkill -9 dunst ; pkill -9 mako ; dunst & disown'
alias dunst-lorem='notify-send "Discord (193)" "Hello i guys i may be stupid aaaaa"'

alias keysoup='sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd'    

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'

# fuzzy finding with neovim
alias dv='${SUDO} nvim'
alias vf='${EDITOR} $(fzf)'
alias dvf='${SUDO} ${EDITOR} $(fzf)'

# For editing configs
alias v-i3='cd ~/.config/i3 && ${EDITOR} ~/.config/i3/config'
alias v-i3blocks='cd ~/.config/i3blocks && ${EDITOR} ~/.config/i3blocks/i3blocks.conf'
alias v-polybar='cd ~/.config/polybar && ${EDITOR} ~/.config/polybar/config.ini'
alias v-picom='cd ~/.config/picom && ${EDITOR} ~/.config/picom/picom.conf'
alias v-kitty='cd ~/.config/kitty && ${EDITOR} ~/.config/kitty/kitty.conf'
alias v-alacritty='cd ~/.config/alacritty && ${EDITOR} ~/.config/alacritty/alacritty.yml'
alias v-cava='cd ~/.config/cava && ${EDITOR} ~/.config/cava/config'
alias v-gtk2='cd ~/.config/gtk-2.0 && ${EDITOR} ~/.config/gtk-2.0/gtkfilechooser.ini'
alias v-gtk3='cd ~/.config/gtk-3.0 && ${EDITOR} ~/.config/gtk-3.0/settings.ini'
alias v-tmux='cd ~ && ${EDITOR} ~/.tmux.conf '
alias v-lf='cd ~/.config/lf && ${EDITOR} ~/.config/lf/lfrc'
alias v-nano='cd ~/.config/nano && ${EDITOR} ~/.config/nano/nanorc'
alias v-neofetch='cd ~/.config/neofetch && ${EDITOR} ~/.config/neofetch/config.conf'
alias v-nvim='cd ~/.config/nvim && ${EDITOR} ~/.config/nvim/init.lua'
alias v-paru='cd ~/.config/paru && ${EDITOR} ~/.config/paru/paru.conf'
alias v-rofi='cd ~/.config/rofi && ${EDITOR} ~/.config/rofi/config.rasi'
alias v-tofi='cd ~/.config/tofi && ${EDITOR} ~/.config/tofi/config'
alias v-dunst='cd ~/.config/dunst && ${EDITOR} ~/.config/dunst/dunstrc'
alias v-bashrc='cd ~ && ${EDITOR} ~/.bashrc'
alias v-emacs='cd ~/.config/emacs && ${EDITOR} ~/.config/emacs/config.org'
alias v-hypr='cd ~/.config/hypr && ${EDITOR} ~/.config/hypr/hyprland.conf'
alias v-fuzzel='cd ~/.config/fuzzel && ${EDITOR} ~/.config/fuzzel/fuzzel.ini'
alias v-waybar='cd ~/.config/waybar && ${EDITOR} ~/.config/waybar/config.jsonc'
alias v-autoclicker='cd ~/.config/autoclicker && ${EDITOR} ~/.config/autoclicker/clicker_start'
alias v-wlogout='cd ~/.config/wlogout && ${EDITOR} ~/.config/wlogout/style.css '
alias v-material='cd ~/.config/material && ${EDITOR} ~/.config/material/config'
alias v-Kvantum='cd ~/.config/Kvantum && ${EDITOR} ~/.config/Kvantum/kvantum.kvconfig'
alias v-wofi='cd ~/.config/wofi && ${EDITOR} ~/.config/wofi/style.css'
alias v-swww='cd ~/.config/swww/scripts && ${EDITOR} ~/.config/swww/scripts/change_wallpaper'
alias v-sway='cd ~/.config/sway && ${EDITOR} ~/.config/sway/config'
alias v-xinitrc='cd ~ && ${EDITOR} ~/.xinitrc'
alias s-bashrc='source ~/.bashrc'

# for sudo editing
alias dv-fstab='cd /etc/ && ${SUDO} ${EDITOR} /etc/fstab'
alias dv-vconsole='cd /etc/ && ${SUDO} ${EDITOR} /etc/vconsole.conf'
alias dv-issue='cd /etc/ && ${SUDO} ${EDITOR} /etc/issue'
alias dv-motd='cd /etc/ && ${SUDO} ${EDITOR} /etc/motd'
alias dv-environment='cd /etc/ && ${SUDO} ${EDITOR} /etc/environment'
alias dv-pacman='cd /etc/ && ${SUDO} ${EDITOR} /etc/pacman.conf'
alias dv-mkinitcpio='cd /etc/ && ${SUDO} ${EDITOR} /etc/mkinitcpio.conf'
alias dv-mirrorlist='cd /etc/ && ${SUDO} ${EDITOR} /etc/pacman.d/mirrorlist'
alias dv-hosts='cd /etc/ && ${SUDO} ${EDITOR} /etc/hosts'
alias dv-hostname='cd /etc/ && ${SUDO} ${EDITOR} /etc/hostname'
alias dv-keyd='cd /etc/keyd/ && ${SUDO} ${EDITOR} /etc/keyd/default_shell.conf'

# Conditional ls ((stupidly nested) not anymore!)
if [[ -e "$HOME/.cargo/bin/eza" || -f "/usr/bin/eza" ]]; then
    alias ls='eza             --icons        --colour=always --binary --header'
    alias la='eza --all --all --icons --long --colour=always --binary --header'
    alias ll='eza --all       --icons --long --colour=always --binary --header'
    alias l.='eza             --icons --long --colour=always --binary --header'
else
    alias la='ls -laH'
    alias ll='ls -lA'
    alias l.='ls -l'
fi

################################
#
# Functions
#
################################

function current_git() {
#    local GIT_DIRECTORY="$(git rev-parse --git-dir 2>/dev/null)"

#    if [ "$?" != "128" ]; then
#     
#    fi

    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
        printf "%s" " "
    fi
}

function current_kernel() {
    printf "%s" "$(uname -r)"
}

function current_host() {
    printf "%s" "$(uname -a | awk '{print $2}')"
}

function current_user() {
    printf "%s" "$(users | awk '{print $1}')"
}

function current_time() {
    printf "%s" "$(date +%r | xargs)"    
}

function shortened_pwd() {
	# How many characters of the $PWD should be kept
	local MAXLENGTH=30

	# Indicate that there has been dir truncation
	local TRUNC_SYM=".."

	# Store local dir
	local DIR=${PWD##*/}

	# Which length to use
	MAXLENGTH=$(( ( MAXLENGTH < ${#DIR} ) ? ${#DIR} : MAXLENGTH ))

	CURRENT_PATH=${PWD/#$HOME/\~}
	
	local PWDOFFSET=$(( ${#CURRENT_PATH} - MAXLENGTH ))

	# Generate name
	if [ ${PWDOFFSET} -gt "0" ]
	then
		CURRENT_PATH=${CURRENT_PATH:$PWDOFFSET:$MAXLENGTH}
		CURRENT_PATH=${TRUNC_SYM}/${CURRENT_PATH#*/}
	fi
}

################################
#
# Prompts
#
################################

###################
### PS1
###################
BLACK='\[\033[01;30m\]'   # Black
RED='\[\033[01;31m\]'     # Red
GREEN='\[\033[01;32m\]'   # Green
YELLOW='\[\033[01;33m\]'  # Yellow
BLUE='\[\033[01;34m\]'    # Blue
PURPLE='\[\033[01;35m\]'  # Purple
CYAN='\[\033[01;36m\]'    # Cyan
WHITE='\[\033[01;37m\]'   # White
CLEAR='\[\033[00m\]'      # Reset

function simple_and_functional() {
	PS1=''${BLUE}'$(current_git)'${PURPLE}''${GREEN}'$(current_host)'${BLUE}' | '${PURPLE}'$(current_user) '${BLUE}'|'${YELLOW}' ${CURRENT_PATH}'${GREEN}' \$ '${CLEAR} 
}

function default_artix_iso() {
	PS1=''${GREEN}'$(current_host)'${CLEAR}':'${RED}'['${BLUE}'$(current_user)'${RED}']'${CLEAR}':'${PURPLE}'${CURRENT_PATH}'${YELLOW}' \$ '${CLEAR} 
}

function default_arch_iso() {
    PS1=''${RED}'$(current_user)'${CLEAR}'@$(current_host) ${CURRENT_PATH} # '
}

function default_gentoo_iso() {
    PS1=''${GREEN}'$(current_user)@$(current_host) '${BLUE}'${CURRENT_PATH} '${CLEAR}'% '
}

function general_iso() {
    PS1=''${GREEN}'$(current_user)@$(current_host) '${BLUE}'${CURRENT_PATH} \$'${CLEAR}' '
}

function complicated_shell() {
    PS1='\n'${RED}'╔('${GREEN}'$(current_host)'${RED}')'═'('${BLUE}'$(current_user)'${RED}')'═'('${CYAN}'$(current_kernel)'${RED}')'═'('${PURPLE}'$(current_time)'${RED}')\n╚'${RED}'('${YELLOW}'${CURRENT_PATH}'${RED}')'${BLUE}' => '${CLEAR}''
}

function nice_shell_artix() {
    PS1=''${GREEN}'$(current_git)'${BLUE}'  '${CLEAR}'${CURRENT_PATH} '${BLUE}' '${CLEAR}''
}

function nice_shell_void() {
    PS1=''${BLUE}'$(current_git)'${GREEN}'  '${CLEAR}'${CURRENT_PATH} '${GREEN}' '${CLEAR}''
}

function simplistica() {
    PS1=''${YELLOW}'${CURRENT_PATH}\n'${BLUE}' '${CLEAR}''
}

function powerliney() {
    PS1=''${YELLOW}'${CURRENT_PATH} '${PURPLE}' '${BLUE}'$(current_user)@$(current_host) '${PURPLE}' '${CLEAR}''
}

function fancy_bash_prompt() {
    ##	Original source: WOLFMAN'S color bash promt
    ##	https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s
    PS1='\n\[\033[0;1;97;40m\] \u \[\033[0;30;100m\]\[\033[0;1;97;100m\] \h \[\033[0;90;106m\]\[\033[0;30;1;106m\] ${CURRENT_PATH} \[\033[0;96;49m\]\[\033[1;38;5;15m\] '
}

function starship_prompt() {
    PS1='\n'${CYAN}'${CURRENT_PATH}\n'${GREEN}'❯ '${CLEAR}''
}

function default_shell() {
    PS1='[\u@\h \W]\$ '
}

###################
### PS2
###################

function nice_arrow() {
    PS2=''${BLUE}'=> '${CLEAR}''
}

function small_arrow() {
    PS2=''${BLUE}'-> '${CLEAR}''
}

function default_arrow() {
    PS2=''${CLEAR}'> '
}   

function pretty_angle() {
    PS2=''${PURPLE}' '${CLEAR}''
}   

function pretty_dollar() {
    PS2=''${PURPLE}': '${CLEAR}''
}   

convdir() {
    for i in *$1; do ffmpeg -i "$i" "${i%.*}.$2"; done
}

hg() {
    history | grep "$1";
}

matrix() {
    tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"
}

duhk() {
    du -h --max-depth=1 | sort -hk 1,1
}

bf() {
    du -h -x -s -- * | sort -r -h | head -20;
}

fman() {
    compgen -c | fzf | xargs man
}

pc() {
    if [[ -z "$1" ]]; then
        echo "usage: pc <program>"
        echo "Runs a program in the background"
    else
        "$1" & disown
    fi
}

calc() {
    awk "BEGIN { print $* }"
    
}

fix-pacman() {
    sudo rm -R /var/lib/pacman/sync
    sudo pacman -Sy
}

die() {
    pkill -SIGKILL $1
}

translate() {  
    wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" |  sed 's/.*"translatedText":"\([^"]*\)".*}/\1/' 
}

kbdfont() {
    local FONTSIZE="28"
    local FONTTYPE="n"

    case $1 in
        -h)
            echo "usage: kbdfont -s <fontsize> -t <normal/bold> -w <false/true>Y"
            echo ":: -s: set the fontsize"
            echo ":: -t: set the the type of font"
            echo ":: -w: save font into /etc/vconsole.conf"
            ;;
        -s)
            case $2 in 
                12)
                    FONTSIZE="12"
                    ;;
                14)
                    FONTSIZE="14"
                    ;;
                16)
                    FONTSIZE="16"
                    ;;
                18)
                    FONTSIZE="18"
                    ;;
                20)
                    FONTSIZE="20"
                    ;;
                22)
                    FONTSIZE="22"
                    ;;
                24)
                    FONTSIZE="24"
                    ;;
                28)
                    FONTSIZE="28"
                    ;;
                32)
                    FONTSIZE="32"
                    ;;
                *)
                    echo "'$2' is not a valid font size"
                    echo "Available fontsize options: "
                    echo " :: 12, doesn't support bold"
                    echo " :: 14"
                    echo " :: 16"
                    echo " :: 18"
                    echo " :: 20"
                    echo " :: 22"
                    echo " :: 24"
                    echo " :: 28"
                    echo " :: 32"
                    ;;
            esac
            ;;
        *)           
            echo "resorting to defaults: "
            echo "setfont ${BUILTFONT}" 
            BUILTFONT="ter-v${FONTSIZE}${FONTTYPE}.psf.gz"
            setfont "/usr/share/kbd/consolefonts/${BUILTFONT}"            
            ;; 
    esac

    case $3 in 
        -t)
            case $4 in
                normal)
                    FONTTYPE="n"
                    ;;
                bold)
                    FONTTYPE="b"
                    ;;
                *)
                    echo "'$4' is not a fonttype"
                    echo
                    echo "options:"
                    echo " :: normal"
                    echo " :: bold"
                    ;;
            esac
            ;;
        *)
            echo "'$3' is not a valid switch"
            ;;
    esac

    case $5 in 
        -w)
            case $6 in 
                true)
                    if [ ! -f "/etc/vconsole.conf" ]; then sudo touch /etc/vconsole.conf; fi
                    if [ -z "$(cat /etc/vconsole.conf | grep FONT )" ]; then
                        echo "FONT=ter-v${FONT_SIZE}${FONT_TYPE}" | sudo tee -a /etc/vconsole.conf
                    else
                        sudo sed -i 's|FONT=.*|FONT=ter-v'${FONTSIZE}''${FONTTYPE}'|' /etc/vconsole.conf
                    fi
                    echo "saving into /etc/vconsole.conf"
                    ;;
                false)
                    echo "not saving into /etc/vconsole.conf"
                    ;;
                *)
                    echo "'$6' is not a option"
                    echo
                    echo "options:"
                    echo " :: true: save into /etc/vconsole.conf"
                    echo " :: false: dont save into /etc/vconsole.conf"
                    ;;
            esac
            ;;
        *)
            echo "'$5' is not a valid switch"
            ;;
    esac

    BUILTFONT="ter-v${FONTSIZE}${FONTTYPE}.psf.gz"
    setfont "/usr/share/kbd/consolefonts/${BUILTFONT}"
}

ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   tar xf $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

clch() {
    echo "Remove ~/.cache? (press enter to continue || Ctrl-C to quit): "
    echo "'rm -rf ~/.cache'"; read _D_
    rm -rf ~/.cache 
    echo "Clear pacman cache? (press enter to continue || Ctrl-C to quit): "
    echo "'pacman -Scc'"; read _D_
    sudo pacman -Scc
    echo "Clear pacman cache (using paccache)? (press enter to continue || Ctrl-C to quit): "
    echo "'paccache -ruk0'"; read _D_
    sudo paccache -ruk0
}

pac() {
    # Check if the first argument is -i
    case $1 in
        -i|--install) shift
            if [ "$#" -gt 0 ]; then
                # Install the packages using pacman
                sudo pacman -S "$@"
            else
                echo "No packages specified for installation."
                fi ;;
            -r|--remove) shift
                if [ "$#" -gt 0 ]; then
                    # Install the packages using pacman
                    sudo pacman -Rn "$@"
            else
                echo "No packages specified for removal."
            fi ;;
        -q|--query) shift
            if [ "$#" -gt 0 ]; then
                # Install the packages using pacman
                sudo pacman -Qs "$@"
            else
                echo "No packages specified for search."
            fi ;;
        -u|--upgrade) shift
                sudo pacman -Syu "$@" ;;
        -s|--sync) shift
                sudo pacman -Syy "$@" ;;

         *) echo "usage: pac <operation> [...]
operations:
    pac { -i --install } <packages(s)>
    pac { -r --remove  } <packages(s)>
    pac { -q --query   } <packages(s)>
    pac { -u --upgrade } Perform a full system upgrade
    pac { -s --sync    } Sync all packages with the repository
    pac { -h --help    } Display this help message
"
    ;;
     esac
}

if [ ! -z "$DISPLAY" ]; then
    ################################
    #
    # Select your Prompt!
    #
    ################################
    # Uncomment the prompt you want to select it
    # Customize the arrow for a command spanning multiple lines

    # PS1 =>
    #simple_and_functional  # simple prompt with all information necessary
    #fancy_bash_prompt      # fancy bash prompt 
    #complicated_shell      # two line bash prompt with much information
    nice_shell_artix       # simple shell i use (artix)
    #nice_shell_void        # simple shell i use (void)
    starship_prompt        # default starship prompt
    #default_arch_iso       # prompt based on artix live iso
    #default_artix_iso      # prompt based on artix live iso
    #default_gentoo_iso     # prompt based on gentoo live iso
    #general_iso            # prompt based on mostly all linux distros defaults
    #default_shell          # default bash prompt
    #simplistica            # simple, kinda like those zsh prompts or something
    #powerliney             # powerline based bash prompt

    # PS2 =>
    #nice_arrow            # simple fat blue arrow 
    #small_arrow           # simple small blue arrow 
    pretty_angle           # angle brackets like 'nice_shell_artix' prompt         
    #pretty_dollar         # dollar prompt but pretty
    #default_arrow         # default arrow

        
    ################################
    #
    # Customize your Login!
    #
    ################################
    # Uncomment the fetching script you want to run on login

    #neofetch
    #pfetch
    #screenfetch
    #fastfetch
    #hyprfetch
    #pokemon-colorscripts --no-title -r 
    ~/.bin/colorscripts/colorwheel 
else 
    ################################
    #
    # Select your Prompt! (tty only)
    #
    ################################
    default_artix_iso      # prompt based on artix live iso
    nice_arrow             # simple fat blue arrow 
fi
