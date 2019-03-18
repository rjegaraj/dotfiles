set nocompatible
filetype off
set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'       " Plugin manager
Plugin 'junegunn/fzf'               " Fuzzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'JulesWang/css.vim'          " CSS
Plugin 'kchmck/vim-coffee-script'   " CoffeeScript Plugin
Plugin 'Quramy/tsuquyomi'           " TypeScript Plugin
Plugin 'leafgarland/typescript-vim' " Syntax highlight for TypeScript
Plugin 'rking/ag.vim'               " The Silver Searcher
Plugin 'vim-airline/vim-airline'    " Statusbar
Plugin 'cakebaker/scss-syntax.vim'  " SASS Syntax
Plugin 'tpope/vim-commentary'       " Easy commenting
Plugin 'tpope/vim-surround'         " Honestly should be built into vim by default
Plugin 'morhetz/gruvbox'            " Color theme
Plugin 'mbbill/undotree'            " Better undo history

syntax enable
filetype plugin indent on
call vundle#end()

let mapleader=','

set autoread                   " Read file again if changed outside vim, doesn't occur if file is deleted externally
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set clipboard+=unnamed         " Access system clipboard

" http://vim.wikia.com/wiki/Indenting_source_code
set expandtab                  " Expands tab to spaces in insert mode
set softtabstop=4
set shiftwidth=4

set hlsearch                   " Highlights all search pattern matches
set incsearch                  " Enables incremental search

set ignorecase                 " Self-explanatory
set smartcase                  " With both ignorecase and smartcase on, if a pattern contains an uppercase char, it's case sensitive, otherwise it's not

set matchpairs+=<:>            " Adds <:> to the default dictionary of pairs. Useful for HTML dev
set nowrap                     " Display long lines as one line
set number                     " Show line numbers
set scrolloff=5                " Number of context lines above and below the cursor

set encoding=utf-8
set laststatus=2               " Always display status line
set termguicolors              " Use terminal colors

" Setup colors
colorscheme gruvbox
set bg=dark
let g:airline_theme = 'gruvbox'

" TypeScript stuff
au BufEnter *.ts setlocal filetype=typescript
au BufEnter *.ts setlocal textwidth=120
au BufEnter *.ts setlocal colorcolumn=+1
au BufEnter *.ts nnoremap gd :TsuDefinition<CR>

" Wrap text in the quickix window
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost wincmd p
    autocmd FileType qf set nobuflisted
    autocmd FileType qf setlocal wrap
augroup END

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
nnoremap ; :GitFiles -oc --exclude-standard<CR>
nnoremap <C-b> :Buffers<CR>

" Map ag
map <Leader>a :Ag<Space>
let g:ag_working_path_mode="r"

" Gotta learn how to use vim like an expert
noremap <Up> :call StopBeingACasual()<CR>
noremap <Down> :call StopBeingACasual()<CR>
noremap <Left> :call StopBeingACasual()<CR>
noremap <Right> :call StopBeingACasual()<CR>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

function StopBeingACasual()
    echo "Plz, direction keys are for the weak"
endfunction

" Syntactic sugar for other extensions
au BufEnter *.coffee setlocal syntax=coffee
au BufEnter *.underscore setlocal syntax=html
