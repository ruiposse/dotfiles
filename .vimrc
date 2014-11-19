
" .vimrc resources
" https://github.com/mtarbit/dotfiles/blob/master/source/.vimrc


set nocompatible
filetype off

" ------------------------------------------------------------------------------
" Vundle
" -----------------------------------------------------------------------------
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle "gmarik/vundle"

" FileBrowser
Bundle "scrooloose/nerdtree"

" Fuzzy Search
Bundle "kien/ctrlp.vim"

" Zen
Bundle "mattn/emmet-vim"

Bundle "bling/vim-airline"
let g:airline#extensions#tabline#enabled = 1

call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------------------------
" General Setup
" -----------------------------------------------------------------------------

" Center cursor vertically (http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen)
set so=999

" Command completion
" http://items.sjbach.com/319/configuring-vim-right
" https://github.com/skwp/dotfiles/blob/master/vimrc
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


set ruler

" Number lines (using relative line-numbering if it's available)
" if exists('+relativenumber')
"     set relativenumber
" else
     set number
" endif


" ------------------------------------------------------------------------------
" Colouring
" ------------------------------------------------------------------------------

" Turn on syntax-highlighing.
syntax on

" Worthwhile schemes: elflord, molokai, mustang, matts-mustang, matts-light
" colorscheme matts-light

" Use fancy colours.
set t_Co=256

