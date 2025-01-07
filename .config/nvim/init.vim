" https://github.com/junegunn/vim-plug
"  - needs: ~/.local/share/nvim/site/autoload/plug.vim
"  - run:
"
"    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 
call plug#begin()
  " https://github.com/rodjek/vim-puppet
  Plug 'rodjek/vim-puppet'       " puppet syntax highlighting
  " https://github.com/junegunn/seoul256.vim
  Plug 'junegunn/seoul256.vim'   " color scheme
  " https://github.com/HiPhish/jinja.vim
  Plug 'HiPhish/jinja.vim'       " jinja syntax highlighting
call plug#end()

" vim-puppet: don't align key/vals for => in resources
let g:puppet_align_hashes = 0

" background range is: 233 (darkest) - 256 (lightest)
let g:seoul256_background = 235
colorscheme seoul256

" get normal yank entire line behavior
unmap Y

set number                     " Show current line number
set relativenumber             " Show relative line numbers

if exists('$TMUX')
  autocmd BufEnter,BufWrite *
    \ call system("tmux rename-window '" . expand("%:t") . "'")
endif
