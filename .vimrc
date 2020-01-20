
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
Plug 'janko/vim-test'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'neovimhaskell/haskell-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ElmCast/elm-vim'
Plug 'andys8/vim-elm-syntax'

Plug 'elixir-editors/vim-elixir'

Plug 'wakatime/vim-wakatime'

Plug 'arcticicestudio/nord-vim'

Plug 'jremmen/vim-ripgrep'

call plug#end()

syntax on
set number relativenumber " show line number and lines relative to the current line
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

colorscheme nord

filetype plugin indent on

runtime macros/matchit.vim

map <C-n> :NERDTreeToggle<CR>

" project wide sed
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move to the next buffer
nmap <leader>l :bnext<CR>
"
" Move to the previous buffer
nmap <leader>h :bprevious<CR>

""--------
"" airline
""--------

let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1

""--------
"" airline
""--------

""--------
"" ale
""--------

nnoremap <Leader>g :ALEGoToDefinition<CR>
nnoremap <Leader>f :ALEFindReferences<CR>
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
""let g:ale_set_loclist = 0
""let g:ale_set_quickfix = 1
""let g:ale_open_list = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

hi ALEWarning ctermbg=DarkGrey
hi ALEError ctermfg=DarkYellow ctermbg=DarkRed cterm=underline

""--------
"" ale
""--------

""--------
"" ctrl-p
""--------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

""--------
"" ctrl-p
""--------

""--------
"" coc
""--------

set updatetime=300

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

""--------
"" coc
""--------

""--------
"" fzf
""--------

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:ag_working_path_mode="r"

set rtp+=~/.fzf

""--------
"" fzf
""--------

""--------
"" test
""--------

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

""--------
"" test
""--------

map <C-e> :redir @+<CR>:1messages<CR>:redir END<CR>


""
"" Backup and swap files
""

set backupdir=~/.vim/.backup//    " where to put backup files.
set directory=~/.vim/.tmp//      " where to put swap files.

hi MatchParen cterm=bold ctermbg=white ctermfg=magenta
