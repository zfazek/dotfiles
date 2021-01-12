" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

colorscheme torte

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
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
set completeopt-=preview

set path=$PWD/**
set dir=~/.vim/swap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set list
" set listchars=tab:>·
set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:.

" Indent html doc
" let g:html_indent_inctags = "html,body,head,tbody"
let g:ycm_confirm_extra_conf = 0

au BufNewFile,BufRead *.ttcn set filetype=ttcn
au BufNewFile,BufRead *.ttcnpp set filetype=ttcn
au BufNewFile,BufRead *.ttcnin set filetype=ttcn
au BufNewFile,BufRead *.log set filetype=log
au BufNewFile,BufRead *.cfg set filetype=cpp

" ctags in new tab
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <C-\> :tab tag <C-r><C-w><CR>:execute 'silent! tabmove ' . (tabpagenr()-2)<CR>

" Map line splitting
imap <C-c> <CR><Esc>O

let g:BASH_Ctrl_j = 'off'

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

set tabpagemax=30

" scroll in insert mode
inoremap <silent> <C-e> <ESC><C-e>i
inoremap <silent> <C-y> <ESC><C-y>i

"set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81

au FocusLost * :wa
au Cursormoved * checktime

au filetype c setlocal tabstop=8 shiftwidth=8 softtabstop=8

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set nohidden
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
"set relativenumber
set tags=tags

"Disable search highlighting with a single keypress:
map <silent> - :nohls<cr>

" back to normal mode
inoremap jj <ESC>

" quit quicly
nnoremap qq :qa<CR>

nnoremap <leader>f :YcmCompleter FixIt<CR>

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

let g:clipbrdDefaultReg = '+'
" copy to clipboard
nnoremap <silent> <C-c> "+y

" paste from clipboard
nnoremap <silent> <C-v> "+p

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
nnoremap <S-F3> #

inoremap <F3> <ESC>*i
inoremap <S-F3> <ESC>#i

nnoremap <F5> :buffers<CR>:buffer<Space>
inoremap <F5> <ESC>:buffers<CR>:buffer<Space>

nnoremap <F6> :e.<CR>
inoremap <F6> <ESC>:e.<CR>

map <F8> :NERDTreeToggle<CR>

nnoremap <F10> :! find . -not -path "*/build/*" -a -name \* \| ~/git/ctags/ctags -L-<CR>

" close window
nnoremap <S-F11> :q<CR>1gt
inoremap <S-F11> <ESC>:q<CR>1gt

"nnoremap <silent> <F12> :wa<CR>:! time scala problem082.scala<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! time scala problem082.scala<CR>
"nnoremap <silent> <F12> :wa<CR>:! g++ -std=c++17 -O3 accumulate.cc && time ./a.out<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! g++ -std=c++17 -O3 accumulate.cc && time ./a.out<CR>
nnoremap <silent> <F12> :wa<CR>:! cargo build && time cargo run<CR>
inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build && time cargo run<CR>

" Search mappings: These will make it so that going to the next one in a
" " search will center on the line it's found in.
map N Nzz
map n nzz

inoremap { {<CR>}<ESC>ko

" move one DISPLAY line in case of long line
" nmap <Up> gk
" nmap <Down> gj
" imap <Up> <Esc>gki
" imap <Down> <Esc>gji

set dir=~/.vim/swap

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
