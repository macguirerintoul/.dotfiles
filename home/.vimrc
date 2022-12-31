" Setup color scheme
if (has("termguicolors"))
	set termguicolors
endif 
try
	colorscheme spaceduck
	catch
endtry

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

" \ + <space> turns off highlight from previous search
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ }
