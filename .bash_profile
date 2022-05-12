export PATH=/usr/local/bin:$PATH

# -----------------------------------------------
# Load scripts
# -----------------------------------------------

# GIT
# https://github.com/git/git/tree/master/contrib/completion

# git branch prompt script.
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# git auto completion script
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi


# -----------------------------------------------
# Alias
# -----------------------------------------------

alias ls='ls -G'
alias ll='ls -Gla'
alias llg='ll | grep'
alias cd..='cd ..'
alias deldsstore="find . -type f -name '*.DS_Store' -ls -delete"
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gpa="ls -d \"$PWD\"/* | xargs -I{} sh -c 'printf \"\x1b[32m{} \x1b[0m \n\"; git -C {} pull; printf \"\n\"'"
alias gpall="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"

# -----------------------------------------------
# PS1
# -----------------------------------------------

# colours: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;35m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\n\w$MAGENTA\$(__git_ps1)$NO_COLOUR\n▲ "
