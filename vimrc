set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'roman/golden-ratio'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-sensible'
" Plugin 'slim-template/vim-slim'
" Try another plugin because this one is SLOW
Plugin 'onemanstartup/vim-slim'
Plugin 'tpope/vim-surround'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'StanAngeloff/php.vim'
Plugin 'DataWraith/auto_mkdir'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
" Plugin 'mxw/vim-jsx'
Plugin 'junegunn/fzf.vim'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
Plugin 'posva/vim-vue'
Plugin 'zxqfl/tabnine-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'digitaltoad/vim-pug'
Plugin 'dracula/vim', { 'name': 'dracula' }

set rtp+=/usr/local/opt/fzf

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()

let g:ruby_path = system('echo $HOME/.rbenv/shims')
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.5'


""
"" Basic Setup
""

set number                                  " Show line numbers
set relativenumber                          " Show relative line number
set ruler                                   " Show line and column number
syntax enable                               " Turn on syntax highlighting allowing local overrides
set encoding=utf-8                          " Set default encoding to UTF-8
let base16colorspace=256
color dracula                               " Set Theme
set background=dark
set wrap                                    " Wrap lines
set autoread                                " Auto reload changed files
execute "set colorcolumn=" . join(range(81,335), ',')

if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1

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

set macligatures
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
" set guifont=Fira\ Code:h19
set guifont=Delugia\ Nerd\ Font:h17

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

" Highlight trailing whitespace with a red background
highlight SpecialKey guifg=#222222 guibg=#FF0000

au BufRead,BufNewFile *.md set filetype=markdown

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator app/decorators -glob=**/* -suffix=_decorator.rb

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" keyboard shortcuts
let mapleader = ','
nmap <leader>a :Ack!<Space>
nmap <leader>d :NERDTreeToggle<CR>
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader>/ :noh<CR>
nmap <leader>v :vs<CR>
map <leader>s :sp<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>w :w<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Use Silver Searcher instead of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

set re=1

set rtp+=/usr/local/opt/fzf
