" Plug setup
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
call plug#end()

" Configure NERDTree
let NERDTreeShowHidden=1

" Configure ALE
let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Configure vim
map <C-n> :NERDTreeToggle<CR>
map <C-p> :GFiles<CR>
set tabstop=2 " set display width of tab; 1 tab = x space with                  
