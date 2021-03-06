
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

" Enable file type detection (filetype on) as well as plugin and indent file
" loading for specific file types.
filetype plugin indent on

" Allow using j/k keys in code completion lists.
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

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
" UNDO 
" -----------------------------------------------------------------------------

" Keep undo history outside the source tree.
set undodir=~/.vimundodir

" Ask VIM to keep undo history after the buffer is closed.
set undofile

" Keep up to 1K changes in the undo tree.
set undolevels=1000

" Keep up to 10K lines in undo history
set undoreload=10000


" -----------------------------------------------------------------------------
" PATHOGEN AND PANDEMIC 
" -----------------------------------------------------------------------------

" Enable pathogen for local bundles (.vim/bundle).
call pathogen#infect() 

" Enable pathogen discovery for pandemic bundles (.vim/bundle.remote).
execute pathogen#infect('bundle.remote/{}')


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
let NERDTreeIgnore=['\.pyc$', '^.git$', '\~$', '__pycache__' ]

" Keyboard shortcut for toggling NERDTree on/off.
map <leader>N :NERDTreeToggle<CR>

" Quit VIM if the only window left is a NERDTree window.
autocmd bufenter * if ( winnr("$") == 1 && exists("b:NERDTreeType") &&
    \ b:NERDTreeType == "primary" ) | q | endif

" Show NERDTREE if VIM was started with no arguments (i.e. file to open).
autocmd vimenter * if !argc() | NERDTree | endif

" -----------------------------------------------------------------------------
" MINIBUFEXPL
" -----------------------------------------------------------------------------

" Disable duplicate buffer name checking which should speed up Vim with 
" many buffers.
let g:miniBufExplCheckDupeBufs = 0


" -----------------------------------------------------------------------------
" JEDI
" -----------------------------------------------------------------------------

" Disable showing completions when dot is entered (in favor of supertab).
let g:jedi#popup_on_dot = 0

" Disable showing functon signatures (is slow), formerly g:jedi#show_function_definition
let g:jedi#show_call_signatures = 0

" Don't select the first element automatically
let g:jedi#popup_select_first = 0

" Display the signature in command line, which helps maintain history integrity
let g:jedi#show_call_signatures = "2"

" Disable auto selecting of the last option on neocomplete
let g:jedi#smart_auto_mappings = 0


" -----------------------------------------------------------------------------
" PYTHON-MODE 
" -----------------------------------------------------------------------------

" Set pylint config path.
let g:pymode_lint_config=expand('$HOME/.pylintrc')

" Disable automatic folding
let g:pymode_folding=0

" Change default line-length warning to match 100 line settings above
let g:pymode_options_max_line_length=100

" Disable rope because it's slow
let g:pymode_rope = 0

" Prevent lookup in parent projects
let g:pymode_rope_lookup_project = 0

" Enable Rope autocomplete
let g:pymode_rope_completion = 0

" Disable autocompletion on dot
let g:pymode_rope_complete_on_dot = 0

" Import those projects automatically for auto completion
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'django']

" Enable virtualenv support
let g:pymode_virtualenv = 1

" Path to the virtualenv
let g:pymode_virtualenv_path = $VIRTUAL_ENV

" Don't show documentation automatically
let g:pymode_doc = 0

" Disable the key to avoid interfering with Jedi, by default <C-Space>
let g:pymode_rope_completion_bind = ''


" -----------------------------------------------------------------------------
" SYNTASTIC
" -----------------------------------------------------------------------------

" Have Syntastic NOT open the quickfix window (it's still possible to move
" around it with :lnext and :prev).
let syntastic_auto_loc_list=0

" Have Syntastic populate the quickfix window.
let g:syntastic_always_populate_loc_list=1

" User JSXHint instead of JSHint to allow linting JSX files.
let g:syntastic_javascript_checkers = ['eslint']

let g:javascript_plugin_jsdoc = 1


" -----------------------------------------------------------------------------
" JSBEAUTIFY
" -----------------------------------------------------------------------------

" Map CTRL+f to JsBeautify call when editing JavaScript files
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>


" -----------------------------------------------------------------------------
" NOTES
" -----------------------------------------------------------------------------

" Have notes be stored in user homedir.
:let g:notes_directories = ['~/Dropbox/vimnotes']

" Keyboard shortcut for creating a new note.
map <leader>n :Note<CR>


" -----------------------------------------------------------------------------
" TODO.TEXT
" -----------------------------------------------------------------------------

highlight  default  link  TodoPriorityA  ErrorMsg
highlight  default  link  TodoPriorityB  WarningMsg
highlight  default  link  TodoPriorityC  statement


" -----------------------------------------------------------------------------
" SUPERTAB
" -----------------------------------------------------------------------------

" Ask Supertab to use smart completion, e.g. take into account attribute access
" with a dot.
let g:SuperTabDefaultCompletionType = "context"


" -----------------------------------------------------------------------------
" GUNDO 
" -----------------------------------------------------------------------------

" Toggle Gundo with the \g key combination.
nnoremap <leader>g :GundoToggle<CR>

" Set the width of the Gundo window.
let g:gundo_width = 60

" Set the height of the window in which Gundo displays a diff.
let g:gundo_preview_height = 20

" Display on the right rather than left side of the window.
let g:gundo_right = 1

" Display preview at bottom not on top.
let g:gundo_preview_bottom = 1


" -----------------------------------------------------------------------------
" ACK
" -----------------------------------------------------------------------------

" Map to A key.
nmap <leader>A <Esc>:Ack!


" -----------------------------------------------------------------------------
" TASKLIST
" -----------------------------------------------------------------------------

" Display the window at bottom rather than on top.
let g:tlWindowPosition = 1

" Map to T key.
map T :TaskList<CR>


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

" Perform an action on every item in the QuickFix window.
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction


" -----------------------------------------------------------------------------
" CUSTOM FUNCTION KEY MAPPINGS
" -----------------------------------------------------------------------------

" Close all hidden buffers.
map W :call Wipeout()<CR>

" Allow for using just "QFDo" instead of "call QFDo" in command line.
command! -nargs=+ QFDo call QFDo(<q-args>)

" CSSComb keyboard shortcut.
map <leader>c :CSScomb<CR>


" -----------------------------------------------------------------------------
" SITE CUSTOMIZATIONS
" -----------------------------------------------------------------------------

" Ensure JavaScript sugar is available in QUnit test files.
autocmd BufRead *_js_test.html set ft=javascript

" Ensure HBS templates are considered HTML.
autocmd BufRead *.hbs set ft=html

" Ensure .conf files have proper syntax
autocmd BufRead *.conf set ft=dosini

" Enable wordpress syntax for php files
autocmd BufEnter *.php :set syn=wordpress

