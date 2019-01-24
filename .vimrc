set nocompatible

filetype plugin indent on

if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch        " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
set showmatch
set hlsearch
set mouse=a        " Enable mouse usage (all modes)
set number

set path=$PWD/**
set dir=~/.vim/swap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set list
"set listchars=tab:>·
set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:.

" Indent html doc
:let g:html_indent_inctags = "html,body,head,tbody"

" moving among tabs
nnoremap <C-Left> :tabprevious<CR>
inoremap <C-Left> <ESC>:tabprevious<CR>i
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Right> <ESC>:tabnext<CR>i

set tabpagemax=30

" scroll in insert mode
inoremap <silent> <C-e> <ESC><C-e>i
inoremap <silent> <C-y> <ESC><C-y>i

"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=81

au FocusLost * :wa
au Cursormoved * checktime

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full

hi CursorLine term=none cterm=none ctermbg=7
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set statusline=%F%m%r%h%w\ [%l,%v][%p%%]
"set statusline=%2*%n\|%<%*%-.40F%2*\|\ %2*%M\ %3*%=%1*\ %1*%2.6l%2*x%1*%1.9(%c%V%)%2*[%1*%P%2*]%1*%2B

"Disable search highlighting with a single keypress:
map <silent> - :nohls<cr>

" back to normal mode
inoremap jj <ESC>

" quit quicly
nnoremap qq :qa<CR>

"open new vertical window
nnoremap <leader>v <C-w>v<C-w>l

"open new horizontal window
nnoremap <leader>s <C-w>s<C-w>j 

" close window
nnoremap <leader>q :q<CR>

" move around windows
nnoremap <C-h> <C-w>h "
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" completion
inoremap <TAB><TAB> <C-n>
set ofu=syntaxcomplete#Complete

" save all files
nnoremap <silent> <F2> :wa<CR>
inoremap <silent> <F2> <ESC>:wa<CR>a

" Open the previous file
nnoremap <silent> <S-F2> :Rexplore<CR>
inoremap <silent> <S-F2> <ESC>:Rexplore<CR>

nnoremap <F3> *
inoremap <F3> <ESC>*i

nnoremap <S-F3> #
inoremap <S-F3> <ESC>#i

nnoremap <F5> :buffers<CR>:buffer<Space>
inoremap <F5> <ESC>:buffers<CR>:buffer<Space>

nnoremap <F6> :e.<CR>
inoremap <F6> <ESC>:e.<CR>

map <F8> :NERDTreeToggle<CR>

nnoremap <F10> :! find . -name \* \| ctags-exuberant -L-<CR>
inoremap <F10> <ESC>:! find . -name \* \| ctags-exuberant -L-<CR>

" close window
nnoremap <S-F11> :q<CR>
inoremap <S-F11> <ESC>:q<CR>

nnoremap <silent> <F12> :wa<CR>:! cd build; make -j2 && ./foo<CR>
inoremap <silent> <F12> <ESC>:wa<CR>:! cd build; make -j2 && ./foo<CR>

" search will center on the line it's found in.
map N Nzz
map n nzz

" move one DISPLAY line in case of long line
" nmap <Up> gk
" nmap <Down> gj
" imap <Up> <Esc>gki
" imap <Down> <Esc>gji

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
