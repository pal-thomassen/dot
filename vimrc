set nocompatible               " be iMproved
filetype on
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'chrisbra/color_highlight'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-fakeclip'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

colorscheme solarized
if ($TERMINAL_DARK == '1')
  set background=dark
else
  set background=light
endif      

:let g:tabular_loaded = 1

" Generic Options
set t_Co=256
set laststatus=2
set encoding=utf-8
syntax on
filetype plugin indent on     " required!
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
filetype plugin indent on
set autoindent
set smartindent
set number
set showcmd
set ruler
set expandtab
set autoread
set shiftwidth=2
set tabstop=2
hi MatchParen ctermbg=black ctermfg=none cterm=underline
set fo-=r
set wildignore+=node_modules
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.beam
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.ico
set wildignore+=.sass-cache,.DS_Store,.bundle
set wildignore+=.coffee.js
set wildignore+=*.rbc,*.scssc,*.sassc
set wildignore+=*/spec/dummy/*
set wildignore+=*/tmp/*
let mapleader=" "
set nofoldenable    " disable folding

set backspace=indent,eol,start

" Count inside an html tag as a pair eg <span>hello</span>
set matchpairs+=>:<

noremap ; :

" jump more naturally between wrapped lines
noremap j gj
noremap k gk

" HTML tags count as pairs
set matchpairs+=>:<

" jump more naturally between wrapped lines
noremap j gj
noremap k gk

inoremap Hh <Esc>

set title
set ttyfast
set nobackup
set noswapfile
set scrolloff=3

" easier window nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" splits open in more logical spots
set splitbelow
set splitright

" tab completion in command line
set wildmode=list:longest

" tmux mouse support
set ttymouse=xterm2
" drag panes with mouse
set mouse=a

" Remove trailing whitespace 
map <Leader>w :%s/\s\+$//e<CR>

" highlight search results, and remove highlight if needed
set hlsearch
nmap <Leader>h :nohl<CR>

" Global replace by default
set gdefault

" NERDTree
:map <Leader>r :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = []
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1

" Ag
map <Leader>n :cn<CR>
map <Leader>N :cN<CR>
map <Leader>s :Ag 

" Ctrl p
let g:ctrlp_working_path_mode = ''
map <Leader>t :CtrlP<CR>
map <Leader>g :CtrlPMRU<CR>
map <Leader>f :CtrlPLine<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_switch_buffer = 0
:let g:ctrlp_match_func = {'match': 'matcher#cmatch'}

" Colorizer
let g:colorizer_auto_filetype='css,html,styl,less'
map <Leader>c :ColorHighlight<CR>

" Source vimrc
map <C-E> :so ~/.vimrc<CR>

" Rainbow Parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Goyo writing mode
function! GoyoBefore()
  :syntax off
  :set linebreak
  :set nojoinspaces
  :set spell
endfunction

function! GoyoAfter()
  :syntax on
  :set nolinebreak
  :set joinspaces
  :set nospell
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

" Powerline
let g:powerline_symbols = 'fancy'
