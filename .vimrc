" ------------------------------------------------------------------------------
" BASIC VIM SETTINGS 
" ------------------------------------------------------------------------------

" Turn on highlighting by default.
syntax on

" Set the marker at line 81
set colorcolumn=81


" ------------------------------------------------------------------------------
" PATHOGEN AND PANDEMIC 
" ------------------------------------------------------------------------------

" Enable pathogen for local bundles (.vim/bundle).
call pathogen#infect() 

" Enable pathogen discovery for pandemic bundles (.vim/bundle.remote).
execute pathogen#infect('bundle.remote/{}')


" ------------------------------------------------------------------------------
" COLORS AND THEME
" ------------------------------------------------------------------------------

" Enable more colors - required by some themes.
set t_Co=256

" Turn on lucius theme.
colorscheme lucius                                                                                                                                                                                      

" Select lucius theme flavour.
LuciusDarkHighContrast

