""""""""""""""""""
" NeoBundle section "
""""""""""""""""""

set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins go here:
NeoBundle 'tpope/vim-commentary'
NeoBundle 'PotatoesMaster/i3-vim-syntax'
NeoBundle 'ingydotnet/yaml-vim'
NeoBundle 'jnurmine/zenburn'
"NeoBundle 'Matt-Deacalion/vim-systemd-syntax'
NeoBundle 'godlygeek/tabular'
NeoBundle 'elzr/vim-json'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired' " Syntastic uses :lnext and :lprev all the time, 
                              " ]l and [l in unimpaired
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build': {'linux': 'make'}}
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'jeetsukumaran/vim-indentwise'

" All of your Plugins must be added before the following line
call neobundle#end()            " required
filetype plugin indent on    " required

NeoBundleCheck

""""""""""""""""""""""""
" My stuff starts here "
""""""""""""""""""""""""

set t_Co=256
colorscheme zenburn

set pastetoggle=<F10>

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Put .swp files in /tmp, rather than in the working directory.
set directory=~/tmp//,.,/var/tmp//,/tmp//

syntax on
filetype on

" Recommended syntastic settings
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Add // as a json comment prefix
autocmd FileType json set commentstring=//\ %s

" Make # work right, even with smartindent. From :help smartindent
inoremap # X#

" Set modeline, so you can specify filetyle in comments
set modeline

" Control-J splits a line, doing roughly the opposite of Shift-J.
" This is useful for PEP8.
nnoremap <C-J> i<CR><Esc>k$

" Unite.vim stuff
function! Unite_ctrlp()
    execute ':Unite  -buffer-name=files -start-insert buffer file_rec/async:'.ProjectRootGuess().'/'
endfunction

nnoremap <space><space> :call Unite_ctrlp()<cr>

function! Unite_grep()
    execute ':Unite grep:'.ProjectRootGuess().'/'
endfunction

nnoremap <space>/ :call Unite_grep()<cr>

let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
