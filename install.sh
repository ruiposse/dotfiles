#!/usr/bin/env zsh

# Exit immediately if a command exits with a non-zero status
set -e

# colors
YELLOW="\033[0;33m"
NO_COLOR="\033[0m"

#
# install software
#

# brew
if command -v brew >/dev/null 2>&1
then
  echo $YELLOW"brew was already installed"$NO_COLOR
else
  echo $YELLOW"Install brew\n"$NO_COLOR
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  echo "brew done\n"
fi

# node
# https://changelog.com/posts/install-node-js-with-homebrew-on-os-x
if command -v node >/dev/null 2>&1
then
  echo $YELLOW"node was already installed"$NO_COLOR
else
  echo $YELLOW"Install node"$NO_COLOR
  brew install node
  echo $YELLOW"node done"$NO_COLOR
fi

# nvm
# https://github.com/nvm-sh/nvm
# nvm is a shell function, so check for the install dir/script instead of command -v
NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]
then
  echo $YELLOW"nvm was already installed"$NO_COLOR
else
  echo $YELLOW"Install nvm"$NO_COLOR
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
  # Load nvm into current shell session
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  echo $YELLOW"nvm done"$NO_COLOR
fi

# yarn
# https://yarnpkg.com/
#if command -v yarn >/dev/null 2>&1
#then
#  echo $YELLOW"yarn was already installed"$NO_COLOR
#else
#  echo $YELLOW"Install yarn"$NO_COLOR
#  brew install yarn
#  echo $YELLOW"yarn done"$NO_COLOR
#fi

# ag (the silver searcher)
if command -v ag >/dev/null 2>&1
then
  echo $YELLOW"ag was already installed"$NO_COLOR
else
  echo $YELLOW"Install ag"$NO_COLOR
  brew install the_silver_searcher
  echo $YELLOW"ag done"$NO_COLOR
fi

#
# dotfiles
#

# Use ~/.dotfiles; clone there if it doesn't exist
DOTFILES_DIR="$HOME/.dotfiles"
if [ -d "$DOTFILES_DIR/.git" ]; then
  echo $YELLOW"Updating existing dotfiles repo"$NO_COLOR
  git -C "$DOTFILES_DIR" pull --ff-only || true
else
  echo $YELLOW"Cloning dotfiles to $DOTFILES_DIR"$NO_COLOR
  git clone https://github.com/ruiposse/dotfiles.git "$DOTFILES_DIR"
fi

# helper to create safe symlinks
link_file() {
  src="$1"
  dest="$2"

  # ensure src exists
  if [ ! -e "$src" ]; then
    echo $YELLOW"Source $src does not exist, skipping"$NO_COLOR
    return 1
  fi

  # if dest is a symlink pointing to src, nothing to do
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo $YELLOW"$dest already symlinked to $src"$NO_COLOR
    return 0
  fi

  # if dest exists (file/dir/or different symlink), back it up
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    backup="${dest}.$(date +%Y%m%d%H%M%S).bak"
    echo $YELLOW"Backing up $dest -> $backup"$NO_COLOR
    mv "$dest" "$backup"
  fi

  # create parent dir if necessary
  dest_dir="$(dirname "$dest")"
  [ -d "$dest_dir" ] || mkdir -p "$dest_dir"

  ln -s "$src" "$dest"
  echo $YELLOW"Linked $dest -> $src"$NO_COLOR
}

# git
echo $YELLOW"Install git configs"$NO_COLOR
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/.git-completion.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh 
fi
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
echo $YELLOW"Done"$NO_COLOR

# vim
echo $YELLOW"Install vim configs"$NO_COLOR
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
echo $YELLOW"Done"$NO_COLOR

# zshrc
echo $YELLOW"Install zsh configs"$NO_COLOR
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
# reload zshrc in the current session
if [ -e "$HOME/.zshrc" ]; then
  source "$HOME/.zshrc" 2>/dev/null || true
fi
echo $YELLOW"Done"$NO_COLOR

# tmux
echo $YELLOW"Install tmux configs"$NO_COLOR
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
echo $YELLOW"Done"$NO_COLOR
