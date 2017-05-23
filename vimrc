" seevee vimrc

" PATHOGEN
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
"call add(g:pathogen_disabled, 'tsuquyomi')

call pathogen#infect()
syntax on
filetype plugin indent on

" VIM DEFAULTS
let g:used_javascript_libs = 'angularjs,react'
"set omnifunc=syntaxcomplete#Complete
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

" SOLARIZED THEME
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
let g:jsx_ext_required = 0

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
" Set default indentation to four spaces for ts files
autocmd BufNewFile,BufReadPost *.ts setl shiftwidth=4 expandtab
" Set default indentation to two spaces for css, scss, and sass files
autocmd BufNewFile,BufReadPost *.css,*.scss,*.sass setl shiftwidth=2 expandtab
" Set syntax highlighting for ejs files to html
au BufNewFile,BufRead *.ejs set filetype=html

" For closing Omi-Completion tip after element selection
" Closes on movement in insert mode or when leaving insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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

" SYNTASTIC
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" TSQUQUYOMI
" syntastic integration
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" YOUCOMPLETEME
" blacklist typescript, hands over to tsuquyomi
let g:ycm_filetype_blacklist = { 'typescript': 1 }
" Semantic triggering
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
if !exists("g:ycm_semantic_triggers")
      let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers = {
      \ 'c' : ['->', '.'],
      \ 'html': ['<', '"', '</', ' '],
      \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \ 'ruby' : ['.', '::']
      \ }
