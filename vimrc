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
autocmd BufNewFile,BufReadPost *.ts setl tabstop=2 shiftwidth=2 expandtab
" Set default indentation to two spaces for css, scss, and sass files
autocmd BufNewFile,BufReadPost *.css,*.scss,*.sass setl tabstop=2 shiftwidth=2 expandtab
" Set syntax highlighting for ejs files to html
au BufNewFile,BufRead *.ejs set filetype=html

" Use F2 as line number toggle (relative default, absolute on insertion)
nmap <F2> :set number! relativenumber! number?<CR>
" Set numbering by mode - https://stackoverflow.com/a/43579781/3366431
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber


" PLUGIN SETTINGS

" SOLARIZED THEME
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized

" POWERLINE
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" TYPESCRIPT
" to make chained methods indent properly
" COPIED FROM REPO, BUT DOES NOT SEEM TO WORK
"setlocal indentkeys+=0.

" YOUCOMPLETEME
" blacklist typescript, hands over to tsuquyomi
" let g:ycm_filetype_blacklist = { 'typescript': 1 }
" Semantic triggering
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
"if !exists("g:ycm_semantic_triggers")
"      let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers = {
"      \ 'c' : ['->', '.'],
"      \ 'html': ['<', '"', '</', ' '],
"      \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"      \ 'ruby' : ['.', '::']
"      \ }

" ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
" set Ctrl-j/k to error navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

