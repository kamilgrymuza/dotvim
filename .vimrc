
" -----------------------------------------------------------------------------
" BASIC VIM SETTINGS 
" -----------------------------------------------------------------------------

" Disable compatibility with VI - in most cases this is superfluous, but
" better to be safe than sorry - see http://stackoverflow.com/
" questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
set nocompatible

" Turn on highlighting by default.
syntax on

" Set the marker at line 80 to fit the text in 79 columns as suggested by PEP8.
set colorcolumn=80

" Set textwidth used for automatic wrapping to 79 columns as suggested by PEP8.
set textwidth=79

" Enable automatic wrapping of comments but not text to to textwidth.
set formatoptions+=c


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

