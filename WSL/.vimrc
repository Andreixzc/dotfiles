" Automatically load template for new C++ files
autocmd BufNewFile *.cpp 0r ~/.template.cpp

" Show line numbers
set number

" Uncomment to use relative line numbers for easier navigation
" set relativenumber

" Syntax highlighting
syntax on

" Enable filetype detection and indentation
filetype plugin indent on

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

" Show command in the status line
set showcmd

" Visual mode: Copy to system clipboard with Ctrl-C
vnoremap <C-c> "+y

" Normal mode: Paste from system clipboard with Ctrl-V
map <C-v> "+p

" Normal mode: Copy the entire file with Ctrl-A
nnoremap <C-a> :%y+<CR>

" Smart auto-pairing and skipping (VSCode-like behavior)
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ( ()<Left>

inoremap <expr> ) getline('.')[col('.')-1] == ")" ? "\<Right>" : ")"
inoremap <expr> ] getline('.')[col('.')-1] == "]" ? "\<Right>" : "]"
inoremap <expr> } getline('.')[col('.')-1] == "}" ? "\<Right>" : "}"
inoremap <expr> " getline('.')[col('.')-1] == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' getline('.')[col('.')-1] == "\'" ? "\<Right>" : "\'\'\<Left>"

" Curly braces: auto-pairing and newline handling
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
