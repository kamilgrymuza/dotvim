
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

" Set the marker at line 80 to fit the text in 79 columns as suggested by PEP8.
set colorcolumn=80

" Set textwidth used for automatic wrapping to 79 columns as suggested by PEP8.
set textwidth=79

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

" Enable file type detection (filetype on) as well as plugin and indent file
" loading for specific file types.
filetype plugin indent on

" Allow using j/k keys in code completion lists.
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))


" -----------------------------------------------------------------------------
" TAB SETTINGS 
" -----------------------------------------------------------------------------

" Display 4 space characters instead of a \t when reading a file.
set tabstop=4

" Indent by 4 spaces when using indent command (< and > in visual mode
" or << and >> in normal mode).
set shiftwidth=4

" Expand TAB (\t) to spaces, i.e. in insert mode when a TAB key is hit a number
" of space characters will be inserted instead of a \t. How many is controlled
" with the softtabstop option.
set expandtab

" Insert 4 space characters in insert mode when a TAB key is hit.
set softtabstop=4


" -----------------------------------------------------------------------------
" PATHOGEN AND PANDEMIC 
" -----------------------------------------------------------------------------

" Enable pathogen for local bundles (.vim/bundle).
call pathogen#infect() 

" Enable pathogen discovery for pandemic bundles (.vim/bundle.remote).
execute pathogen#infect('bundle.remote/{}')


" -----------------------------------------------------------------------------
" COLORS AND THEME
" -----------------------------------------------------------------------------

" Enable more colors - required by some themes.
set t_Co=256

" Turn on lucius theme.
colorscheme lucius                                                                                                                                                                                      

" Select lucius theme flavour.
LuciusDarkHighContrast


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
let NERDTreeIgnore=['\.pyc$', '^.git$', '\~$' ]

" Keyboard shortcut for toggling NERDTree on/off.
map <leader>N :NERDTreeToggle<CR>

" Quit VIM if the only window left is a NERDTree window.
autocmd bufenter * if ( winnr("$") == 1 && exists("b:NERDTreeType") &&
    \ b:NERDTreeType == "primary" ) | q | endif

" Show NERDTREE if VIM was started with no arguments (i.e. file to open).
autocmd vimenter * if !argc() | NERDTree | endif


" -----------------------------------------------------------------------------
" JEDI
" -----------------------------------------------------------------------------

" Disable automatic display of documentation, this can be achieved with K key.
let g:jedi#show_function_definition = 0

" Disable showing completions when dot is entered (in favor of supertab).
let g:jedi#popup_on_dot = 0

" -----------------------------------------------------------------------------
" SUPERTAB
" -----------------------------------------------------------------------------

" Ask Supertab to use smart completion, e.g. take into account attribute access
" with a dot.
let g:SuperTabDefaultCompletionType = "context"


" -----------------------------------------------------------------------------
" CUSTOM FUNCTIONS
" -----------------------------------------------------------------------------

" Close all hidden buffers.
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction


" -----------------------------------------------------------------------------
" CUSTOM FUNCTION KEY MAPPINGS
" -----------------------------------------------------------------------------

" Close all hidden buffers.
map W :call Wipeout()<CR>


" -----------------------------------------------------------------------------
" SITE CUSTOMIZATIONS
" -----------------------------------------------------------------------------

" Ensure JavaScript sugar is available in QUnit test files.
autocmd BufRead *_js_test.html set ft=javascript



