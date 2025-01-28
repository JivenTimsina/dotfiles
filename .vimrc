"install : vimplug
"ggle nerdtree
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"space key as the leader key
let mapleader=" "
set relativenumber "relativenumber
set encoding=UTF-8
set mouse=a "enable mouse support

syntax on "enable syntax
"highlight current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=white

"smartcase search
set ignorecase
set smartcase

set ttimeoutlen=50 "timeout for a 
"Indentation
set tabstop=4 "width of tab character
set softtabstop=4 "fines tunes the amount of whitespaces to be added
set shiftwidth=4 "determines the amount of whitespaces to be added in normal mode
set expandtab "use spaces instead of tab
set autoindent "autoindent in new line

"show the maching pairs (), {}, [] and "
set showmatch

"don't show default modes
set noshowmode "disable mode display

"plugins
call plug#begin()
Plug 'preservim/nerdtree' "Explorer
Plug 'ryanoasis/vim-devicons' "Icons
Plug 'vim-airline/vim-airline' "status line
Plug 'sheerun/vim-polyglot' "syntax highlight
Plug 'arcticicestudio/nord-vim' "nord theme
Plug 'jiangmiao/auto-pairs' "auto pairs
Plug 'tpope/vim-commentary' "comments
call plug#end()

"colorscheme
colorscheme nord

let NERDTreeShowHidden=1 "show hidden files in nerdtree

"keymaps
"nordtree
nnoremap <silent><leader>e :NERDTreeToggle<CR>
"toggle terminal
nnoremap <silent><C-/> :below term<CR>
"select all
nnoremap <C-a> ggvG$ "select all
"copy to clipboard
nnoremap <C-c> "+y "copy to clipboard
