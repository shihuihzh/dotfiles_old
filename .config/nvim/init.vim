" ========== Plugin ==========
" Initialize plugin system
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
call plug#end()

" ========== Options ==========
" indent
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text
syntax enable

" UI
set laststatus=2
set ruler
set wildmenu
set number
colorscheme dracula 
filetype plugin on
"set spell

" ========== Key Mapping ==========
let mapleader = ' '
nnoremap <leader><CR> :nohlsearch<CR>
imap jj <ESC>
nnoremap <silent><C-x> :q<CR>
" nnoremap <silent><C-X> :qa<CR>

" Code enhance
inoremap <C-E> <ESC>A;<CR>


" Terminal
nnoremap <silent><leader>t :below split term://zsh<CR>
tnoremap <silent><C-x> <C-\><C-N>:q<CR>
tnoremap <silent><ESC> <C-\><C-N>

" Window
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" ========== Plugin Setting ==========
" ---------- COC ----------
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <M-CR> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>


" multi cursor
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-C> <Plug>(coc-cursors-word)
xmap <silent> <C-C> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

" ---------- Nerd Tree ----------
nnoremap <silent><leader>f :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree

" ---------- FZF ----------
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><leader>e :History<CR>
