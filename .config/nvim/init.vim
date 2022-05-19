"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Index
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General - I don't even know what some of these do...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug might not work with fish shell - Invisible to user
set shell=/bin/bash

" Sets how many lines VIM needs to remmember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set shiftwidth=2

set autoindent
set shiftround
set softtabstop=2
set cursorline

set tabstop=4

" Clipboard
" -- Copy to and Paste-from system's clipboard
vnoremap <leader>y "+y<Return>
nnoremap <leader>p "+p<Return>

" Yank-all-file
" -- Get all the file's content in yank
nmap yaf ggVG"+y

" Format-all-file
nmap faf ggVG=<C-o>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set showcmd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping overwrites
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disabled commands
nmap Q <nop>
nmap q <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Sort highlighted lines in visual mode
vmap <leader><leader> :sort<Return>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searc results appears in center of screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Map <Space> to / (search)
map <space> /


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')



" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Copilot
Plug 'github/copilot.vim'


" Status bar styling
Plug 'vim-airline/vim-airline'


" Linting
Plug 'w0rp/ale'
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'


" Parens, brackets and curlies
Plug 'tpope/vim-surround'


" Fuzzy-find Files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --path-to-ignore ~/.ignore -g ""'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  nmap <leader>f :Files<CR>


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
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
  cnoreabbrev Ack Ack!
  nnoremap <leader><space> :Ack! -Q ""<Left>


" Display Trailing WhiteSpace
" -- Bonus:
" ---- Remove all trailing whitespace with <BS>
" ---- Also removes search (/)
Plug 'bronson/vim-trailing-whitespace'
  nmap <BS> :FixWhitespace<Return>:noh<Return>

" Create new directories within vim with :Mkdir
Plug 'tpope/vim-eunuch'


" Javascript
Plug 'pangloss/vim-javascript'
  let g:javascript_plugin_flow = 1
Plug 'maxmellon/vim-jsx-pretty'


" Prettier
Plug 'prettier/vim-prettier'
  nmap <leader>p :Prettier<Return>


" TypeScript
Plug 'HerringtonDarkholme/yats.vim'


" Prisma ORM
Plug 'pantharshit00/vim-prisma'


" Docker
Plug 'ekalinin/dockerfile.vim'


" Markdown
Plug 'tpope/vim-markdown'


" Rust
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
Plug 'cespare/vim-toml'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
  let g:mix_format_on_save = 1


" Firestore
Plug 'delphinus/vim-firestore'


" To install packages, run command `:PlugInstall`
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
