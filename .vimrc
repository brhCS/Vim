" This configuration file was tested with
"       /usr/local/bin/vim (7.0) and
"       /usr/local/bin/gvim (7.0)
"this line prevents copydotfiles from recopying: dot-vimrc_included
syntax on
set term=dtterm
set et
set ai
set cin
set ru
set bs=indent,eol,start
set sw=3  "this is the level of autoindent, adjust to taste

" Set Color Scheme
colorscheme desert

" Fixing tabs
set tabstop=4
set expandtab
set shiftwidth=3

" Incremental Search and Highlighting Results
set incsearch
set hlsearch

" Show line numbers
set number

" Show tab whitespace characters
set listchars=tab:>-
set list!

" Set <Space> + Character to insert 1 character, then go back to command mode
nmap <Space> i_<Esc>r

"check for lines that exceed 80 chars
"autocmd BufRead,BufNewFile   *.c,*.h,*.cpp au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"autocmd BufRead,BufNewFile   *.c,*.h,*.cpp au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

