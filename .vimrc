" .vimrc resources
" https://github.com/mtarbit/dotfiles/blob/master/source/.vimrc
" http://items.sjbach.com/319/configuring-vim-right

" ------------------------------------------------------------------------------
" General Setup
" -----------------------------------------------------------------------------

let mapleader = ','

set nocompatible " Don't hobble vim in favour of vi-compatibility.

set nowrap            " Don't wrap lines.
set mouse=a           " Enable mouse support
set visualbell t_vb=  " Don't beep or flash as an alert.

set list              " Show non-printable characters.
let &listchars = 'tab:> ,extends:>,precedes:<,nbsp: ,trail:.'

" Set font
" set gfn=menlo:h15
" set linespace=3
set linespace=3
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h13
" set gfn=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h13

" Display the status line always
set laststatus=2

" File-type highlighting and configuration.
syntax on
filetype plugin on
filetype indent on

" Command completion
set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches

" Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/node_modules/*,*/dist/*,*/build/*,*DS_Store*


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

" display gui tabs
" set guioptions+=e


" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2       " Use spaces instead of tabs.
set expandtab       " Use spaces instead of tabs.

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·


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

Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'

call plug#end()

" nerdtree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeHijackNetrw=0
" map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set guioptions-=L " remove nerdree scrollbar
let g:nerdtree_tabs_open_on_gui_startup=0

noremap <c-1> :tabn 1<CR>
noremap <c-2> :tabn 2<CR>
noremap <c-3> :tabn 3<CR>
noremap <c-4> :tabn 4<CR>
noremap <c-5> :tabn 5<CR>
noremap <c-6> :tabn 6<CR>
noremap <c-7> :tabn 7<CR>
noremap <c-8> :tabn 8<CR>
noremap <C-9> :tablast<CR>

" devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
set ambiwidth=double

" ctrlp.vim
let g:ctrlp_map = '<C-p>'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" open ctrlp.vim in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" ctrlsf.vim
nmap <D-F> :CtrlSF<space>
nmap <C-F> :CtrlSF<space>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Theme
colorscheme onedark

" emmet
" Using Tab key as abbreviation expander
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" ------------------------------------------------------------------------------
" Other
" ------------------------------------------------------------------------------

" Watch for .vimrc changes
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

