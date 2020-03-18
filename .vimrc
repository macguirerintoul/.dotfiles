" Plug setup
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()

" syntax enable
set background=dark

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\[38;2;%lu;%lu;%lum"
let &t_8b = "\[48;2;%lu;%lu;%lum"

colorscheme nightfly

" Configure NERDTree
let NERDTreeShowHidden=1

" Configure ALE
let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>
" Ctrl + p opens fzf in git files mode
map <C-p> :GFiles<CR>
set tabstop=2 " set display width of tab
set softtabstop=1
set cursorline
set wildmenu
set showmatch
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
