" run python script always save first
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

nnoremap <Space> :


vmap <C-c> "*y 
nmap <C-c> "*Y
nmap <C-v> "*p


"show number line and relative number from 1 to cursor
set nu
set relativenumber

"line on cursor
set cursorline 

" no wrap line if its to long
set nowrap

"enable mouse
set mouse=a

"enable syntax highlight
syntax enable

set expandtab
set sw=4
set sts=4

" show the matching part of the pair for [] {} and ()
set showmatch
set smartindent
set smarttab
set autoindent
set shiftwidth=4

" split screen 

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" enable all Python syntax highlighting features
let python_highlight_all = 1

""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O

"############################################### Vundle instaling ###########
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" dobra coś nowego do dodania

"############################################# PLUGINS ###########




"Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdtree'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"let NERDTreeShowHidden=1


"Plugin 'jistr/vim-nerdtree-tabs'

"power line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" ############################################ COLOR #####################

set background=dark
let g:solarized_termcolors=256
set t_Co=256
"colorscheme solarized

colorscheme gruvbox
"colorscheme onedark


"##################################################
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" auto save undo file
set undodir=~/.vim/undodir
set undofile

" Let's save undo info!
"if !isdirectory($HOME."/.vim")
""    call mkdir($HOME."/.vim", "", 0770)
"endif
"if !isdirectory($HOME."/.vim/undo-dir")
"    call mkdir($HOME."/.vim/undo-dir", "", 0700)
"endif
"set undodir=~/.vim/undo-dir
"set undofile
