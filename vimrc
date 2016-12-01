" To disable a plugin, add its bundle name to the following list
let g:pathogen_disabled = []

" Example disabling vim-eco below
" call add(g:pathogen_disabled, 'vim-eco')
call add(g:pathogen_disabled, 'vim-eco')
call add(g:pathogen_disabled, 'vim-coffee-script')
"call add(g:pathogen_disabled, 'javascript-libraries-syntax.vim')
"call add(g:pathogen_disabled, 'typescript-vim')
"call add(g:pathogen_disabled, 'vim-jsx')
call add(g:pathogen_disabled, 'vim-cjsx')
"call add(g:pathogen_disabled, 'yajs.vim')
"call add(g:pathogen_disabled, 'tern_for_vim')
"call add(g:pathogen_disabled, 'YouCompleteMe')

call pathogen#infect()
syntax on
filetype plugin indent on

let g:used_javascript_libs = 'angularjs,react'
set omnifunc=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 1

set autoread
set tabstop=2
set mouse=a

set shiftwidth=2
set expandtab
set smarttab
set cindent

" Save changes in a way visible to webpack
set backupcopy=yes

" Allow backspace over everything in insert mode
:set backspace=indent,eol,start

" Solarized Theme
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
call add(g:pathogen_disabled, 'yajs.vim')
colorscheme solarized

" Dirty Cygwin hack to use block cursor for normal mode
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" Allow JSX highlighting in .js files
"let g:jsx_ext_required = 0

" Allow manual folding by indent
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

" Allow folding by indentation in coffee files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
" Set default indentation to two spaces for coffee files
autocmd BufNewFile,BufReadPost *.coffee,*.eco setl shiftwidth=2 expandtab
" Set default indentation to two spaces for js and html files
autocmd BufNewFile,BufReadPost *.js,*.ejs,*.html setl shiftwidth=2 expandtab
" Set default indentation to two spaces for css, scss, and sass files
autocmd BufNewFile,BufReadPost *.css,*.scss,*.sass setl shiftwidth=2 expandtab
" Set syntax highlighting for ejs files to html
au BufNewFile,BufRead *.ejs set filetype=html

" For closing Omi-Completion tip after element selection
" Closes on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Specify used javascript libraries for javascript-libraries-syntax-vim
"let g:used_javascript_libs = 'angularjs,react'

" Powerline plugin
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" Use F2 as line number toggle (absolute and relative mix)
nmap <F2> :set number! relativenumber! number?<CR>
