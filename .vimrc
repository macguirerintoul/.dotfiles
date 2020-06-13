" Plug setup
call plug#begin()
Plug 'sheerun/vim-polyglot' " syntax highlighting
Plug '/usr/local/opt/fzf' " fuzzy finder (installed by brew)
Plug 'junegunn/fzf.vim' " fzf vim plugin 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
Plug 'preservim/nerdtree' " file explorer
Plug 'bluz71/vim-nightfly-guicolors' " dark colorscheme
Plug 'itchyny/lightline.vim' " Vim status line
Plug 'edkolev/tmuxline.vim' " tmux status line generator
Plug 'junegunn/goyo.vim' " distraction-free writing
Plug 'junegunn/limelight.vim' " dim inactive text blocks
Plug 'godlygeek/tabular' " auto-align tables in markdown
" Plug 'plasticboy/vim-markdown' " better markdown experience
Plug 'altercation/vim-colors-solarized' " Solarized Light color scheme
Plug 'mhinz/vim-startify' " fancy start screen
call plug#end()

" Setup color scheme
if (has("termguicolors"))
	set termguicolors
endif 
let g:lightline = { 'colorscheme': 'nightfly' }

" set vim colorscheme based on system theme
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
	colorscheme nightfly
else
	set background=light
	colorscheme solarized
endif

" Configure coc
set updatetime=300 " make it happen faster
" Use <Tab> and <S-Tab> to navigation completion options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

let g:csv_no_conceal = 1

" Configure limelight
autocmd! User GoyoEnter Limelight " enter limelight with goyo
autocmd! User GoyoLeave Limelight! " leave limelight with goyo

" Configure NERDTree
let NERDTreeShowHidden=1

" Configure vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1

" vim configuration
set backspace=indent,eol,start " allows deletion of stuff in insert mode
set tabstop=2 " set display width of a tab (in spaces)
set shiftwidth=2 " size of an indent
set cursorline " highlight the line where the cursor is
set wildmenu " autocompletion for vim commands
set showmatch " highlight matching [{()}]
set number " turn on line numbers
set lazyredraw " redraw the screen less frequently
set incsearch " search as characters are entered
set hlsearch " highlight search results
set splitbelow " split below current pane
set splitright " split to right of current pane
set laststatus=2
set noshowmode " hide Vim status line in favour of lightline
set nobackup " disable swap files
set breakindent " indent wrapped lines

" Key mapping
" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl + g toggles Goyo
map <C-g> :Goyo<CR>

" Ctrl + p opens fzf in git files mode
map <C-p> :GFiles<CR>

" \ + <space> turns off highlight from previous search
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
