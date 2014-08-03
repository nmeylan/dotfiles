" Vim color file - nmeylan_scheme
" Modify syntax coloration for ruby And other stuff.
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
runtime! colors/github.vim
let g:colors_name = "nmeylan_scheme"
"General colors
hi Normal       ctermfg=0   ctermbg=255  guifg=#000000   guibg=#ffffff
hi IncSearch    guifg=#0a090a guibg=#ffff5f guisp=#ffff5f gui=bold ctermfg=232 ctermbg=227 cterm=bold
hi Folded       ctermfg=8 ctermbg=15 guifg=#808080 guibg=#ECECEC gui=bold cterm=bold
hi Title        ctermfg=167 guifg=#ef5939
hi StatusLine   guifg=#ffffff guibg=#c00000 guisp=#c00000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
hi StatusLineNC ctermfg=238 ctermbg=252 guifg=#404040 guibg=#d4d4d4 gui=italic cterm=italic
hi VertSplit    ctermfg=250 ctermbg=250 guifg=#bbbbbb guibg=#bbbbbb gui=none cterm=none
hi LineNr       ctermfg=250 ctermbg=0 guifg=#000000 guibg=#ffffff gui=none cterm=none
hi SpecialKey   ctermfg=6 guifg=#177F80 gui=italic cterm=italic
hi WarningMsg   ctermfg=167 guifg=#ef5939
hi ErrorMsg     ctermbg=15 ctermfg=196 guibg=#f8f8ff guifg=#ff1100 gui=undercurl cterm=undercurl
"End general colors
hi Ignore       ctermfg=8 guifg=#808080
hi Identifier   ctermfg=31 guifg=#108888
hi PreProc      ctermfg=247 guifg=#000000 gui=bold cterm=bold
hi Comment      ctermfg=246 guifg=#999988 
hi Constant     ctermfg=6 guifg=#AA2C8C gui=none cterm=none
hi String       ctermfg=161 guifg=#DD1144
hi Function     ctermfg=88 guifg=#990000 gui=bold cterm=bold
hi Statement    ctermfg=0 guifg=#000000 gui=bold cterm=bold
hi Type         ctermfg=60 guifg=#445588 gui=bold   cterm=bold
hi Number       ctermfg=30 guifg=#1C9898
hi Special      ctermfg=221 guifg=#DD1144 guibg=#F7E7F1 
hi Todo         ctermbg=15 ctermfg=196 guifg=#0000FF gui=bold cterm=bold
hi Label        ctermfg=0 gui=bold    cterm=bold
hi StorageClass ctermfg=0 gui=bold    cterm=bold
hi Structure    ctermfg=0 gui=bold    cterm=bold
hi TypeDef      ctermfg=0 gui=bold    cterm=bold
hi Conditional  ctermfg=0 guifg=#000000 gui=bold cterm=bold
