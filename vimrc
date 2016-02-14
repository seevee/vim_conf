execute pathogen#infect()
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

let g:rubycomplete_buffer_loading = 1

set autoread

" Dirty Cygwin hack to use block cursor for normal mode
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" Solarized Theme
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized
