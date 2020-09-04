"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Index
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Nic Laflamme
"     nic@laflamme.io
"
" Inspiration:
"     https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"
" Sections:
"     -> General
"     -> VIM user interface
"     -> Colors and Fonts
"     -> Text, tab and indentation
"     -> Moving around, tabs, windows and buffers
"     -> Text, tab and indentation
"     -> Status line
"     -> Mapping overwrites
"     -> Searching
"     -> Plugins
"
"
" NOTE: command to install vim-plug (after neovim):
"
"   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle does not work with fish shell
set shell=/bin/bash

" Sets how manu lines VIM needs to remmember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to autoread when a file is changed from outside
set autoread

" Leader remapping
let mapleader = ","
let g:mapleader = ","

" Single finger colon
nmap <leader><leader> :

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>W :wqa!<cr>

set number

" Prevent creation on .swp file on buffer close.
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a minimum 10 line padding to the cursor
set so=10

" Turn on the WiLd menu
set wildmenu

" Always show ruler
set ruler

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set visual bell on error
set visualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab key and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set shiftwidth=2

set autoindent
set shiftround
set softtabstop=2

" Clipboard
vnoremap <leader>y "+y<Return>
nnoremap <leader>p "+p<Return>

" Remove trailing whitespace
nmap <BS> :FixWhitespace<Return>:noh<Return>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between vertical windows
map <C-j> <C-W>j
map <C-l> <C-W>l

" Split tabs bellow and right
set splitbelow
set splitright

" Quick horizontal split & quick tab close
nmap <leader>s :vs<Return>
nmap <leader>d :sp<Return>
nmap <leader>q :q<Return>

" Cycle tabs
nmap <c-v> <C-W>w

" Saving the shift key for :
nmap ; :

" Scroll according to visual line
nnoremap j gj
nnoremap k gk

" Move to line edge
nnoremap H j
nnoremap L $

" Extra scrolling speed
nmap <c-k> 6k6<c-Y>
nmap <c-j> 6j6<c-E>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set showcmd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping overwrites
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typo prevention on exit
command! Q q
command! QA qa
command! Qa qa

command! W w
command! WQ wq
command! Wq wq
command! WQA wqa
command! WQa wqa
command! Wqa wqa

" Disabled commands
nmap Q <nop>
nmap q <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

vmap <leader><leader> :sort<Return>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searc results appears in center of screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Map <Space> to / (search)
map <space> /


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><space> :noh<Return>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')


" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plug 'valloric/youcompleteme'


" Auto close paren pairs
" Plug 'jiangmiao/auto-pairs'

" Status bar styling
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'

" Parens, brackets and curlies
Plug 'tpope/vim-surround'

" Find filename
Plug 'kien/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|elm-stuff|dist\|target'
  let g:ctrlp_show_hidden = 1
  " Recently opened buffers
  nmap <c-b> :CtrlPBuffer<Return>
  nmap <leader>p <c-p>

" Find in project -> `sudo apt-get install silversearcher-ag`
Plug 'mileszs/ack.vim'
" replace ack with ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack! ""<Left>
nnoremap <Leader>A :Ack! <C-r><C-w><CR>

" Directory Tree
Plug 'scrooloose/nerdtree'
  map <C-n> :NERDTreeToggle<CR>
  nmap <leader>n <C-n>

" Display Trailing WhiteSpace
Plug 'bronson/vim-trailing-whitespace'

" Language Support
Plug 'pangloss/vim-javascript'
  let g:javascript_plugin_flow = 1
Plug 'maxmellon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier'
  let g:prettier#autoformat = 1
  let g:prettier#autoformat_config_present = 1
Plug 'elmcast/elm-vim'
  let g:elm_format_autosave = 1
" Plug 'leafgarland/typescript-vim'
"   let g:typescript_indent_disable = 1
Plug 'HerringtonDarkholme/yats.vim'
Plug 'flowtype/vim-flow'
  let g:flow#autoclose = 1
Plug 'ekalinin/dockerfile.vim'
Plug 'digitaltoad/vim-jade'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'groenewege/vim-less'
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1

" Split autoscaling
Plug 'roman/golden-ratio'

" Comments
Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCommentEmptyLines = 1

" Color - somehow this fixed my color problems
Plug 'altercation/vim-colors-solarized'
  set background=dark

" To install packages, run command `:PlugInstall`
call plug#end()

" To get YCM autocompletion
" cd ~/.config/nvim/plugged/YouCompleteMe
" ./install.py

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
