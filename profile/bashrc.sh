## Git
alias gss="git status --short"
alias gst="git status"

export PATH=${HOME}/.local/bin:${PATH}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[${bold}\]\u ::: \[$reset\][\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" -\")\$(parse_git_branch)] \$ \[$reset\]" 
export GREP_OPTIONS='--color=auto'

# Rust
source $HOME/.cargo/env

# K8S
source <(kubectl completion bash)
alias kc=kubectl

# Bash history ignore leading space
export HISTCONTROL=ignorespace
