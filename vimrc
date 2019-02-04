" Turn on syntax highlighting
syntax on

" Show line numbers
set number
" set nonumber

" https://github.com/w0ong/vim-hybrid
colorscheme hybrid
set background=dark
let g:hybrid_custom_term_colors = 1

" Pathogen 
execute pathogen#infect()
filetype plugin indent on

" Rust
let g:rust_clip_command = 'xclip -selection clipboard'
"  let g:rust_clip_command = 'pbcopy'

" Escape
imap jj <esc>



