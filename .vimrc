
" .vimrc resources
" https://github.com/mtarbit/dotfiles/blob/master/source/.vimrc
" http://items.sjbach.com/319/configuring-vim-right


" ------------------------------------------------------------------------------
" General Setup
" -----------------------------------------------------------------------------

" Don't hobble vim in favour of vi-compatibility.
set nocompatible

" Display the status line always
set laststatus=2

" Don't wrap lines.
set nowrap

" File-type highlighting and configuration.
syntax on
filetype on

" Enable mouse support
set mouse=a

" Don't beep or flash as an alert.
set visualbell t_vb=

" Command completion
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

" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·


" ------------------------------------------------------------------------------
" Scrolling
" ------------------------------------------------------------------------------

" set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1

" Center cursor vertically (http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen)
set so=999

set ruler

" Number lines (using relative line-numbering if it's available)
" if exists('+relativenumber')
"     set relativenumber
" else
     set number
" endif


" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------

set hlsearch        " Highlight search terms
" set incsearch       " ...dynamically as they are typed.
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital.


" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'moll/vim-node'

call plug#end()

" nerdtree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" vim-colors-solarized
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

