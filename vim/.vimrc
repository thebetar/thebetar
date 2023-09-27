syntax on                " syntax highlighting

set number               " enable line numbers
set relativenumber       " enable relative line numbers

set background=dark      " set background style to dark
set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow           " set horizontal split to below
set splitright           " set vertical split to right

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

colorscheme gruvbox      " set color scheme