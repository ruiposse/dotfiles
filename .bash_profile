
# -----------------------------------------------
# Load scripts
# -----------------------------------------------

# GIT
# https://github.com/git/git/tree/master/contrib/completion

# git branch prompt script.
if [ -f ~/.git-completion.bash ]; then
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
alias cd..='cd ..'
alias deldsstore="find . -type f -name '*.DS_Store' -ls -delete"

# -----------------------------------------------
# PS1
# -----------------------------------------------

# colours: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;35m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\u:\w$MAGENTA\$(__git_ps1)$NO_COLOUR\$ "
