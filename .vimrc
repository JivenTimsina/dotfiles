" install : vimplug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" space key as the leader key
let mapleader=" "
set relativenumber "relativenumber
set encoding=UTF-8
set mouse=a "enable mouse support

" highlight current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

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
set noruler "disable the cursor position

"plugins
call plug#begin()
  Plug 'preservim/nerdtree' "Explorer
  Plug 'ryanoasis/vim-devicons' "Icons
  Plug 'vim-airline/vim-airline' "status line
  Plug 'arcticicestudio/nord-vim' "nord theme
  Plug 'jiangmiao/auto-pairs' "auto pairs
call plug#end()

"colorscheme
colorscheme nord


" keymaps
nnoremap <silent><leader>e :NERDTreeToggle<CR> " toggle nerdtree
"toggle terminal
nnoremap <silent><C-t> :term<CR>
