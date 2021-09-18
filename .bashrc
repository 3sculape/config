#!/bin/bash

# ~/.bashrc
source ~/afs/.confs/git-completion.bash
source ~/afs/.confs/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
    export PATH="$HOME/afs/bin:$PATH"
fi

if [ -d ~/.local/bin ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export LANG='en_US.utf8'
export NNTPSERVER="news.epita.fr"

export EDITOR='vim'
#export EDITOR=emacs

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias ls='ls --color=auto'
alias grep='grep --color -n'
alias ll='ls -la'
alias gita='git add .'
alias gitc='git commit -m'
alias gitp='git push'

Red="0;31m"
Green="0;32m"
Yellow="0;33m"
Blue="0;34m"
Purple="0;35m"

EXIT=0

prompt_git ()
{
    echo -e "\033[${Purple}$(__git_ps1 "(%s) ")\033[m"
}

prompt_name ()
{
    echo -e "\033[${Blue}$USER@$HOSTNAME\033[m"
}

prompt_path ()
{
    PWD_H=$([[ $PWD/ = "$HOME"/* ]] && echo "~${PWD#$HOME}" || echo "$PWD")
    echo -e "\033[${Green}$PWD_H\033[m"
}

prompt_date ()
{
    DATE=$(date +%H:%M:%S)
    echo -e "\033[${Yellow}$DATE\033[m"
}

prompt_error()
{
    [ $EXIT -ne 0 ] && echo -e "\033[${Red}$EXIT\033[m"
}

print_prompt ()
{
    EXIT=$?
    OFFSET=35
    COL=$(tput cols)
    PS1L=$(printf "%s %s %s" "$(prompt_name)" "$(prompt_path)" "$(prompt_git)")
    PS1R=$(printf "%s %s" "$(prompt_error)" "$(prompt_date)")
    PS1L_stripped=${PS1L//\x1B\[[0-9;]*m/}
    PS1=$(printf "%s%$((COL - ${#PS1L_stripped} + OFFSET))s\n\[\033[00m\]$ " "$PS1L" "$PS1R")
}

PROMPT_COMMAND=print_prompt
