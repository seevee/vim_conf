" To disable a plugin, add its bundle name to the following list
let g:pathogen_disabled = []

" Example disabling vim-eco below
" call add(g:pathogen_disabled, 'vim-eco')

call pathogen#infect()
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

let g:rubycomplete_buffer_loading = 1

set autoread
set tabstop=2
"set mouse=a

" Dirty Cygwin hack to use block cursor for normal mode
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" Allow backspace over everything in insert mode
:set backspace=indent,eol,start

" Solarized Theme
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized

" Allow JSX highlighting in .js files
let g:jsx_ext_required = 0

finish

" Allow manual folding by indent
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" Allow folding by indentation in coffee files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
" Set default indentation to two spaces for coffee files
autocmd BufNewFile,BufReadPost *.coffee,*.eco setl shiftwidth=2 expandtab
" Set default indentation to two spaces for js and html files
autocmd BufNewFile,BufReadPost *.js,*.ejs,*.html setl shiftwidth=2 expandtab
" Set syntax highlighting for ejs files to html
au BufNewFile,BufRead *.ejs set filetype=html

