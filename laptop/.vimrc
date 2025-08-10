" Automatically load template for new C++ files
autocmd BufNewFile *.cpp 0r ~/.template.cpp

" Automatically load template for new Python files
autocmd BufNewFile *.py 0r ~/.template.py


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

" =============================================
" System Clipboard Integration
" =============================================
" Make system clipboard the default for all operations
set clipboard=unnamedplus

" Standard copy/paste keyboard shortcuts
vnoremap <C-c> "+y     " Visual mode: Ctrl+C copies selection
nnoremap <C-c> "+y     " Normal mode: Ctrl+C copies (needs motion)
nnoremap <C-v> "+p     " Normal mode: Ctrl+V pastes after cursor
inoremap <C-v> <C-r>+  " Insert mode: Ctrl+V pastes at cursor
vnoremap <C-x> "+d     " Visual mode: Ctrl+X cuts selection

" Select and copy entire file with Ctrl-A
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

" Decrease key repeat delay
set timeoutlen=200
" Decrease key repeat interval
set ttimeoutlen=0

" Faster cursor movement
set ttyfast


function! FormatWithBlack()
    silent! write
    silent! !/home/andrei/work/venvs/gv3/bin/black --line-length 79 %
    silent! edit
endfunction

autocmd BufWritePre *.py call FormatWithBlack()






" Smart commenting script for Python, Java, and C++ files
" Define comment characters based on filetype
function! ToggleComment()
    let l:comment_char = '#'
    
    " Determine comment characters based on filetype
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        let l:comment_char = '\/\/'
    elseif &filetype == 'vim'
        let l:comment_char = '"'
    elseif &filetype == 'python'
        let l:comment_char = '#'
    endif
    
    " Check if the first non-whitespace character is a comment character
    let l:line = getline('.')
    let l:trimmed = substitute(l:line, '^\s*', '', '')
    
    " Determine if line is commented based on filetype
    let l:is_commented = 0
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        let l:is_commented = (l:trimmed =~ '^\/\/')
    else
        let l:is_commented = (l:trimmed =~ '^' . l:comment_char)
    endif
    
    if l:is_commented
        " Uncomment: remove comment character and one space (if present)
        if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
            execute 's/^\(\s*\)\/\/\s\?/\1/'
        else
            execute 's/^\(\s*\)' . l:comment_char . '\s\?/\1/'
        endif
    else
        " Comment: add comment character and a space
        if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
            execute 's/^\(\s*\)/\1\/\/ /'
        else
            execute 's/^\(\s*\)/\1' . l:comment_char . ' /'
        endif
    endif
endfunction

" Toggle comment for multiple lines in visual mode
function! ToggleCommentVisual() range
    let l:comment_char = '#'
    
    " Determine comment characters based on filetype
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        let l:comment_char = '\/\/'
    elseif &filetype == 'vim'
        let l:comment_char = '"'
    elseif &filetype == 'python'
        let l:comment_char = '#'
    endif
    
    " Check if the first line is commented
    let l:line = getline(a:firstline)
    let l:trimmed = substitute(l:line, '^\s*', '', '')
    
    " Determine if line is commented based on filetype
    let l:is_commented = 0
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        let l:is_commented = (l:trimmed =~ '^\/\/')
    else
        let l:is_commented = (l:trimmed =~ '^' . l:comment_char)
    endif
    
    if l:is_commented
        " Uncomment all selected lines
        if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
            execute a:firstline . ',' . a:lastline . 's/^\(\s*\)\/\/\s\?/\1/'
        else
            execute a:firstline . ',' . a:lastline . 's/^\(\s*\)' . l:comment_char . '\s\?/\1/'
        endif
    else
        " Comment all selected lines
        if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
            execute a:firstline . ',' . a:lastline . 's/^\(\s*\)/\1\/\/ /'
        else
            execute a:firstline . ',' . a:lastline . 's/^\(\s*\)/\1' . l:comment_char . ' /'
        endif
    endif
endfunction

" Key mappings for normal and visual mode
" Use Ctrl+/ for toggle comment (Ctrl+_ often works as Ctrl+/ in many terminals)
nnoremap <C-_> :call ToggleComment()<CR>
vnoremap <C-_> :call ToggleCommentVisual()<CR>

" Alternative mappings using leader key (\ by default)
nnoremap <leader>c :call ToggleComment()<CR>
vnoremap <leader>c :call ToggleCommentVisual()<CR>

" Support for block comments in C++ and Java
function! ToggleBlockComment() range
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        let l:first_line = getline(a:firstline)
        let l:last_line = getline(a:lastline)
        
        " Check if already block-commented
        if l:first_line =~ '^\s*/\*' && l:last_line =~ '\*/\s*$'
            " Remove block comments
            execute a:firstline . 's/^\(\s*\)\/\*/\1/'
            execute a:lastline . 's/\*\/\s*$//'
        else
            " Add block comments
            execute a:firstline . 's/^\(\s*\)/\1\/*/'
            execute a:lastline . 's/$/\*\//'
        endif
    endif
endfunction

" Leader key mapping for block comments
vnoremap <leader>b :call ToggleBlockComment()<CR>
" Map leader+d to delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" Make all delete operations use the black hole register (truly delete without copying)
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nnoremap x "_x
nnoremap X "_X
