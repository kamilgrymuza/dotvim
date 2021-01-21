" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

call plug#begin('~/.local/shared/nvim/plugged')

" NERD Tree (file browser)
Plug 'scrooloose/nerdtree'

" Integrate GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Better commenting support
Plug 'scrooloose/nerdcommenter'

" HTML5 support
Plug 'othree/html5.vim'

" ACK support
Plug 'mileszs/ack.vim'

" A few themes - https://github.com/rafi/awesome-vim-colorschemes
Plug 'rafi/awesome-vim-colorschemes'

" JavaScript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Asynchronous linting
Plug 'w0rp/ale'

" Tree-based undo
Plug 'sjl/gundo.vim'

" HTML5 completion and syntax
Plug 'othree/html5.vim'

" Support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" Dockerfile syntax
Plug 'ekalinin/dockerfile.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }

" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" Supertab for using tab in insert mode
Plug 'ervandew/supertab'

" Vue.js
Plug 'posva/vim-vue'

call plug#end()


" -----------------------------------------------------------------------------
" BASIC VIM SETTINGS 
" -----------------------------------------------------------------------------

" Disable compatibility with VI - in most cases this is superfluous, but
" better to be safe than sorry - see http://stackoverflow.com/
" questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
set nocompatible

" Turn on highlighting by default.
syntax on

" Turn on line numbering by default.
set number

" Set the marker at line 100 to fit the text in 99 columns.
set colorcolumn=100

" Set textwidth used for automatic wrapping to 99 columns.
set textwidth=99

" Enable automatic wrapping of comments but not text to to textwidth.
set formatoptions+=c

" Allow backspacing over autoindents, line breaks and before start of an
" insert.
set backspace=indent,eol,start

" Set default encoding to UTF-8 (helps with NERDTree display issues too).
set encoding=utf-8

" Ensure there are at least 3 lines of "context" visible before scrolling
" starts.
set scrolloff=3

" Mark current line so that it's easier to find especially when searching.
set cursorline

" Enable mouse for all modes.
set mouse=a

" Allow for storing and searching among up to 1K items in command history.
set history=1000

" Ask VIM to hide buffers rather than closing them which allows for preserving
" undo capabilities as long as VIM wasn't closed.
set hidden

" Make sure VIM writes files in such a way that Docker can pick up the changes
set backupcopy=yes

" Disable the bell
set visualbell
set t_vb=

" Don't highlight the last searched string unless asked  
set nohlsearch

" Enable file type detection (filetype on) as well as plugin and indent file
" loading for specific file types.
filetype plugin indent on

" Allow using j/k keys in code completion lists.
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Disable using arrows in normal and insert mode to promote use of h/j/k/l.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Toggle paste mode on <leader>P. 
" Use nmap instead of pastetoggle because it will echo current state.
nmap <leader>P :setlocal paste! paste?<cr>

" Make statusline more useful.
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)


" -----------------------------------------------------------------------------
" COLORS AND THEME
" -----------------------------------------------------------------------------

" Enable more colors - required by some themes.
set termguicolors

" Enable the dark variant
set background=dark

" Turn on a specific theme.
"colorscheme dracula
"colorscheme Apprentice
"colorscheme anderson
colorscheme lucius
"colorscheme pink-moon
"colorscheme solarized8


" -----------------------------------------------------------------------------
" DEFAULT TAB SETTINGS
" -----------------------------------------------------------------------------

" Display 2 space characters instead of a \t when reading a file.
set tabstop=2

" Indent by 2 spaces when using indent command (< and > in visual mode
" or << and >> in normal mode).
set shiftwidth=2

" Expand TAB (\t) to spaces, i.e. in insert mode when a TAB key is hit a number
" of space characters will be inserted instead of a \t. How many is controlled
" with the softtabstop option.
set expandtab

" Insert 2 space characters in insert mode when a TAB key is hit.
set softtabstop=2


" -----------------------------------------------------------------------------
" FILETYPE SPECIFIC TAB SETTINGS
" -----------------------------------------------------------------------------

" Set bigger indent for Python files
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab


" -----------------------------------------------------------------------------
" FILE-TYPE CUSTOMIZATIONS
" -----------------------------------------------------------------------------

" Ensure JavaScript sugar is available in QUnit test files.
autocmd BufRead *_js_test.html set ft=javascript

" Ensure HBS templates are considered HTML.
autocmd BufRead *.hbs set ft=html

" Ensure .conf files have proper syntax
autocmd BufRead *.conf set ft=dosini

" Enable wordpress syntax for php files
autocmd BufEnter *.php :set ft=php



" -----------------------------------------------------------------------------
" NERDTREE
" -----------------------------------------------------------------------------

" Set width of tree window to 40 columns.
let NERDTreeWinSize=40

" Show bookmarks in tree.
let NERDTreeShowBookmarks=1

" Location of the file in which NERDTree keeps its bookmarks.
let NERDTreeBookmarksFile=expand('$HOME/.NERDTreeBookmarks')

" Ignore some files.
let NERDTreeIgnore=['\.pyc$', '^.git$', '\~$', '__pycache__' ]

" Keyboard shortcut for toggling NERDTree on/off.
map <leader>N :NERDTreeToggle<CR>

" Quit VIM if the only window left is a NERDTree window.
autocmd bufenter * if ( winnr("$") == 1 && exists("b:NERDTreeType") &&
      \ b:NERDTreeType == "primary" ) | q | endif

" Show NERDTREE if VIM was started with no arguments (i.e. file to open).
autocmd vimenter * if !argc() | NERDTree | endif


" -----------------------------------------------------------------------------
" ACK
" -----------------------------------------------------------------------------

" Map to A key.
nmap <leader>A <Esc>:Ack!


" -----------------------------------------------------------------------------
" JEDI
" -----------------------------------------------------------------------------

" Disable automatic display of documentation, this can be achieved with K key.
let g:jedi#show_function_definition=0

" Disable showing completions when dot is entered (in favor of supertab).
let g:jedi#popup_on_dot=0


" -----------------------------------------------------------------------------
" LINTING
" -----------------------------------------------------------------------------

let g:ale_linters = {'jsx': ['eslint'], 'python': ['pylint']}



" -----------------------------------------------------------------------------
" AUTOCOMPLETION
" -----------------------------------------------------------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" Don't show the documentation automatically
set completeopt-=preview

" Don't insert the first suggestion
set completeopt+=noinsert

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Don't autocomplete and use a tab to trigger manually (this doesn't work)
let g:deoplete#disable_auto_complete = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Enable deoplete selectively
autocmd FileType python let b:deoplete_disable_auto_complete = 0

" Don't insert a new line after selecting an item
imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

