set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'roman/golden-ratio'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-sensible'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-surround'
Plugin 'chriskempson/vim-tomorrow-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()

let g:ruby_path = system('echo $HOME/.rbenv/shims')

""
"" Basic Setup
""

set number                                  " Show line numbers
set relativenumber                          " Show relative line number
set ruler                                   " Show line and column number
syntax enable                               " Turn on syntax highlighting allowing local overrides
set encoding=utf-8                          " Set default encoding to UTF-8
color tomorrow-night                        " Set Theme
set wrap                                    " Wrap lines
set autoread                                " Auto reload changed files

" Set font size based on screen size. When vertical height is greater than 800
" (i.e. an external monitor is attached on a regular 13" MBP), use 18, else use 16.
function! SetRelativeFontSize()
  if has('mac')
    if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ',' -f 4 | xargs") > 800
      set guifont=Inconsolata\ for\ Powerline:h18
    else
      set guifont=Inconsolata\ for\ Powerline:h16
    endif
  endif
endfunction

autocmd VimResized * :call SetRelativeFontSize()
autocmd VimEnter * :call SetRelativeFontSize()

" These are advanced settings. The arrow keys won't work at all now.
" Turn off arrow keys in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" pressing j or k in a long wrapped will put cursor down/up one visual line
nnoremap j gj
nnoremap k gk

" Remap control of split windows do be without w first
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set smarttab                      " be smart about tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "•"
set listchars+=trail:•            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
                                  "
" Highlight trailing whitespace with a red background
highlight SpecialKey guifg=#222222 guibg=#FF0000

au BufRead,BufNewFile *.md set filetype=markdown

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" keyboard shortcuts
let mapleader = ','
nmap <leader>a :Ack! 
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :CtrlP<CR>
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader>/ :noh<CR>
nmap <leader>v :vs<CR>
map <leader>s :sp<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>w :w<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Fix bug in vim-slim that makes vim render pages with doctype as html
" https://github.com/slim-template/vim-slim/issues/38
autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim

" Use Silver Searcher instead of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
