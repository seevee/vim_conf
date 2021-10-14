" seevee vimrc

" set leader key
let mapleader = ','

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" general plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
" solarized theme
Plug 'lifepillar/vim-solarized8'
set background=dark
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1


" ALE
Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1
"set omnifunc=ale#completion#OmniFunc
" to fix auto complete bug
"set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint', 'vls'],
      \}
" allow c++ linter to pick up compile_commands.json
let g:ale_c_parse_compile_commands = 1
" set Ctrl-j/k to error navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      "\ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-tsserver',
      \ 'coc-vetur'
      \]

" JavaScript/Typescript
Plug 'othree/yajs.vim'
Plug 'leafgarland/typescript-vim'
Plug 'leafOfTree/vim-vue-plugin'
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_stylus = 1

Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

" CSS/HTML
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'iloginow/vim-stylus'
Plug 'digitaltoad/vim-pug'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" other languages
Plug 'neoclide/jsonc.vim'
Plug 'jparise/vim-graphql'
Plug 'hashivim/vim-terraform'

" git
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


call plug#end()


" apply solarized theme
if !empty(glob('~/.vim/plugged/vim-solarized8'))
  colorscheme solarized8
endif

" vim defaults
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

" POWERLINE
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" always show statusline
set laststatus=2
" use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

