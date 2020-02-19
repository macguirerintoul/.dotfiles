call plug#begin()
Plug 'posva/vim-vue'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
call plug#end()
map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
set tabstop=2 " set display width of tab; 1 tab = x space with                  
