#!/bin/sh

#if [ -f ~/.githubtoken ]; then
#    export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.githubtoken)
#fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.local/bin:$HOME/.daml/bin"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

if [ -f ~/.dircolors ]; then
	eval $(gdircolors -b ~/.dircolors)
fi

# eval "$(stack --bash-completion-script stack)"

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

#source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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
export PS1="\[\e[36m\][\T] \[\e[92m\]\h\[\e[36m\]:\[\e[32m\]\w \[\e[2;95m\](\u) \[\e[22;91m\]\$(__provide_git_info) \[\e[34m\]\n\$ \[\e[96m\]"
#eval `dircolors $HOME/src/thirdparty/dircolors-solarized/dircolors.ansi-dark`

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export DH_IMAGE_REGISTRY=index.docker.io/library
export IMAGE_REGISTRY=digitalasset

eval "$(direnv hook bash)"
if [ -e /Users/andraemuys/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/andraemuys/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
