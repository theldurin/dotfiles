set visualbell

if has('syntax')
  syntax on
endif

if &diff
  syntax off
endif

set re=0
set number
set relativenumber
set hlsearch
set autoindent
set ruler
set confirm
set cmdheight=2
set laststatus=2

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <C-L> :nohl<CR><C-L>
