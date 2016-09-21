" VIM Configuration File
"
"

"""""""""""""""""""""""""""""""""""""""
"
"  1. Basic settings
"
"""""""""""""""""""""""""""""""""""""""
"
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"
"Open netwrc
nmap <silent> <leader>ex :Vexplore<CR>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
"
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set tabstop=2        " tab width is 4 spaces
set backspace=indent,eol,start  " like normal backspace
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120
set fo+=t
set fo-=l
set t_Co=256
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%119v.*/
augroup END
filetype plugin indent on
syntax on
"let g:solarized_termcolors=256
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set nosol       " prevent vim to change column when jumping
set shm=at      " short vim messaged
set hidden
set list listchars=tab:»·,trail:· " display tabs and trailing whitespaces

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set smartcase
set magic
set scrolloff=5   " always keep 5 lines visible above/below cursor
syntax sync minlines=256 "scroll perf

" always cen ter screen on result
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,plugins,*/app/cache/*,*/node_modules,*/dist/*,build,*/vendor
set title                " change the terminal's title

" No annoying alerts
set noerrorbells         " don't beep

" No backup , swap files in /var/tmp
set nobackup
set nowb
set directory=/var/tmp/

"switch paste mode
set pastetoggle=<F2>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" delete to black hole register
nmap D "_d

" js function  auto close
inoremap <expr> {} nr2char(getchar())
inoremap <expr> {}<cr> "{<cr>}<ESC>O"
inoremap <expr> {}} "{<cr>};<ESC>O"
inoremap <expr> {}{ "{<cr>},<ESC>O"
inoremap <expr> {}o "{<cr>})<ESC>O"
inoremap <expr> {}p "{<cr>});<ESC>O"
imap (ff (function (){<cr>});<ESC>O

" folding
set foldmethod=syntax
set foldlevel=6

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"Format the status line
"set statusline=\ %r%{getcwd()}%h\ %{&paste}%F%m%r%h\ %w\ \ \ \ Line:\ %l



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using leader+[jk]
nmap <leader>j mz:m+<cr>`z
nmap <leader>k mz:m-2<cr>`z
vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <leader>h :e~/.vim/help<cr>

" replace word
nnoremap X ciw


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows explore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tm :tabmove<CR>
map <leader>tc :tabclose<CR>

noremap <leader>e :Vexplore<CR>
noremap <leader>q :q<CR>
noremap <leader>= 10<C-W>+
noremap <leader>- 10<C-W>-
noremap <leader>> 20<C-W>>
noremap <leader>< 20<C-W><


" faster scrolling
nnoremap <C-E> 5<C-E>
nnoremap <C-Y> 5<C-Y>

" buffer nav
" last buffer
nnoremap <leader>p :b#<CR>

" quickfix
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

"""""""""""""""""""""""""""""
"
" => SEARCH
"
"""""""""""""""""""""""""""""
nmap <F3> :noautocmd vimgrep // **/*<left><left><left><left><left><left>
nmap gr :noautocmd vimgrep /<C-R><C-W>/ **/*<CR>


"""""""""""""""""""""""""""""
" => quickfix
"""""""""""""""""""""""""""""
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

"""""""""""""""""""""""""""""
"" Gundo
"""""""""""""""""""""""""""""
nnoremap <F11> :GundoToggle<CR>


"""""""""""""""""""""""""""""
"" Airline
"""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 2

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':.'

let g:airline#extensions#tabline#left_sep = '  '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

let g:airline_mode_map = {
  \ 'n': 'N',
  \ 'i': 'I',
  \ 'v': 'v',
  \ 'V': 'V',
  \ 'r': 'R'
\ }

let g:airline_section_x = "%{expand('%:p:.')}"
let g:airline_section_y = "%{fnamemodify(getcwd(), ':t')}"
let g:airline_section_c = "%{expand('%:t')}"

noremap <leader>f :Autoformat<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" CtrlP
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" size for response
let g:ctrlp_max_height = 40
" reuse cache between sessions
let g:ctrlp_clear_cache_on_exit = 0
" search inside hidden files and folders
let g:ctrlp_show_hidden = 1
" number of files to scan, 0=no limit
let g:ctrlp_max_files = 0
" max folder depth
let g:ctrlp_max_depth = 15
" opens ctrlp inside current working directory nearest root parent
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules/*,*/debug/*,*/dist/*

nnoremap <C-P> :CtrlP<CR>
nnoremap <C-P>, :CtrlPBuffer<CR>
nnoremap <C-P>; :CtrlPMRUFiles<CR>
nnoremap <C-P>. :CtrlPLine<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" C++
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing '.' '->' or <C-o>
" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
"set tags+=~/work/sidust/tags
"set tags+=~/work/opcua/tags
"set tags+=~/work/Performance_4149/miniweb/tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Indent guides
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" tern vim
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>th :TernDoc<CR>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>te :TernRename<CR>
nnoremap <leader>tt :TernType<CR>
let g:tern_show_argument_hints='on_hold'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" syntastic
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


""
"" typescript
""
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_tsc_fname = ''
autocmd FileType typescript setlocal completeopt+=preview
nmap <Leader>t :echo tsuquyomi#hint()<CR>


function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Fugitive
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus<CR>10<C-W>+
nnoremap <leader>gd :Gvdiff<CR>

