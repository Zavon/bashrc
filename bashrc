#=====================================#
# Zavon's bashrc                      #
#=====================================#



#=====================================#
# Text Styling  - BlackIkeEagle       #
#=====================================#
unset COLBLK COLRED COLGRN COLYLW
unset COLBLU COLPUR COLCYN COLWHT
unset REG BLD UND
unset BGBLK BGRED BGGRN BGYLW
unset BGBLU BGPUR BGCYN BGWHT
unset TXRES

if [[ -t 2 ]]; then
    # front colors
    COLBLK='30m'
    COLRED='31m'
    COLGRN='32m'
    COLYLW='33m'
    COLBLU='34m'
    COLPUR='35m'
    COLCYN='36m'
    COLWHT='37m'

    # text modes
    REG='\033[0;'
    BLD='\033[1;'
    UND='\033[4;'

    # background colors
    BGBLK='\033[40;30m'
    BGRED='\033[41;30m'
    BGGRN='\033[42;30m'
    BGYLW='\033[43;30m'
    BGBLU='\033[44;30m'
    BGPUR='\033[45;30m'
    BGCYN='\033[46;30m'
    BGWHT='\033[47;30m'

    # reset styling
    TXRES='\033[0;0m'
fi
readonly COLBLK COLRED COLGRN COLYLW
readonly COLBLU COLPUR COLCYN COLWHT
readonly REG BLD UND
readonly BGBLK BGRED BGGRN BGYLW
readonly BGBLU BGPUR BGCYN BGWHT
readonly TXRES


#=====================================#
# Alias                               #
#=====================================#
alias snano='sudo nano'
alias svi='sudo vim'
alias diff='colordiff'
alias grep='grep --color=auto'
alias ping='ping -c 5'

# Pacman #
alias pacu='pacman -Syu' # Sync with full system upgrade
alias pacy='pacman -Syy' # Repo Synco
alias pacr='pacman -R' # Remove package
alias pacrs='pacman -Rs' # Remove package and dependencies which are not required by any other installed package
alias pacrd='pacman -Rdd' # Remove a package, which is required by another package, without removing the dependent package
alias pacrsc='pacman -Rsc' # Remove a package, its dependencies and all the packages that depend on the target package
alias pacrn='pacman -Rn' # Remove package and prevent the creation of these backup config files
alias pacsc='pacman -Sc' # Remove all the cached packages that are not currently installed
alias pacsg='pacman -Sg' # See what packages belong to the group
alias listforeign='pacman -Qm' # List foreign packages

# AUR #
alias mkaball='mkaurball' # Make AUR ball
alias mkpkg='makepkg -s' # Make package and install dependencies

# Power Management #
alias reboot='sudo reboot'
alias off='sudo shutdown now'
alias shutdown='sudo shutdown'

# ls #
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'



# Extract Archived Files using "extract"
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjvpf $1 ;;
      *.tar.gz) tar xzvpf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvpf $1 ;;
      *.tbz2) tar xjvpf $1 ;;
      *.tgz) tar xzvpf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# cd and ls
cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}
#=====================================#
# Default prompt colors               #
#=====================================#
if [ `id -u` == "0" ]; then
	PSCOL=${REG}${COLRED};
	USRCOL=${BLD}${COLRED};
fi

#=====================================#
# Session colors tty/ssh/screen       #
#=====================================#
if [ "$STY" != "" ]; then
	# screen
	SESSCOL=${BLD}${COLCYN}
elif [ "$SSH_CLIENT" != "" ]; then
	# SSH
	SESSCOL=${BLD}${COLRED}
else
	SESSCOL=${PSCOL}
fi


#=====================================#
# Configure prompt                    #
#=====================================#
PS1="\[${PSCOL}\]┌─┤\[${TXRES}\]\$(smiley)\[${TXRES}\]\[${PSCOL}\]├─┤\[${TXRES}\]\[${SESSCOL}\]\t\[${TXRES}\]\[${PSCOL}\]├─┤\[${TXRES}\]\[${USRCOL}\]\u\[${TXRES}\]\[${PSCOL}\] @ \[${TXRES}\]\[${HSTCOL}\]\h\[${TXRES}\]\[${PSCOL}\]├─┤\[${TXRES}\]\$(fldcol)\w\[${TXRES}\]\[${PSCOL}\]├\[${TXRES}\]\$(scmbranch)\[${TXRES}\]\[${PSCOL}\]─╼\n└╼\[${TXRES}\] "
PS2="\[${PSCOL}\]╶╼\[${TXRES}\] "
PS3="\[${PSCOL}\]╶╼\[${TXRES}\] "
PS4="\[${PSCOL}\]╶╼\[${TXRES}\] "

export PS1 PS2 PS3 PS4

# Auto Cd
shopt -s autocd
