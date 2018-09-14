set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Bundle 'jistr/vim-nerdtree-tabs'

augroup CursorLine
	au!
       	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave,BufLeave * setlocal nocursorline
augroup END

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

set number

" Tab navigation like Firefox.
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right>   :tabnext<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py;
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


let python_highlight_all=1
syntax on


" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree -----------------------------
" Open nerdTree when vim opens
autocmd VimEnter * NERDTree
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_no_startup_for_diff=1
let g:nerdtree_tabs_smart_startup_focus=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_synchronize_view=1
let g:nerdtree_tabs_synchronize_focus=1
let g:nerdtree_tabs_focus_on_files=0
let g:nerdtree_tabs_autofind=0

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
