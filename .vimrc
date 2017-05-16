
" .vimrc resources
" https://github.com/mtarbit/dotfiles/blob/master/source/.vimrc
" http://items.sjbach.com/319/configuring-vim-right


" ------------------------------------------------------------------------------
" General Setup
" -----------------------------------------------------------------------------
let mapleader = ','

" Don't hobble vim in favour of vi-compatibility.
set nocompatible

" Set font
set gfn=menlo:h15
set linespace=3

" Display the status line always
set laststatus=2

" Don't wrap lines.
set nowrap

" File-type highlighting and configuration.
syntax on
filetype plugin on
filetype indent on

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
" GUI
" ------------------------------------------------------------------------------

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  " Command-0 goes to the last tab
  noremap <D-9> :tablast<CR>
endif

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

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

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

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'adinapoli/vim-markmultiple'

call plug#end()

" nerdtree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeMapOpenInTab='<ENTER>'

" ctrlp.vim
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ctrlsf.vim
nmap <D-F> :CtrlSF<space>
nmap <C-F> :CtrlSF<space>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/node_modules/*,*/dist/*,*/build/*

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" Theme
colorscheme onedark

