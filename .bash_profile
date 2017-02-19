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

alias ll='ls -Gla'
alias llg='ll | grep'
alias cd..='cd ..'
alias deldsstore="find . -type f -name '*.DS_Store' -ls -delete"
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


# -----------------------------------------------
# PS1
# -----------------------------------------------

# colours: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;35m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\n\u:\w$MAGENTA\$(__git_ps1)$NO_COLOUR\n→ "
