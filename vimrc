set nocompatible
filetype off
set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'JulesWang/css.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdtree'

syntax enable
filetype plugin indent on
call vundle#end()

let mapleader=','

set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set hlsearch
set ignorecase
set incsearch
set matchpairs+=<:>
set nowrap
set number
set scrolloff=5
set shiftwidth=4
set smartcase
set softtabstop=4
syntax on

set encoding=utf-8
set laststatus=2 " Always display status line

" Set line number color to Dark Grey
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" TypeScript stuff
let g:tsuquyomi_completion_detail = 1
au BufEnter *.ts setlocal filetype=typescript
au BufEnter *.ts setlocal textwidth=120
au BufEnter *.ts setlocal colorcolumn=+1
au BufEnter *.ts nnoremap gd :TsuDefinition<CR>

" Trailing whitespace
au BufWrite * :%s/\s\+$//e

" Clear search highlighting when entering insert mode, re-enable when exiting
au InsertEnter * set nohlsearch
au InsertLeave * set hlsearch

" Searching & Buffers
set hidden
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Gotta learn how to use my own shortcuts
cnoreabbrev bn :call ShortcutTutor({ 'command': 'bn', 'shortcut': 'Tab' })
cnoreabbrev bp :call ShortcutTutor({ 'command': 'bp', 'shortcut': 'S-Tab' })

" Takes in a dictionary of signature { command: String, shortcut: String} and
" forces you to use the custom shortcut instead of built-in command
function ShortcutTutor(dictionary)
    echo "Use " . a:dictionary.shortcut . " instead of " . a:dictionary.command
endfunction

" fzf mappings
nnoremap ; :GitFiles -oc<CR>
nnoremap <C-b> :Buffers<CR>

" Map ack
map <Leader>a :Ack!<Space>

" Gotta learn how to use vim like an expert
noremap <Up> :call StopBeingACasual()<CR>
noremap <Down> :call StopBeingACasual()<CR>
noremap <Left> :call StopBeingACasual()<CR>
noremap <Right> :call StopBeingACasual()<CR>
inoremap <Up> :call StopBeingACasual()<CR>
inoremap <Down> :call StopBeingACasual()<CR>
inoremap <Left> :call StopBeingACasual()<CR>
inoremap <Right> :call StopBeingACasul()<CR>

function StopBeingACasual()
    echo "Plz, direction keys are for the weak"
endfunction

" NERDTree mappings
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" TODO: Remove when we migrate off CoffeeScript
au BufEnter *.coffee setlocal syntax=coffee
au BufEnter *.underscore setlocal syntax=html
