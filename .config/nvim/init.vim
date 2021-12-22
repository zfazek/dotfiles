" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
 " source ~/.vimrc

" Prerequisites:
" - neovim >= 0.5
" - rust-analyzer: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary

" Steps:
" - :PlugInstall
" - Restart

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Extentions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'preservim/nerdtree'

Plug 'tomasiser/vim-code-dark'
" Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'

call plug#end()

syntax enable
filetype plugin indent on

set t_Co=256
set t_ut=

" colorscheme peachpuff
colorscheme codedark

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" set completeopt-=preview

" Avoid showing extra messages when using completion
set shortmess+=c


" Configure lsp
" https://github.com/neovim/nvim-lspconfig#rust_analyzer

lua <<EOF
  -- Setup nvim-cmp.
  local nvim_lsp = require('lspconfig')
  local cmp = require'cmp'
  local servers = { 'clangd', 'rust_analyzer' }

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
    }
end
EOF

lua <<EOF

-- lspconfig object
-- local lspconfig = require'lspconfig'

-- function to attach completion when setting up lsp
-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end

-- Enable rust_analyzer
-- lspconfig.rust_analyzer.setup {
--   on_attach = require'completion'.on_attach;
--   root_dir = lspconfig.util.root_pattern(".");
-- }

-- lspconfig.clangd.setup {
--   on_attach = require'completion'.on_attach;
-- }

-- Enable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )

-- lspconfig.gopls.setup {}
-- cmd = {"gopls", "serve"},
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- }


-- vim.lsp.set_log_level("debug")
EOF

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

let g:completion_trigger_character = ['.', '::']

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Trigger completion with <tab>
" found in :help completion
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
" imap <Tab> <Plug>(completion_smart_tab)
" imap <S-Tab> <Plug>(completion_smart_s_tab)

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

autocmd VimLeave * tabnext 1
autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mksession! Session.vim
" autocmd VimEnter * source Session.vim
" autocmd VimEnter * NERDTree

" Show diagnostic popup on cursor hover
" autocmd CursorHold * lua vim.diagnostic.open_float()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '=>', highlight = "Comment" }

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
" set listchars=tab:>·
set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:.
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

inoremap { {}<ESC>i

"set wrap
set textwidth=99
set formatoptions=qrn1
set colorcolumn=101

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
map <F9> :FZF<CR>
nnoremap <S-F9> :source Session.vim<CR>:tabnext 1<CR>:NERDTree<CR>

nnoremap <F10> :! find . -not -path "*/build/*" -a -name \* \| ~/git/ctags/ctags -L-<CR>

" close window
nnoremap <S-F11> :q<CR>1gt
inoremap <S-F11> <ESC>:q<CR>1gt

"nnoremap <silent> <F12> :wa<CR>:! time scala problem082.scala<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! time scala problem082.scala<CR>
"nnoremap <silent> <F12> :wa<CR>:! g++ -std=c++17 -O3 accumulate.cc && time ./a.out<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! g++ -std=c++17 -O3 accumulate.cc && time ./a.out<CR>
"nnoremap <silent> <F12> :wa<CR>:! cargo build && time ./target/debug/rust<CR>
"inoremap <silent> <F12> <ESC>:wa<CR>:! cargo build && time ./targe/debug/rust<CR>
nnoremap <silent> <F12> :wa<CR>:! g++ -std=c++17 -O3 aoc20.cc && time ./a.out<CR>
inoremap <silent> <F12> <ESC>:wa<CR>:! g++ -std=c++17 -O3 aoc20.cc && time ./a.out<CR>

" Search mappings: These will make it so that going to the next one in a
" " search will center on the line it's found in.
map N Nzz
map n nzz

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
