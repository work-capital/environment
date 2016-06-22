"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------





"------------------------------------------------------------------------------
" Standard config
"------------------------------------------------------------------------------
" Looks
set ttyfast    " indicates we have a strong
               " terminal connection
set ttimeoutlen=10
set tenc=utf8
" Minimize the escape delay
if ! has('gui_running')
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
syntax on
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-summerfruit
" Override colorscheme bg so they look properly under any decent terminal -
" it's more of a hack than anything else
"highlight Normal ctermbg=NONE
set cursorline
set cursorcolumn
" Show trailing spaces
set listchars=trail:.,tab:--
set tags=./tags,tags,codex.tags
set list
set shell=/usr/local/bin/zsh

" Look good on linux:
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_Co=256
    if $TERM =~ '256color'
      " Disable Background Color Erase (BCE) so that color schemes work
      " properly when Vim is used inside tmux and GNU screen.  See also
      " http://snk.tuxfamily.org/log/vim-256color-bce.html
      set t_ut=
    endif
  endif
endif

" Make vim use absolute numbers
set number
" Indentation, textwidth and colorcolumn
set autoindent smartindent
set textwidth=80
set colorcolumn=80
" Set tabs as 2 spaces - type :retab for setting a
" file's tabs to spaces
set expandtab
set shiftwidth=2
set tabstop=2
" Better overall tab key behaviour
set smarttab
" General
set hidden                   " edit multiple unsaved files at the
                             " same time
set ignorecase               " be case-insensitive in search
set smartcase                " but be case-sensitive with any upper-case chars
set complete=.,w,b,u,U,t,i,d
set completeopt-=preview
"set clipboard=unnamed        " yank and paste with the system clipboard
set noerrorbells
set wildmenu                 " better shell command managing
set pastetoggle=<F2>
set encoding=utf-8
set incsearch                " Highlight searches as they're typed
set hlsearch
set noesckeys
" convenient you can always change it with
" set nowrap
set wrap
set nocompatible
set foldlevel=99
set foldmethod=indent
set backspace=indent,eol,start
filetype plugin on

"------------------------------------------------------------------------------
" GUI
"------------------------------------------------------------------------------
set guifont=Monaco:h11
set guioptions=
if $TERM =~ 'italic'
  highlight Comment cterm=italic
endif

"------------------------------------------------------------------------------
" Mappings
"------------------------------------------------------------------------------
let mapleader = ","

" Write RO files
cnoremap sudow w !sudo tee % >/dev/null

" Increment numbers
nnoremap <leader>aa <C-a>

" Easily move lines around:
nnoremap [e dd\|k\|P
nnoremap ]e dd\|p

" Easily check for and navigate errors
nnoremap <leader>ee :Errors<cr>
nnoremap <silent> <leader>en :lnext<cr>
nnoremap <silent> <leader>eN :lprevious<cr>

" Turn paste mode on or off
nnoremap <silent> [p :set paste<cr>
nnoremap <silent> ]p :set nopaste<cr>

" Quickly source or edit .vimrc:
"nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vs $MYVIMRC<cr>

" Repeat last substitution
nnoremap <leader>r :s<cr>

" Resize to textwidth
nnoremap <silent> <leader>ty :SyntasticToggleMode<cr>
nnoremap <silent> <leader>sc :SyntasticCheck<cr>

" Resize to textwidth
nnoremap <silent> <leader>tw :call TextWidthResize()<CR>

func! TextWidthResize()
  exec "vertical resize ".(&textwidth+4) 
  " The +4 is simply to account for the line numbers - solving this problem
  " better is a TODO
endfunc


" Compile or interpret
func! CompileRunGcc()
  exec "w"
  exec "!gcc --std=c99 -Wall % -o %<.out; ./%<.out"
endfunc
func! InterpretPython()
  exec "w"
  exec "!/usr/local/bin/python %"
endfunc

" Tabs
nnoremap tt :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR>


" Clear search
nnoremap <silent><Leader>/ :nohlsearch<CR>

" Make H and L go to the beggining and end of a
" line, respectively.
noremap H ^
noremap L $

" Open ctags definition in a new tab
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open ctags definition in a vertical split - instead of a horizontal one
noremap <C-W><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

