call pathogen#infect()
call pathogen#helptags()

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.vim/verbose.log
        set verbose=9
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_flake8_args="--max-line-length=160"

" airline
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1

let mapleader=","

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

filetype plugin indent on
syntax on

set number
set autoread
set ruler
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
set backspace=indent,eol,start

set wildmenu
set wildmode=longest:list

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set si

set hlsearch
set incsearch

"vnoremap <silent> * :call VisualSelection('f')<CR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

colorscheme jellyx
"colorscheme brogrammer

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" 2 spaces in Puppet / Ruby
autocmd Filetype puppet setlocal ts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sw=2
autocmd Filetype tf setlocal ts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sw=2
autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype css setlocal ts=2 sw=2
autocmd Filetype scss setlocal ts=2 sw=2
autocmd Filetype js setlocal ts=2 sw=2
autocmd Filetype c setlocal ts=2 sw=2

nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload

autocmd FileType python runtime! autoload/pythoncomplete.vim
