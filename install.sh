#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# colors
YELLOW="\033[0;33m"
NO_COLOR="\033[0m"

#
# install software
#

# brew
if which brew >/dev/null
then
  echo $YELLOW"brew was already installed"$NO_COLOUR
else
  echo $YELLOW"Install brew/n"$NO_COLOUR
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  echo "brew done/n"
fi

# node
# https://changelog.com/posts/install-node-js-with-homebrew-on-os-x
if which node >/dev/null
then
  echo $YELLOW"node was already installed"$NO_COLOUR
else
  echo $YELLOW"Install node"$NO_COLOUR
  brew install node
  echo $YELLOW"node done"$NO_COLOUR
fi

# n
# https://github.com/tj/n
if which n >/dev/null
then
  echo $YELLOW"n was already installed"$NO_COLOUR
else
  echo $YELLOW"Install n"$NO_COLOUR
  npm install -g n
  echo $YELLOW"n done"$NO_COLOUR
fi

# yarn
# https://yarnpkg.com/
if which yarn >/dev/null
then
  echo $YELLOW"yarn was already installed"$NO_COLOUR
else
  echo $YELLOW"Install yarn"$NO_COLOUR
  brew install yarn
  echo $YELLOW"n done"$NO_COLOUR
fi

# Hyper
# https://github.com/zeit/hyper 
echo $YELLOW"Install Hyper"$NO_COLOUR
brew cask install hyper
echo $YELLOW"Hyper done"$NO_COLOUR

#
# dotfiles
#

# clone repo
git clone https://github.com/ruiposse/dotfiles.git /tmp/dotfiles

# git
echo $YELLOW"Instal git configs"$NO_COLOUR

# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/.git-completion.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh 
fi
cp /tmp/dotfiles/.gitconfig ~/

echo $YELLOW"Done"$NO_COLOUR

# vim
echo $YELLOW"Instal vim configs"$NO_COLOUR
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp /tmp/dotfiles/.vimrc ~/
echo $YELLOW"Done"$NO_COLOUR

# bash_profile
echo $YELLOW"Install bash configs"$NO_COLOUR
cp /tmp/dotfiles/.bash_profile ~/
source ~/.bash_profile
echo $YELLOW"Done"$NO_COLOUR

#
# clean up
#
echo $YELLOW"Cleaning up..."$NO_COLOUR
rm -rf /tmp/dotfiles
echo $YELLOW"Done"$NO_COLOUR


