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
syntax enable
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

" vim configuration
set backspace=indent,eol,start " allows deletion of stuff in insert mode
set tabstop=2 " set display width of a tab (in spaces)
set cursorline " highlight the line where the cursor is
set wildmenu " autocompletion for vim commands
set showmatch " highlight matching [{()}]
set number relativenumber " turn on both line numbers and relative line numbers
set lazyredraw " redraw the screen less frequently
set incsearch " search as characters are entered
set hlsearch " highlight search results

" Key mapping
" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl + p opens fzf in git files mode
map <C-p> :GFiles<CR>

" \ + <space> turns off highlight from previous search
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
