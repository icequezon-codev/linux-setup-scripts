set number
set relativenumber
set tabstop=4
set sw=4
set expandtab
set hlsearch
set rtp+=~/.fzf

" Vim Plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

Plug 'edkolev/tmuxline.vim'

let g:tmuxline_powerline_separators = 0

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-obsession'

" Initialize plugin system
call plug#end()

let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
"let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%3v ', '%{ObsessionStatus()}'])
