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
Plug 'iloginow/vim-stylus'
Plug 'digitaltoad/vim-pug'
call plug#end()


" VIM DEFAULTS
syntax on
filetype plugin indent on

set autoread
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cindent
set smartindent
set autoindent

" allow mouse usage
set mouse=a

" save changes in a way visible to webpack
set backupcopy=yes

" allow backspace over everything in insert mode
:set backspace=indent,eol,start

" use F2 as line number toggle
set nonumber
nmap <F2> :set number!<CR>

" SOLARIZED THEME
set background=dark
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1
if !empty(glob('~/.vim/plugged/vim-solarized8'))
  colorscheme solarized8
endif

" POWERLINE
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" always show statusline
set laststatus=2
" use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
" to fix auto complete bug
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
      \ 'vue': ['eslint', 'vls']
      \}
" allow c++ linter to pick up compile_commands.json
let g:ale_c_parse_compile_commands = 1
" set Ctrl-j/k to error navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

