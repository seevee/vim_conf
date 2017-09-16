" seevee vimrc


" PATHOGEN
" To disable a plugin, add its bundle name to the following list
let g:pathogen_disabled = []

" Example disabling plugin below
"call add(g:pathogen_disabled, 'JavaScript-Indent')

call pathogen#infect()
syntax on
filetype plugin indent on


" VIM DEFAULTS
let g:rubycomplete_buffer_loading = 1

set autoread
set tabstop=2
set mouse=a

set shiftwidth=2
set expandtab
set smarttab
set cindent
set smartindent
set autoindent

" Save changes in a way visible to webpack
set backupcopy=yes

" Allow backspace over everything in insert mode
:set backspace=indent,eol,start

" Allow JSX highlighting in .js files
let g:jsx_ext_required = 0

" Set default indentation to two spaces for js and html files
autocmd BufNewFile,BufReadPost *.js,*.ejs,*.html setl tabstop=2 shiftwidth=2 expandtab
" Set default indentation to four spaces for ts files
autocmd BufNewFile,BufReadPost *.ts setl tabstop=4 shiftwidth=4 expandtab
" Set default indentation to two spaces for css, scss, and sass files
autocmd BufNewFile,BufReadPost *.css,*.scss,*.sass setl tabstop=2 shiftwidth=2 expandtab
" Set syntax highlighting for ejs files to html
au BufNewFile,BufRead *.ejs set filetype=html

" Use F2 as line number toggle (absolute and relative mix)
nmap <F2> :set number! relativenumber! number?<CR>


" PLUGIN SETTINGS

" SOLARIZED THEME
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized

" POWERLINE
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" SYNTASTIC
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" TYPESCRIPT
" to make chained methods indent properly
" COPIED FROM REPO, BUT DOES NOT SEEM TO WORK
"setlocal indentkeys+=0.

" TSQUQUYOMI
" syntastic integration
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker

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
