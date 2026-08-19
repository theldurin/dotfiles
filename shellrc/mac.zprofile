eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;$\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export HOMEBREW_NO_ENV_HINTS=1

# Adding .local executables to PATH
PATH=~/.local/bin:$PATH
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -alFhrt'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias sudo='sudo '
alias now='date +"%T"'
alias python='python3'

# Function to toggle the Dock size lock
toggledock() {
    current=$(defaults read com.apple.dock size-immutable 2>/dev/null)

    if [ "$current" = "1" ]; then
        defaults write com.apple.dock size-immutable -bool no
        echo "Dock unlocked (resizable)."
    else
        defaults write com.apple.dock size-immutable -bool yes
        echo "Dock locked (immutable)."
    fi

    killall Dock
}


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

