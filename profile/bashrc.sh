# General
alias ll='ls -l'
alias cll='clear && ls -l'
alias la='ls -A'
alias cla='clear && ls -A'
alias l='ls -CF'
alias cl='clear && ls -CF'


## Git
alias gss="git status --short"
alias gst="git status"
alias gfdd="git fetch -p origin develop:develop"
alias gfmm="git fetch -p origin master:master"
alias gitdm="git branch -d $(git branch --merged | grep -v master)"
alias emulator="$(dirname "$(which emulator)")"/emulator
if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	white=$(tput setaf 15);
	black=$(tput setaf 0);
	aqua=$(tput setaf 14);
	red=$(tput setaf 167);
	orange=$(tput setaf 173);
	yellow=$(tput setaf 221);
	green=$(tput setaf 143);
	blue=$(tput setaf 110);
	purple=$(tput setaf 139);
	delbg=$(tput setaf 167);
fi;

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[${bold}\]\u \h ::: \[$reset\][\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" -\")\$(parse_git_branch)] \$ \[$reset\]" 
export GREP_OPTIONS='--color=auto'


# Rust
source $HOME/.cargo/env


# K8S
source <(kubectl completion bash)
alias kc=kubectl

# Bash history ignore leading space
export HISTCONTROL=ignorespace
