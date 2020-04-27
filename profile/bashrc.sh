## Git
alias gss="git status --short"
alias gst="git status"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[${bold}\]will.kamp ::: \[$reset\][\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" -\")\$(parse_git_branch)] \$ \[$reset\]"
export GREP_OPTIONS='--color=auto'

# Bash history ignore leading space
export HISTCONTROL=ignorespace

# Macos - no i don't want zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
export ANDROID_HOME=${ANDROID_SDK_ROOT}
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${ANDROID_HOME}/emulator:${PATH}
export ANDROID_NDK="${ANDROID_HOME}/ndk/21.0.6113669"

findtxt() {
  find $1 -type f -print | xargs grep "$2"
}


# vim style command line editing
set -o vi
#default set -o emacs

export CDPATH=.:${HOME}/source

# unlimited history
export HISTFILESIZE=""

# dedupe history
export HISTCONTROL=ignoredups:ignorespace

# shared bash history in all shells
export PROMPT_COMMAND="history -a; history -c; history -r"

# keep history between bash runs
shopt -s histappend

# unix expects EDITOR to block.  Use “open -W” for IDE’s:
export EDITOR="vim"

# brew install git bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'
alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"
alias awk3="awk '{print \$3}'"
alias awklast="rev | awk1 | rev"

alias vimod="vim \`git st | grep -v '??' | rev | awk1 | rev\`"
alias vidiff="vim \`git diff --name-status master | rev | awk1 | rev\`"

# https://github.com/AdoptOpenJDK/homebrew-openjdk
jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}

jdk "1.8"
