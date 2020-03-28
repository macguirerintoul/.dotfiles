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

" Setup color scheme
set termguicolors
set background=dark
colorscheme nightfly

" Configure NERDTree
let NERDTreeShowHidden=1

" Configure ALE
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl + p opens fzf in git files mode
map <C-p> :GFiles<CR>
set tabstop=2 " set display width of tab
set cursorline
set wildmenu
set showmatch

" turn hybrid line numbers on
set number relativenumber
set nu rnu
