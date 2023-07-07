call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set backspace=indent,eol,start
set secure                  " Disallow shell and write commands in .vimrc, sourced files, or plugins that are owned by someone else
set autoindent		" always set autoindenting on
set history=1000	" keep 1000 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set title               " display title
set wildmode=list:full       " More interactive command-line completion
set relativenumber           " Display line numbers relative to the cursor
set number                   " Display absolute line numbers
set hlsearch                 " Highlight all search matches
set expandtab                " Convert tabs into spaces
set shiftwidth=2             " Number of space characters used for indentation
set softtabstop=2            " Amount of space a tab counts for in edit operations
set kp=ri                    " Program to use for 'K' command. 'ri' is the ruby interactive reference
set scrolloff=2              " Keep 2 lines visible above and below the cursor
set ruler                    " Show cursor position at all times
set laststatus=2             " Make the status line always visible
set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
highlight ExtraTabs ctermbg=gray guibg=#757568

map Q gq
map <Leader>gg :Ggrep -e '<C-R>=expand("<cword>")<Enter>'<Enter>
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

if has("autocmd")


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 200 characters.
  autocmd FileType text setlocal textwidth=200

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd BufRead *.rdoc setlocal filetype=text
  autocmd BufRead *.markdown setlocal filetype=mkd
  autocmd BufRead ruby/**/*.c setlocal noet

  augroup END

else

  set autoindent		" always set autoindenting on

endif


filetype plugin indent on
filetype on
filetype plugin on

syntax on

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
colorscheme vividchalk



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
