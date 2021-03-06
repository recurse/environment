#!/bin/sh

if [ -f ~/.githubtoken ]; then
    export HOMEBREW_GITHUB_API_TOKEN=$(cat .githubtoken)
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:/Users/andrae/.local/bin"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

if [ -f ~/.dircolors ]; then
	eval $(gdircolors -b ~/.dircolors)
fi

alias ls="ls --color=always" 
alias grep="grep --color=always"
alias egrep="egrep --color=always"

eval "$(stack --bash-completion-script stack)"

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

function __provide_git_info {
    git branch &>/dev/null
    if [ $? -eq 0 ]; then
        git status | grep "Your branch is up-to-date" > /dev/null 2>&1
        if [ "$?" -eq "0" ]; then
            echo $(__git_ps1 " (%s)")
        else \
            echo $(__git_ps1 " {%s}")
        fi
    fi
}

export CLICOLOR=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export PS1="\[\e[0;36m\][\T] \[\e[1;32m\]\h\[\e[1;36m\]:\[\e[0;32m\]\w \[\e[1;35m\](\u)\n\[\e[1;31m\]\$(__provide_git_info) \[\e[0;34m\]\$ \[\e[1;36m\]"
eval `dircolors $HOME/src/thirdparty/dircolors-solarized/dircolors.ansi-dark`
alias 'ls=ls --color=auto'
