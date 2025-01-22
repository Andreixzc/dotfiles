" Automatically load template for new C++ files
autocmd BufNewFile *.cpp 0r ~/.template.cpp

" Show line numbers
set number

" For relative line numbers (helpful for vim movements)
"set relativenumber

" Show current line number and relative numbers for others
"set number relativenumber

" Syntax highlighting
syntax on

" Enable filetype detection
filetype on
filetype indent on

" Show matching brackets
set showmatch

" Better colors for dark background
set background=dark

" Enable true colors if your terminal supports it
set termguicolors

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set showcmd
vnoremap <C-c> "+y
map <C-v> "+p
" Selecionar e copiar todo o arquivo com Ctrl-A
nnoremap <C-a> :%y+<CR>
" Smart auto-pairing and skipping (VSCode-like behavior)
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ( ()<Left>

" Skip over closing character if it's already there
inoremap <expr> ) getline('.')[col('.')-1] == ")" ? "\<Right>" : ")"
inoremap <expr> ] getline('.')[col('.')-1] == "]" ? "\<Right>" : "]"
inoremap <expr> } getline('.')[col('.')-1] == "}" ? "\<Right>" : "}"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

" Keep your existing newline handling for curly braces
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Basic C++ autoindent settings
set cindent
set autoindent
set smartindent

" For proper brace formatting
set equalprg=clang-format

" Format the entire file with F3
nnoremap <F3> gg=G

" Or for automatic formatting on save
autocmd BufWritePre *.cpp :%!clang-format

