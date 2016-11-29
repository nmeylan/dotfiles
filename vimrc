call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme vividchalk

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
autocmd FileType ruby map <F6> :w<CR>:!ruby %<CR>
set nocompatible
set backspace=indent,eol,start
set autoindent		" always set autoindenting on
set history=1000	" keep 1000 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set title               " display title
set wildmode=list:full 
set relativenumber
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set kp=ri
set autoindent		" always set autoindenting on
set scrolloff=2
set ruler
set laststatus=2
set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)
set exrc
set secure
map Q gq
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

:let mapleader = ","


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set lines=40
  set columns=80
endif

au BufNewFile,BufRead *.ltx                      set wm=4

syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
filetype on
filetype plugin on


fun GitGrep(...) 
        let save = &grepprg 
        set grepprg=git\ grep\ -n\ $* 
        let s = 'grep' 
        for i in a:000 
                let s = s . ' ' . i 
        endfor 
        exe s 
        let &grepprg = save 
endfun 

command -nargs=? G call GitGrep(<f-args>)

func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <C-x>G :call GitGrepWord()<CR>

map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
highlight ExtraTabs ctermbg=gray guibg=#757568
let ruby_space_errors = 1
let c_space_errors = 1

" Changelog configuration
let g:changelog_username='Nicolas Meylan from Aaron Patterson .vimrc file : https://github.com/tenderlove/dot_vim.git'
let g:changelog_dateformat='%c'

" git grep
map <Leader>gg :Ggrep -e '<C-R>=expand("<cword>")<Enter>'<Enter>

setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad    ctermfg=darkred ctermbg=000     cterm=none      guifg=#FFFFFF   guibg=#000000   gui=none
set t_Co=256
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

if (has('gui_running'))
  let g:lightline = {
        \ 'component': {
        \   'readonly': '%{&readonly?"":""}',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
  set guifont=Inconsolata\ for\ Powerline:h14
endif

let g:vim_markdown_folding_disabled=1

com! FormatJSON %!python -m json.tool
