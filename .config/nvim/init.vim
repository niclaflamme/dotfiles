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
"     -> Colors
"     -> Indentation and clipboard
"     -> Moving around, tabs, windows and buffers
"     -> Text, tab and indentation
"     -> Status line
"     -> Mapping overwrites
"     -> Searching
"
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
" => General - I don't even know what some of these do...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug might not work with fish shell - Invisible to user
set shell=/bin/bash

" Sets how many lines VIM needs to remmember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Autoread when a file is changed from outside
set autoread

" Leader remapping
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<Return>

set number

" Prevent creation on .swp file on buffer close.
set noswapfile

" Set a minimum 10 line padding to the cursor
set so=10

" Turn on the WiLd menu
set wildmenu

" Always show ruler
set ruler
set colorcolumn=80

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
" - try to be smart about cases as fallback
set ignorecase
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
set mat=3

" Set visual bell on error
set visualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation and clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set shiftwidth=2

set autoindent
set shiftround
set softtabstop=2
set cursorline

" Clipboard
" -- Copy to and Paste-from system's clipboard
vnoremap <leader>y "+y<Return>
nnoremap <leader>p "+p<Return>

" Yank-all-file
" -- Get all the file's content in yank
nmap yaf ggVG"+y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split tabs bellow and right
" -- Provides consistent window splitting behavior
set splitbelow
set splitright

" Quick horizontal split & quick tab close
" -- I never split horizontally which is why there is no :sp shortcuts
nmap <leader>s :vs<Return>

" Cycle tabs.
" -- LEFT to RIGHT
nmap <leader><leader> <C-W>w

" Go to tab number
" -- You shouldn't have more than 4 tabs open at once.
nmap <leader>1 1<c-w><c-w>
nmap <leader>2 2<c-w><c-w>
nmap <leader>3 4<c-w><c-w>
nmap <leader>4 4<c-w><c-w>

" Like colon, without the shift (; works as :)
" - Rationale, I never user the semicolon
nmap ; :

" Scroll according to visual-line not file-line
nnoremap j gj
nnoremap k gk

" Extra-fast vertical navigation (6x)
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
" Disabled commands
nmap Q <nop>
nmap q <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Sort highlighted lines in visual mode
vmap <leader><leader> :sort<Return>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searc results appears in center of screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Map <Space> to / (search)
map <space> /


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" A.I. powered autocomplete engine
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Status bar styling
Plug 'vim-airline/vim-airline'


" Git integration
" -- I don't know why I have this
Plug 'tpope/vim-fugitive'


" Linting
Plug 'w0rp/ale'
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'


" Parens, brackets and curlies
Plug 'tpope/vim-surround'


" Fuzzy-find Files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap <silent> <leader><f> :Files<CR>


" Dir Tree
Plug 'scrooloose/nerdtree'
  map <leader>n :NERDTreeToggle<CR>


" Active split auto-resizes to ~2/3 of screen
" -- Ooohhh yeahhh
Plug 'roman/golden-ratio'


" Comments
Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCommentEmptyLines = 1


" Find in project
" -- Must install silversearcher-ag on system
Plug 'mileszs/ack.vim'
" replace ack with ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <leader><space> :Ack! ""<Left>


" Display Trailing WhiteSpace
" -- Bonus:
" ---- Remove all trailing whitespace with <BS>
" ---- Also removes search (/)
Plug 'bronson/vim-trailing-whitespace'
  nmap <BS> :FixWhitespace<Return>:noh<Return>


" Javascript
Plug 'pangloss/vim-javascript'
  let g:javascript_plugin_flow = 1
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'
  nmap <leader>p <Plug>(Prettier)


" TypeScript
Plug 'HerringtonDarkholme/yats.vim'


" Docker
Plug 'ekalinin/dockerfile.vim'


" Pug / Jade
Plug 'digitaltoad/vim-jade'


" Markdown
Plug 'tpope/vim-markdown'


" Rust
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
Plug 'cespare/vim-toml'



" To install packages, run command `:PlugInstall`
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
