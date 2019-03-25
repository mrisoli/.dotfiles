syntax on
set number relativenumber
set ruler
set cursorline
set nocompatible
set background=dark
set autoindent
set incsearch
set hlsearch
set backspace=indent,eol,start
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter
set expandtab
set smartindent
set smarttab
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

set rtp+=~/.fzf

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:ag_working_path_mode="r"
""
"" Backup and swap files
""

set backupdir=~/.vim/.backup//    " where to put backup files.
set directory=~/.vim/.tmp//      " where to put swap files.


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight ALEWarning ctermbg=DarkGrey
highlight ALEError ctermbg=DarkRed

" make json pretty
com! FormatJSON %!python -m json.tool

call plug#begin('~/.vim/plugged')
Plug 'bronson/vim-trailing-whitespace'

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

Plug 'w0rp/ale'

Plug 'chemzqm/vim-jsx-improve'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'rhysd/vim-crystal'
Plug 'elixir-editors/vim-elixir'
Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'

Plug 'wakatime/vim-wakatime'
call plug#end()
