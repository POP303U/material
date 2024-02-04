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

##	FUNCTIONS:
##
##	* bash_prompt_command()
##	  This function takes your current working directory and stores a shortened
##	  version in the variable "NEW_PWD".
##
##	* format_font()
##	  A small helper function to generate color formating codes from simple
##	  number codes (defined below as local variables for convenience).
##
##	* fancy_bash_prompt()
##	  This function colorizes the bash promt. The exact color scheme can be
##	  configured here. The structure of the function is as follows:
##		1. A. Definition of available colors for 16 bits.
##		1. B. Definition of some colors for 256 bits (add your own).
##		2. Configuration >> EDIT YOUR PROMT HERE<<.
##		4. Generation of color codes.
##		5. Generation of window title (some terminal expect the first
##		   part of $PS1 to be the window title)
##		6. Formating of the bash promt ($PS1).
##
##	* Main script body:	
##	  It calls the adequate helper functions to colorize your promt and sets
##	  a hook to regenerate your working directory "NEW_PWD" when you change it.


################################################################################
##  FUNCTIONS                                                                 ##
################################################################################

##
##	ARRANGE $PWD AND STORE IT IN $NEW_PWD
##	* The home directory (HOME) is replaced with a ~
##	* The last pwdmaxlen characters of the PWD are displayed
##	* Leading partial directory names are striped off
##		/home/me/stuff -> ~/stuff (if USER=me)
##		/usr/share/big_dir_name -> ../share/big_dir_name (if pwdmaxlen=20)
#G
##	Original source: WOLFMAN'S color bash promt
##	https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s
##

bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=30

	# Indicate that there has been dir truncation
	local trunc_symbol=".."

	# Store local dir
	local dir=${PWD##*/}

	# Which length to use
	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

	NEW_PWD=${PWD/#$HOME/\~}
	
	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	# Generate name
	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi
}

##
##	GENERATE A FORMAT SEQUENCE
##
format_font()
{
	## FIRST ARGUMENT TO RETURN FORMAT STRING
	local output=$1


	case $# in
	2)
		eval $output="'\[\033[0;${2}m\]'";;
	3)
		eval $output="'\[\033[0;${2};${3}m\]'";;
	4)
		eval $output="'\[\033[0;${2};${3};${4}m\]'";;
	*)
		eval $output="'\[\033[0m\]'";;
	esac
}

##
## COLORIZE BASH PROMT
##
fancy_bash_prompt() {

	############################################################################
	## COLOR CODES                                                            ##
	## These can be used in the configuration below                           ##
	############################################################################
	
	## FONT EFFECT
	local      NONE='0'
	local      BOLD='1'
	local       DIM='2'
	local UNDERLINE='4'
	local     BLINK='5'
	local    INVERT='7'
	local    HIDDEN='8'
	
	## COLORS
	local   DEFAULT='9'
	local     BLACK='0'
	local       RED='1'
	local     GREEN='2'
	local    YELLOW='3'
	local      BLUE='4'
	local   MAGENTA='5'
	local      CYAN='6'
	local    L_GRAY='7'
	local    D_GRAY='60'
	local     L_RED='61'
	local   L_GREEN='62'
	local  L_YELLOW='63'
	local    L_BLUE='64'
	local L_MAGENTA='65'
	local    L_CYAN='66'
	local     WHITE='67'
	
	## TYPE
	local     RESET='0'
	local    EFFECT='0'
	local     COLOR='30'
	local        BG='40'
	
	## 256 COLOR CODES
	local NO_FORMAT="\[\033[0m\]"
	local ORANGE_BOLD="\[\033[1;38;5;208m\]"
	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
	local RED_BOLD="\[\033[1;38;5;1m\]"
	local CYAN_BOLD="\[\033[1;38;5;87m\]"
	local BLACK_BOLD="\[\033[1;38;5;0m\]"
	local WHITE_BOLD="\[\033[1;38;5;15m\]"
	local GRAY_BOLD="\[\033[1;90m\]"
	local BLUE_BOLD="\[\033[1;38;5;74m\]"
	
	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  
	  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##
	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ## 
	
	##                          CONFIGURE HERE                                ##

	############################################################################
	## CONFIGURATION                                                          ##
	## Choose your color combination here                                     ##
	############################################################################
	
	## CONFIGURATION: ROSE-PINE
	START=$BLACK; START_BG=$D_GRAY; TEXTEFFECT_S=$BOLD
	FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD
	FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD
	FONT_COLOR_3=$BLACK; BACKGROUND_3=$L_CYAN; TEXTEFFECT_3=$BOLD
	PROMT_FORMAT=$WHITE_BOLD	

	############################################################################
	## TEXT FORMATING                                                         ##
	## Generate the text formating according to configuration                 ##
	############################################################################
	
	## CONVERT CODES: add offset
    S_FC=$(($START+$COLOR))
	S_BG=$(($START_BG+$BG))
	S_FE=$(($TEXTEFFECT_S+$EFFECT))

	FC1=$(($FONT_COLOR_1+$COLOR))
	BG1=$(($BACKGROUND_1+$BG))
	FE1=$(($TEXTEFFECT_1+$EFFECT))
	
	FC2=$(($FONT_COLOR_2+$COLOR))
	BG2=$(($BACKGROUND_2+$BG))
	FE2=$(($TEXTEFFECT_2+$EFFECT))
	
	FC3=$(($FONT_COLOR_3+$COLOR))
	BG3=$(($BACKGROUND_3+$BG))
	FE3=$(($TEXTEFFECT_3+$EFFECT))
	
	FC4=$(($FONT_COLOR_4+$COLOR))
	BG4=$(($BACKGROUND_4+$BG))
	FE4=$(($TEXTEFFECT_4+$EFFECT))

	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local TEXT_FORMAT_S
	local TEXT_FORMAT_1
	local TEXT_FORMAT_2
	local TEXT_FORMAT_3
	local TEXT_FORMAT_4	
	format_font TEXT_FORMAT_S $S_FC $S_BG1 $S_FE
	format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1
	format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2
	format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3
	format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4
	
	# GENERATE PROMT SECTIONS
	local PROMT_START=$"$TEXT_FORMAT_S \u "
	local PROMT_USER=$"$TEXT_FORMAT_1 \u "
	local PROMT_HOST=$"$TEXT_FORMAT_2 \h "
	local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD} "
	local PROMT_INPUT=$"$PROMT_FORMAT "

	############################################################################
	## SEPARATOR FORMATING                                                    ##
	## Generate the separators between sections                               ##
	## Uses background colors of the sections                                 ##
	############################################################################
	
	## CONVERT CODES
   
	S_TSFC1=$(($BACKGROUND_2+$BG))
	S_TSBG1=$(($BACKGROUND_1+$COLOR))

	TSFC1=$(($BACKGROUND_1+$COLOR))
	TSBG1=$(($BACKGROUND_2+$BG))
	
	TSFC2=$(($BACKGROUND_2+$COLOR))
	TSBG2=$(($BACKGROUND_3+$BG))
	
	TSFC3=$(($BACKGROUND_3+$COLOR))
	TSBG3=$(($DEFAULT+$BG))

	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local SEPARATOR_FORMAT_S
	local SEPARATOR_FORMAT_1
	local SEPARATOR_FORMAT_2
	local SEPARATOR_FORMAT_3
	format_font SEPARATOR_FORMAT_S $S_TSBG1 $S_TSFC1
	format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
	format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
	format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3
	
	# GENERATE SEPARATORS WITH FANCY SLANT
	local SLANT=$'\ue0bc'	
    local TRIANGLE=$'\ue0b0'

	local START=$SEPARATOR_FORMAT_S$TRIANGLE
	local SEPARATOR_1=$SEPARATOR_FORMAT_1$SLANT
	local SEPARATOR_2=$SEPARATOR_FORMAT_2$SLANT
	local SEPARATOR_3=$SEPARATOR_FORMAT_3$SLANT

	############################################################################
	## WINDOW TITLE                                                           ##
	## Prevent messed up terminal-window titles                               ##
	############################################################################
	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac

	############################################################################
	## BASH PROMT                                                             ##
	## Generate promt and remove format from the rest                         ##
	############################################################################
    PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"

    # Didn't work im dieing aaa
    #${START}
    
    ## For terminal line coloring, leaving the rest standard
    none="$(tput sgr0)"
    trap 'echo -ne "${none}"' DEBUG
}

################################################################################
##  MAIN                                                                      ##
################################################################################

##	Bash provides an environment variable called PROMPT_COMMAND. 
##	The contents of this variable are executed as a regular Bash command 
##	just before Bash displays a prompt. 
##	We want it to call our own command to truncate PWD and store it in NEW_PWD
PROMPT_COMMAND=bash_prompt_command

##	Call bash_promnt only once, then unset it (not needed any more)
##	It will set $PS1 with colors and relative to $NEW_PWD, 
##	which gets updated by $PROMT_COMMAND on behalf of the terminal

if [[ -f "~/.config/swww/change_wallpaper" ]]; then . ~/.config/swww/change_wallpaper; fi
export QT_QPA_PLATFORMTHEME=gnome
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.config/emacs/bin
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

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

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
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'

# Set editor to neovim
alias edit='${EDITOR}'
#alias vim='nvim'
#alias vi='nvim'
alias v='nvim'

# neofetch btw
alias btw='clear -T $TERM; neofetch' # i use arch btw 

# make commands defaults better
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
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"

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

# my own fetching tool yay
alias hyprfetch='clear -T $TERM; hyprfetch'

# dunst debugging tools
alias dunst-pkill='pkill -9 dunst ; pkill -9 mako ; dunst & disown'
alias dunst-lorem='notify-send "Discord (193)" "Hello i guys i may be stupid aaaaa"'

alias keysoup='sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd'    

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
alias v-dunst='cd ~/.config/dunst && ${EDITOR} ~/.config/dunst/dunstrc'
alias v-bashrc='cd ~ && ${EDITOR} ~/.bashrc'
alias v-emacs='cd ~/.config/emacs && ${EDITOR} ~/.config/emacs/config.org'
alias v-hypr='cd ~/.config/hypr && ${EDITOR} ~/.config/hypr/hyprland.conf'
alias v-hypr-binds='cd ~/.config/emacs && ${EDITOR} ~/config.org'
alias v-waybar='cd ~/.config/waybar && ${EDITOR} ~/.config/waybar/config.jsonc'
alias v-autoclicker='cd ~/.config/autoclicker && ${EDITOR} ~/.config/autoclicker/clicker_start'
alias v-wlogout='cd ~/.config/wlogout && ${EDITOR} ~/.config/wlogout/style.css '
alias v-wofi='cd ~/.config/wofi && ${EDITOR} ~/.config/wofi/style.css'
alias v-swww='cd ~/.config/swww/scripts && ${EDITOR} ~/.config/swww/scripts/change_wallpaper'
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
if [ -e "$HOME/.cargo/bin/eza" ]; then
    alias ls='eza --icons --colour=always --binary --header'
    alias la='eza --all --icons --long --colour=always --binary --header'
    alias ll='eza --icons --long --colour=always --binary --header'
else
    alias ll='ls -l'
    alias la='ls -la'
fi

################################
#
# Functions
#
################################

function current_git () {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
        printf "%s" " "
    fi
}

function current_kernel () {
    printf "%s" "$(uname -r)"
}

function current_host () {
    printf "%s" "$(uname -a | awk '{print $2}')"
}

function current_user () {
    printf "%s" "$(users | awk '{print $1}')"
}

function current_path () {
    CUR_PWD="${PWD/#$HOME/\~}"
    
    if [ "${#CUR_PWD}" -gt "30" ]; then
    	#printf "%s" "${CUR_PWD:0:30-3}..."
        printf "%s" "...${CUR_PWD: -30-3}"
    else
    	printf "%s" "${PWD/#$HOME/\~}"
    fi
}

function current_time () {
    printf "%s" "$(date +%r | xargs)"    
}

################################
#
# Prompts
#
################################

### PS1

function simple_and_functional() {
	PS1=''${blu}'$(current_git)'${pur}''${grn}'$(current_host)'${blu}' | '${pur}'$(current_user) '${blu}'|'${ylw}' $(current_path)'${grn}' \$ '${clr} 
}

function artix_iso() {
	PS1=''${grn}'$(current_host)'${clr}':'${red}'['${blu}'$(current_user)'${red}']'${clr}':'${pur}'$(current_path)'${ylw}' \$ '${clr} 
}

function arch_iso() {
    PS1=''${red}'$(current_user)'${clr}'@$(current_host) $(current_path) # '
}

function gentoo_iso() {
    PS1=''${grn}'$(current_user)@$(current_host) '${blu}'$(current_path) '${clr}'% '
}

function general_iso() {
    PS1=''${grn}'$(current_user)@$(current_host) '${blu}'$(current_path) \$'${clr}' '
}

function useful_shell() {
    PS1='\n'${red}'╔('${grn}'$(current_host)'${red}')'═'('${blu}'$(current_user)'${red}')'═'('${cyn}'$(current_kernel)'${red}')'═'('${pur}'$(current_time)'${red}')\n╚'${red}'('${ylw}'$(current_path)'${red}')'${blu}' => '${clr}''
}

function nice_shell_artix() {
    PS1=''${grn}'$(current_git)'${blu}'  '${clr}'$(current_path) '${blu}' '${clr}''
}

function nice_shell_void() {
    PS1=''${blu}'$(current_git)'${grn}'  '${clr}'$(current_path) '${grn}' '${clr}''
}

function simplistica() {
    PS1=''${ylw}'$(current_path)\n'${blu}' '${clr}''
}

function powerliney() {
    PS1=''${ylw}'$(current_path) '${pur}' '${blu}'$(current_user)@$(current_host) '${pur}' '${clr}''
}

function default_shell() {
    PS1='[\u@\h \W]\$ '
}

### PS2

function nice_arrow() {
    PS2=''${blu}'=> '${clr}''
}

function small_arrow() {
    PS2=''${blu}'-> '${clr}''
}

function default_arrow() {
    PS2=''${clr}'> '
}   

function pretty_angle() {
    PS2=''${pur}' '${clr}''
}   

function pretty_dollar() {
    PS2=''${pur}': '${clr}''
}   

hg() {
    history | grep "$1";
}

duhk() {
    du -h --max-depth=1 | sort -hk 1,1
}

bf() {
    du -h -x -s -- * | sort -r -h | head -20;
}

die() {
    pkill -SIGKILL $1
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
    #useful_shell           # two line bash prompt with much information
    #nice_shell_artix       # simple shell i use (artix)
    #nice_shell_void        # simple shell i use (void)
    #arch_iso               # prompt based on artix live iso
    #artix_iso              # prompt based on artix live iso
    #gentoo_iso             # prompt based on gentoo live iso
    #general_iso            # prompt based on mostly all linux distros defaults
    #default_shell          # default bash prompt
    simplistica            # simple, kinda like those zsh prompts or something
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
    pokemon-colorscripts --no-title -r 

else 
    artix_iso              # prompt based on artix live iso
    nice_arrow             # simple fat blue arrow 
fi

### EOF ###
