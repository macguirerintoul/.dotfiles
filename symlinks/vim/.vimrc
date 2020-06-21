" Plug setup
call plug#begin()
" Color schemes
Plug 'lifepillar/vim-solarized8' " light colorscheme
Plug 'bluz71/vim-nightfly-guicolors' " dark colorscheme
" Plugins
Plug 'sheerun/vim-polyglot' " Syntax highlighting
Plug '/usr/local/opt/fzf' " fuzzy finder (installed by brew)
Plug 'junegunn/fzf.vim' " fzf vim plugin 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
Plug 'preservim/nerdtree' " File explorer
Plug 'itchyny/lightline.vim' " Vim status line
Plug 'edkolev/tmuxline.vim' " tmux status line generator
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'junegunn/limelight.vim' " Dim inactive text blocks
Plug 'godlygeek/tabular' " Align characters across lines
call plug#end()

" Setup color scheme
if (has("termguicolors"))
	set termguicolors
endif 

" Set Vim colorscheme based on system theme
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
	set background=dark
	colorscheme nightfly
	let g:lightline = { 'colorscheme': 'nightfly' }
else
	set background=light
	colorscheme solarized8
	let g:lightline = { 'colorscheme': 'solarized' }
endif

let g:tmuxline_preset = {
	\'a': '#W',
	\'b': '',
	\'c': '',
	\'win': '#I #W',
	\'cwin': '#I #W',
	\'x': '',
	\'y': '',
	\'z': '%a %Y-%m-%d %H:%M'}

" Configure CoC
set updatetime=300 " Make CoC more responsive
" Use <Tab> and <S-Tab> to navigation completion options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Configure limelight
autocmd! User GoyoEnter Limelight " Enable limelight with goyo
autocmd! User GoyoLeave Limelight! " leave limelight with goyo

" Configure NERDTree
let NERDTreeShowHidden=1

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
set laststatus=2 " Show status line always
set noshowmode " hide Vim status line in favour of lightline
set wrap " Wrap long lines
set linebreak " Only wrap at nice 'breakable' characters
set breakindent " Indent wrapped lines to match current indent

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
