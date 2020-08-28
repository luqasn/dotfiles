" Set standard file encoding
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
  " Except... on Markdown. That's good stuff.
  autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
" Use search highlighting
set hlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

let mapleader="\<SPACE>"

set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


nmap <Leader><Leader> <c-^>

nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/unite.vim'
" dark theme
Plug 'dracula/vim'

Plug 'Yggdroot/indentLine'
" git status per line
Plug 'airblade/vim-gitgutter'

Plug 'nathangrigg/vim-beancount'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

"Plug 'mhinz/vim-grepper'
" file tree
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
" auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" linting and fixing
Plug 'w0rp/ale'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

"Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()



color Dracula


let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
