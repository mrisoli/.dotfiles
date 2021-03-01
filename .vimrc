call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'

Plug 'arcticicestudio/nord-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'

Plug 'sheerun/vim-polyglot'

Plug 'wakatime/vim-wakatime'

Plug 'diepm/vim-rest-console'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'jparise/vim-graphql'

Plug 'elmcast/elm-vim'

call plug#end()

colorscheme nord

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

filetype plugin indent on

""--------
"" kien/ctrlp.vim
""--------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
""--------
"" kien/ctrlp.vim
""--------

""--------
"" junegunn/fzf
""--------
set rtp+=~/.fzf
""--------
"" junegunn/fzf
""--------

""--------
"" vim-airline/vim-airline
""--------
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
""--------
"" vim-airline/vim-airline
""--------
"
""--------
"" ale
""--------

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" hi ALEWarning ctermbg=DarkGrey
" hi ALEError ctermfg=DarkYellow ctermbg=DarkRed cterm=underline
let g:ale_linters_explicit = 1

""--------
"" ale
""--------

""--------
"" coc
""--------
source ~/.vim/coc.vim
""--------
"" coc
""--------

""--------
"" Backup and swap files
""--------
set backupdir=~/.vim/.backup//    " where to put backup files.
set directory=~/.vim/.tmp//      " where to put swap files.
""--------
"" Backup and swap files
""--------

""--------
"" Navigation
""--------
runtime macros/matchit.vim

" file wide sed
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

hi MatchParen cterm=bold ctermbg=white ctermfg=magenta

" ctags
nnoremap <leader>. :CtrlPTag<cr>

" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.ts,*.js silent! !ctags . &

" project search
nnoremap <leader>g :Rg<cr>

""--------
"" Navigation
""--------

""--------
"" Editing
""--------
"  format json
nmap =j :%!python -m json.tool<CR>

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
""--------
"" Editing
""--------

""--------
"" netrw
""--------

" hide banner
let g:netrw_banner = 0

" make tree style default
let g:netrw_liststyle = 3

" use 25% of screen
let g:netrw_winsize = 25

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

""--------
"" netrw
""--------
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
