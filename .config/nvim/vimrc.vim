" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Install nodejs >= 12.12: curl -sL install-node.vercel.app/lts | sudo bash
" :CocInstall coc-rust-analyzer coc-clangd coc-go coc-java

filetype plugin indent on

colorscheme evening

let mapleader = "\<Space>"

autocmd VimLeave * tabnext 1
autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mksession! Session.vim
" autocmd VimEnter * source Session.vim
" autocmd VimEnter * NERDTree

autocmd FocusLost * :wa
autocmd Cursormoved * checktime

autocmd filetype c setlocal tabstop=4 shiftwidth=4 softtabstop=4
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" set completeopt-=preview

" Permanent undo
set undodir=~/.vim/vimdid
set undofile

" Avoid showing extra messages when using completion
set shortmess+=c

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

set t_Co=256
set t_ut=

set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching
set incsearch      " Incremental search
set hlsearch
set mouse=a        " Enable mouse usage (all modes)
set number

set path=$PWD/**
set dir=~/.vim/swap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=81

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set nohidden
set hidden
set wildmenu
set wildmode=list:longest,full

hi CursorLine term=none cterm=none ctermbg=7
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set tags=tags
set ofu=syntaxcomplete#Complete
set statusline=%f%m%r%h%w\ [%Y]\ [0x%02.2B]%<\ %F\ (%v,%l)\ %3p%%\ of\ %L\ lines>

" set list
" set listchars=tab:>·
" set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:.

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Move by line
nnoremap j gj
nnoremap k gk

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>g for Rg search
noremap <leader>g :Rg<CR>

noremap <leader>f :GFiles<CR>

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :wa<CR>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" moving among tabs
nnoremap <C-Left> :tabprevious<CR>
inoremap <C-Left> <ESC>:tabprevious<CR>i
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Right> <ESC>:tabnext<CR>i
nnoremap <silent> <A-Down> :tabprevious<CR>
inoremap <silent> <A-Down> <ESC>:tabprevious<CR>i
nnoremap <silent> <A-Up> :tabnext<CR>
inoremap <silent> <A-Up> <ESC>:tabnext<CR>i
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" scroll in insert mode
inoremap <silent> <C-e> <ESC><C-e>i
inoremap <silent> <C-y> <ESC><C-y>i

inoremap { {}<ESC>i

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

"Disable search highlighting with a single keypress:
map <silent> - :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:coc_start_at_startup=1

let g:clipbrdDefaultReg = '+'
" copy to clipboard
" nnoremap <silent> <C-c> "+y

" paste from clipboard
" nnoremap <silent> <C-v> "+p

" save all files
nnoremap <silent> <F2> :wa<CR>
inoremap <silent> <F2> <ESC>:wa<CR>a

" Open the previous file
nnoremap <silent> <S-F2> :Rexplore<CR>
inoremap <silent> <S-F2> <ESC>:Rexplore<CR>

nnoremap <F3> *
nnoremap <S-F3> #

inoremap <F3> <ESC>*i
inoremap <S-F3> <ESC>#i

nnoremap <F5> :buffers<CR>:buffer<Space>
inoremap <F5> <ESC>:buffers<CR>:buffer<Space>

nnoremap <F6> :e.<CR>
inoremap <F6> <ESC>:e.<CR>

map <F8> :NERDTreeToggle<CR>

map <F9> :GFiles<CR>
nnoremap <S-F9> :source Session.vim<CR>:tabnext 1<CR>:NERDTree<CR>

" nnoremap <F10> :! find . -not -path "*/build/*" -a -name \* \| ~/git/ctags/ctags -L-<CR>

" close window
nnoremap <S-F11> :q<CR>1gt
inoremap <S-F11> <ESC>:q<CR>1gt

"nnoremap <silent> <F12> :wa<CR>:! cargo build && time ./target/debug/rust<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build && time ./targe/debug/rust<CR>
"nnoremap <silent> <F12> :wa<CR>:! time g++ -std=c++17 -O0 main.cc && time ./a.out<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! time g++ -std=c++17 -O0 main.cc && time ./a.out<CR>
"nnoremap <silent> <F12> :wa<CR>:! time g++ -O2 -g -Wall aoc01.cc && time ./a.out<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! time g++ -O2 -g -Wall aoc01.cc && time ./a.out<CR>
"nnoremap <silent> <F12> :wa<CR>:! make && time ./a.out<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! make && time ./a.out<CR>
"nnoremap <silent> <F12> :wa<CR>:! cargo build --release && time ./target/release/rust<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build --release && time ./target/release/rust<CR>
"nnoremap <silent> <F12> :wa<CR>:! cargo run<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! cargo run<CR>
nnoremap <silent> <F12> :wa<CR>:! cargo build --release && time ./target/release/rust<CR>
inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build --release && time ./target/release/rust<CR>
"nnoremap <silent> <F12> :wa<CR>:! cargo build && time ./target/debug/rust<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build && time ./target/debug/rust<CR>

"nnoremap <C-a> :wa<CR>:! cd build; make && time ./checkers<CR>
"inoremap <C-a> <ESC>:wa<CR>:! cd build; make && time ./checkers<CR>
"nnoremap <silent> <C-a> :wa<CR>:! cargo build --release && time ./target/release/rust<CR>
"inoremap <silent> <C-a> <ESC>:wa<CR>:! cargo build --release && time ./target/release/rust<CR>
nnoremap <C-a> :wa<CR>:! cargo build && time ./target/debug/rust<CR>
inoremap <C-a> <ESC>:wa<CR>:! cargo build && time ./target/debug/rust<CR>
"nnoremap <C-a> :wa<CR>:! time g++ -std=c++14 -O0 main.cc && time ./a.out<CR>
"inoremap <C-a> <ESC>:wa<CR>:! time g++ -std=c++14 -O0 main.cc && time ./a.out<CR>
"nnoremap <C-a> :wa<CR>:! time rustc -O main.rs -o main && time ./main<CR>
"inoremap <C-a> <ESC>:wa<CR>:! time rustc -O main.rs -o main && time ./main<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if v:version > 820
    if filereadable($HOME."/.config/nvim/coc.vim")
        execute "source ".$HOME."/.config/nvim/coc.vim"
    endif
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
