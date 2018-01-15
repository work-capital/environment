" for Elixir support in neovim, see:
" https://www.dailydrip.com/topics/elixirsips/drips/neovim-for-elixir
"
" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
if ! exists("mapleader")
  let mapleader = ","
  endif


" save quick
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>


call plug#begin('~/.vim/plugged')

" Add VTerm and Term commands to open terminal easily
Plug 'mklabs/split-term.vim' 
  set splitbelow
  set splitright
  " open terminal below with 11 lines height
  map <C-O> :11Term<CR>  

Plug 'tpope/vim-cucumber'
Plug 'wannesm/wmgraphviz.vim'

""""" Idris programming language
Plug 'idris-hackers/idris-vim'

""""" Slim html template engine
Plug 'slime-lang/vim-slime-syntax'

"""""" Typescript
"Plug 'mhartington/nvim-typescript'
" Plug 'Shougo/vimproc.vim'
" Plug 'Quramy/tsuquyomi'
" Plug
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'powerman/vim-plugin-AnsiEsc'


" Execute code checks, find mistakes, in the background
Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []

Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features


Plug 'sheerun/vim-polyglot'

Plug 'tomasr/molokai'


" Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'


" Enable deoplete at startup

  let g:deoplete#enable_at_startup = 1

""""""" Elm
"Plug 'elmcast/elm-vim'


""""""" Auto complete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " autocomplete for ELM
"
" let g:deoplete#enable_at_startup = 1
"   let g:deoplete#omni_patterns = {}
"   " autocomplete on just about any character
"   let g:deoplete#omni_patterns.go = '[a-zA-Z_\.]{3,}'
"   " autocomplete only on attributes; doesn't seem to complete local vars
"   let g:deoplete#omni_patterns.elm = '\.'
"   " tab for cycling through options
"   inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"   " enter closes options if present and inserts linebreak
"   " apparently this has to be that complicated
"   inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
"   function! s:close_and_linebreak()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction


""""""" Purescript
"Plug 'raichoo/purescript-vim'

""""""" Scala
Plug 'derekwyatt/vim-scala'

""""""" Ruby
Plug 'vim-ruby/vim-ruby'

""""""" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

""""""" Elm
Plug 'lambdatoast/elm.vim'

""""""" JavaScript
Plug 'claco/jasmine.vim'
Plug 'elzr/vim-json'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'Shutnik/jshint2.vim'
Plug 'burnettk/vim-angular'
Plug 'mtscout6/vim-cjsx'
Plug 'ElmCast/elm-vim'

""""""" Web Development (HTML/CSS/preprocessors/etc)
Plug 'aaronjensen/vim-sass-status'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'lukaszb/vim-web-indent'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" NERDTREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" we don't need nerd tree, ctrl+o or ctrl+n is enough to see and use the tree

Plug 'scrooloose/nerdtree'
" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

""""""" Markdown
" Use fenced code blocks in markdown
Plug 'jtratner/vim-flavored-markdown'
  let g:markdown_fenced_languages=['ruby', 'javascript', 'elixir', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
" Markdown is now included in vim, but by default .md is read as Modula-2
" files.  This fixes that, because I don't ever edit Modula-2 files :)
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

""""""" Ansible
Plug 'chase/vim-ansible-yaml'

""""""" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

""""""" CoffeeScript
Plug 'kchmck/vim-coffee-script'

""""""" Handlebars
Plug 'nono/vim-handlebars'

""""""" Java
Plug 'tfnico/vim-gradle'

""""""" Terraform
Plug 'markcornick/vim-terraform'

""""" End Filetypes ====================

""""" Utilities ========================
Plug 'editorconfig/editorconfig-vim' " EditorConfig support

Plug 'scrooloose/syntastic' " Syntax highlighting
  let g:syntastic_mode_map = { "mode": "passive",
                             \ "passive_filetypes": ["java", "html", "css", "scss"] }
Plug 'tomtom/tcomment_vim'  " Line commenting
  " By default, `gc` will toggle comments

Plug 'janko-m/vim-test'                " Run tests with varying granularity
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" VIM-TEST   ,t -> test the nearest file (considering the leader is ','
""""            ,T -> test file
""""            etc...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>

"" Plug 'christoomey/vim-tmux-navigator'  " Navigate between tmux panes and vim splits seamlessly [neovim has term!]
Plug 'easymotion/vim-easymotion'       " easily jumps
Plug 'tpope/vim-fugitive'              " git support from dat tpope
Plug 'vim-scripts/SyntaxRange'         " Allow ranges within a file to define different syntax mappings
Plug 'mattn/webapi-vim' 		           " vim interface to web apis.  Required for gist-vim
Plug 'mattn/gist-vim'                  " create gists trivially from buffer, selection, etc.
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 2
  let g:gist_post_private = 1
  if has('macunix')
    let g:gist_clip_command = 'pbcopy'
  endif

" Plug 'sjl/gundo.vim'
"   nnoremap <F5> :GundoToggle<CR>
""""" End Utilities ====================

""""" UI Plugs =======================
Plug 'vim-airline/vim-airline'   " UI status bar
  set laststatus=2               " enable airline even if no splits
  let g:airline_theme='luna'
  let g:airline_powerline_fonts=1
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_linecolumn_prefix = '␊ '
  let g:airline_linecolumn_prefix = '␤ '
  let g:airline_linecolumn_prefix = '¶ '
  let g:airline_branch_prefix = '⎇ '
  let g:airline_paste_symbol = 'ρ'
  let g:airline_paste_symbol = 'Þ'
  let g:airline_paste_symbol = '∥'
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_mode_map = {
        \ 'n' : 'NORMAL',
        \ 'i' : 'INPUT',
        \ 'R' : 'REPLACE',
        \ 'v' : 'VISUAL',
        \ 'V' : 'V-LINE',
        \ 'c' : 'CMD   ',
        \ '': 'V-BLCK',
        \ }
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim' " base16 theme
Plug 'dandorman/vim-colors'
"" Plug 'roman/golden-ratio'    " http://stackoverflow.com/questions/11634804/vim-auto-resize-focused-window
""""" End UI Plugs ===================

""""" Code Navigation ===============
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
  let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
  let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
  let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'v'        " open selections in a vertical split
  let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
  let g:ctrlp_arg_map = 0
  let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
  let g:ctrlp_showhidden = 0             " do not show hidden files in match list
  let g:ctrlp_split_window = 0
  let g:ctrlp_max_height = 40            " restrict match list to a maxheight of 40
  let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
  let g:ctrlp_max_files = 0              " no restriction on results/file list
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep|docs\)$',
        \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
        \ }
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " if you want to use git for this rather than ag
  " AcceptSelection("r") means to replace. if you want to accept and vertical
  " open, change to AcceptSelection("v")
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-e>', '<c-space>'],
        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ 'AcceptSelection("r")': ['<cr>'],
        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
        \ 'PrtHistory(-1)':       ['<c-n>'],
        \ 'PrtHistory(1)':        ['<c-p>'],
        \ 'ToggleFocus()':        ['<c-tab>'],
        \}

Plug 'tpope/vim-vinegar' " navigate up a directory with '-' in netrw, among other things

Plug 'ervandew/supertab'


""""" End Code Navigation ===========


" Add plugins to &runtimepath
call plug#end()



""" UI Tweaks ==========================
set relativenumber " line numbering
set t_Co=256 " Force 256 colors

" Set the vertical split character to  a space (there is a single space after '\ ')
set fillchars+=vert:\ 


" Turn off menu in gui
set guioptions="agimrLt"
" Turn off mouse click in gui
set mouse=""

" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set t_ut= " improve screen clearing by using the background color
set background=dark
syntax enable
colorscheme molokai
set enc=utf-8
let $TERM='screen-256color'

" Highlighting line or number follows....
set cul " highlight current line
" If you want to just highlight the line number:
" hi clear CursorLine
" augroup CLClear
"   autocmd! ColorScheme * hi clear CursorLine
" augroup END
" hi CursorLineNR cterm=bold
" augroup CLNRSet
"   autocmd! ColorScheme * hi CursorLineNR cterm=bold
" augroup END

" Highlight current column
set cuc

" change vim cursor depending on the mode
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " OS X iTerm 2 settings
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
  else
    " linux settings (gnome-terminal)
    " TODO: Presently in GNOME3 terminal seems to ignore this gconf setting.
    " Need to open a bug with them...
    if has("autocmd")
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    endif
  endif
endif

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Open files where we left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
""" End UI Tweaks ======================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" TABS   tt -> create a new tab
""""        tn -> next tab
""""        tp -> previous tab
""""        tc -> close tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap tt :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR>

""" Keyboard shortcut setup =====================
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" NO ARROW KEYS COME ON
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Custom split opening / closing behaviour

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" OPEN/CLOSE  <ctrl> + n  -> new vsplit on the current directory tree
""""             <ctrl> + c  -> close window
""""             <ctrl> + o  -> open the current directory tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright        "to make vsplit put the new buffer on the right of the current buffer
map <C-N> :vsp .<CR>
map <C-C> :q<CR>

" reselect pasted content:
noremap gV `[v`]

" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z


" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open the alternate file
" map ,, <C-^>

" Comment/uncomment blocks by selecting them visually and using # or -#
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

""" End Keyboard shortcut setup =================

""" Vim environment handling tweaks ====

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" display incomplete commands
set showcmd

" Set encoding
set encoding=utf-8

" Start scrolling 3 lines before the border
set scrolloff=3

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Makes foo-bar considered one word
set iskeyword+=-
""" End Vim environment handling tweaks

""" File navigation ====================
" case insensitive highlight matches in normal/visual mode
nnoremap / /\v
vnoremap / /\v
""" End File navigation ================

""" Auto Commands ======================
""""" Filetypes ========================
augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup dotenv
  au!
  au BufNewFile,BufRead *.envrc setlocal filetype=sh
augroup END
""""" End Filetypes ====================

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" au BufWrite * silent call DeleteTrailingWS()    " uncomment to turn on delete white spaces
""""" End Normalization ================
""" End Auto Commands ==================

""" Project-Specific Items =============
" Enable per-project vimrcs
set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
""" End Project-Specific Items =========

""" nvim support =======================
" if has('nvim')
"   set unnamedclip
" endif
""" nvim support =======================

""" New things I learn =================
command TIL tabe~/Documents/TIL.md
""" End New things I learn =============


set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/deps/*,*/_build/*,*/_rel/*,*/node_modules/*,*/dist/*

"" to run tests on the same file
""map <C-k> :w <bar> !mix test -%:p -no-start<CR>
nnoremap <C-t> :w<bar>:Mix test<CR>

"" to getout of TERMINAL mode in neovim
:tnoremap <Esc> <C-\><C-n>

"" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:tnoremap <C-J> <C-W><C-J>
:tnoremap <C-K> <C-W><C-K>
:tnoremap <C-L> <C-W><C-L>
:tnoremap <C-H> <C-W><C-H>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" COLORS in TERMINAL inside neovim
"""" https://github.com/neovim/neovim/issues/2897#issuecomment-115464516
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" BACKUPS & UNDO
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" BUFFERS HELPERS
"""" <F5>  - show buffers
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <F5> :buffers<CR>:buffer<Space>


""""" BACKUP / TMP FILES  -> if you need backup anyway....
" taken from
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
" if isdirectory($HOME . '/.vim/backup') == 0
"   :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
" endif
" set backupdir-=.
" set backupdir+=.
" set backupdir-=~/
" set backupdir^=~/.vim/backup/
" set backupdir^=./.vim-backup/
" set backup
"
" " Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
" if isdirectory($HOME . '/.vim/swap') == 0
"   :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
" endif
" set directory=./.vim-swap//
" set directory+=~/.vim/swap//
" set directory+=~/tmp//
" set directory+=.
"
" " viminfo stores the the state of your previous editing session
" set viminfo+=n~/.vim/viminfo
"
" if exists("+undofile")
"   " undofile - This allows you to use undos after exiting and restarting
"   " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
"   " :help undo-persistence
"   " This is only present in 7.3+
"   if isdirectory($HOME . '/.vim/undo') == 0
"     :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
"   endif
"   set undodir=./.vim-undo//
"   set undodir+=~/.vim/undo//
"   set undofile
" endif



