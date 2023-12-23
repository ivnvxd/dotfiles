" VIMRC ------------------------------------------------------------------------

set nocompatible " Disable compatibility with vi which can cause unexpected issues.
filetype on " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on " Enable plugins and load plugin for the detected file type.
filetype indent on " Load an indent file for the detected file type.
set scrolloff=10 " Do not let cursor scroll below or above N number of lines when scrolling.
" set magic " Set the magic option. This will allow for regular expressions to be used without escaping special characters.
" set regexpengine=0 " Use the old regexp engine. This will allow for regular expressions to be used without escaping special characters.


" Backup
set history=500 " Set the commands to save in history default number is 20.
set nobackup " Do not save backup files.
set nowb " Do not write backup files.
set noswapfile " Do not create swap files.


" Display
syntax on " Turn syntax highlighting on.
set number " Add numbers to each line on the left-hand side.
set showcmd " Show partial command you type in the last line of the screen.
set showmode " Show the mode you are on the last line.
set ruler " Show the line and column number of the cursor position.
set cmdheight=1 " Set the height of the command bar to 1 line.
set hid " A buffer becomes hidden when it is abandoned


" Indentation
set expandtab " Use space characters instead of tabs.
set smarttab " Insert tabs on the start of a line according to shiftwidth.
set shiftwidth=4 " Set shift width to 4 spaces.
set tabstop=4 " Set tab width to 4 columns.
set autoindent " Auto-indent new lines
set smartindent " Automatically indent new lines.
" set softtabstop=4 " Set the number of columns for a tab character.


" Wrapping
set lbr " Wrap lines at specified characters.
set tw=500 " Set the number of columns for text wrapping.
set wrap "Wrap lines
" set nowrap " Do not wrap lines. Allow long lines to extend as far as the line goes.


" Search
set incsearch " While searching though a file incrementally highlight matching characters as you type.
set ignorecase " Ignore capital letters during search.
set smartcase " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set showmatch " Show matching words during a search.
set hlsearch " Use highlighting when doing a search.

" Wildmenu
set wildmenu " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Wildmenu will ignore files with these extensions.


" COLORS -----------------------------------------------------------------------

try
    " colorscheme snazzy
    colorscheme catppuccin_mocha
catch
endtry


" MAPPINGS ---------------------------------------------------------------------

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Type jj to exit insert mode quickly.
inoremap jj <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" Map the leader key to space.
nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" Delete a line without copying it.
map <leader>d "_dd

" Disable highlight when <leader><cr> is pressed
map <silent> <Esc> :noh<cr>

" Save file
nnoremap <leader>w :w<cr>
nnoremap <C-s> :w<cr>

" Move faster
map J 5j
map K 5k

" Keep joining lines with J
nnoremap <leader>j J

" Move between windows with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easymotion remappings
map <leader>f <leader><leader>s
map <leader>s <Plug>(easymotion-bd-jk)
map <leader>t <Plug>(easymotion-bd-t)

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif


" STATUSLINE -------------------------------------------------------------------

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Show the status on the second to last line.
set laststatus=2


" HELPERS ----------------------------------------------------------------------

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" PLUGINS ----------------------------------------------------------------------

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

call plug#end()
