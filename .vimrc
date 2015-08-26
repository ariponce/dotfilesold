"  "" PACKAGES

" no vi compatibility
set nocompatible
set encoding=utf-8

""" VUNDLE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle "flazz/vim-colorschemes"
Bundle "kien/ctrlp.vim"

" vim main plugins
Bundle "sjl/gundo.vim"
Bundle "bling/vim-airline"
Bundle "jlanzarotta/bufexplorer"
Bundle "scrooloose/syntastic.git"
Bundle "vim-scripts/tComment"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "jiangmiao/auto-pairs"
Bundle "airblade/vim-gitgutter"
Bundle "scrooloose/nerdtree"
Bundle "vits/ZoomWin"
Bundle 'arnaud-lb/vim-php-namespace'
Bundle "unblevable/quick-scope"
"Bundle "Valloric/YouCompleteMe"
Bundle "powerline/powerline"
Bundle "easymotion/vim-easymotion"
Bundle "scrooloose/nerdcommenter"
Bundle "majutsushi/tagbar"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
Bundle "junegunn/vim-easy-align"
Bundle "tpope/vim-repeat"
Bundle "Shougo/neocomplete.vim"

""" LANGUAGES
Bundle "vim-php/vim-php-refactoring"
Bundle "shawncplus/phpcomplete.vim"
Bundle "fatih/vim-go"

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on


""" SETTINGS AND KEYBINDS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set number
set noignorecase
set vb
set nowrap
" Show the current mode
set showmode
set autoread
" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Save swp to custom folders
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" syntax highlighting
syntax on
set background=dark
let g:hybrid_use_Xresources=1
colorscheme hybrid

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
" set <leader>
let mapleader=","

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>
nnoremap <leader>g :CtrlPTag<cr>
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0 
let g:ctrlp_working_path_mode = ''

""" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-w>w :ZoomWin<CR>

imap jj <esc>
cmap jj <esc>

map <leader>n :bn<CR>
map <leader>p :bp<CR>
map <leader>d :bd<CR>

""" Saving and exiting
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

""" Remove highlights
nnoremap <leader>c :nohl<CR>

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="hybrid"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

set laststatus=2

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" php-namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

set tags=~/.vim/tags/mce,~/.vim/tags/lumen,tags

let g:SuperTabDefaultCompletionType = ""

""" auto-open NerdTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""" Only enable the quick-scope plugin highlighting when using the f/F/t/T movements
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81

""" YouCompleteMe
"let g:ycm_collect_identifiers_from_tags_files = 1

""" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:neocomplete#enable_at_startup = 1

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"
