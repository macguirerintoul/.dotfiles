" Plug setup
call plug#begin()
Plug 'sheerun/vim-polyglot' " syntax highlighting
Plug '/usr/local/opt/fzf' " fuzzy finder (installed by brew)
Plug 'junegunn/fzf.vim' " fzf vim plugin 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense for vim
Plug 'preservim/nerdtree' " file explorer
Plug 'jiangmiao/auto-pairs' " automatically insert matching characters
Plug 'dense-analysis/ale' " linter and fixer
Plug 'bluz71/vim-nightfly-guicolors' " color scheme
call plug#end()

" Setup color scheme
set termguicolors
set background=dark
colorscheme nightfly

" Configure coc
set updatetime=300 " make it happen faster

" Configure NERDTree
let NERDTreeShowHidden=1

" Configure ALE
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Key mapping
" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl + p opens fzf in git files mode
map <C-p> :GFiles<CR>

" vim configuration
set backspace=indent,eol,start
set tabstop=2 " set display width of tab
set cursorline
set wildmenu
set showmatch

" turn hybrid line numbers on
set number relativenumber
