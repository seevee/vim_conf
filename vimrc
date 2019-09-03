" seevee vimrc

" VIM-PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'dense-analysis/ale'
Plug 'lifepillar/vim-solarized8'
Plug 'othree/yajs.vim'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
call plug#end()

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
let g:solarized_termtrans = 1
colorscheme solarized8

" POWERLINE
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
" set Ctrl-j/k to error navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

