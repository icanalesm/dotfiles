" vi:syntax=vim

" Scheme name: Default Dark
" Scheme author: Chris Kempson (http://chriskempson.com)
"
" My base16-default-dark colour scheme for vim, based on base16-vim
" (https://github.com/chriskempson/base16-vim) and tinted-vim
" (https://github.com/tinted-theming/tinted-vim).
"
" It is assumed that a 256-colour terminal is configured with base16-shell
" (https://github.com/chriskempson/base16-shell) or tinted-shell
" (https://github.com/tinted-theming/tinted-shell) to use the
" base16-default-dark theme.

" GUI colors
let s:gui_00      = "181818"
let s:gui_01      = "282828"
let s:gui_02      = "383838"
let s:gui_03      = "585858"
let s:gui_04      = "b8b8b8"
let s:gui_05      = "d8d8d8"
let s:gui_06      = "e8e8e8"
let s:gui_07      = "f8f8f8"
let s:gui_red     = "ab4642"
let s:gui_orange  = "dc9656"
let s:gui_yellow  = "f7ca88"
let s:gui_green   = "a1b56c"
let s:gui_cyan    = "86c1b9"
let s:gui_blue    = "7cafc2"
let s:gui_magenta = "ba8baf"
let s:gui_brown   = "a16946"

" Terminal colors
let s:cterm_00      = "00"
let s:cterm_01      = "18"
let s:cterm_02      = "19"
let s:cterm_03      = "08"
let s:cterm_04      = "20"
let s:cterm_05      = "07"
let s:cterm_06      = "21"
let s:cterm_07      = "15"
let s:cterm_red     = "01"
let s:cterm_orange  = "16"
let s:cterm_yellow  = "03"
let s:cterm_green   = "02"
let s:cterm_cyan    = "06"
let s:cterm_blue    = "04"
let s:cterm_magenta = "05"
let s:cterm_brown   = "17"

" Integrated terminal colors
let g:terminal_ansi_colors = [
    \ "#181818",
    \ "#ab4642",
    \ "#a1b56c",
    \ "#f7ca88",
    \ "#7cafc2",
    \ "#ba8baf",
    \ "#86c1b9",
    \ "#d8d8d8",
    \ "#585858",
    \ "#ab4642",
    \ "#a1b56c",
    \ "#f7ca88",
    \ "#7cafc2",
    \ "#ba8baf",
    \ "#86c1b9",
    \ "#f8f8f8"
\]

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16-default-dark"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Tinted_Hi(group, guifg, guibg, ctermfg, ctermbg, ...)

  " Clear the highlight to be more robust against default Highlighting changes
  exec "hi! clear " . a:group

  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  " See :help highlight-guifg
  let l:gui_special_names = ["NONE", "bg", "background", "fg", "foreground"]

  if a:guifg !=? ""
    if index(l:gui_special_names, a:guifg) >= 0
      exec "hi! " . a:group . " guifg=" . a:guifg
    else
      exec "hi! " . a:group . " guifg=#" . a:guifg
    endif
  endif
  if a:guibg !=? ""
    if index(l:gui_special_names, a:guibg) >= 0
      exec "hi! " . a:group . " guibg=" . a:guibg
    else
      exec "hi! " . a:group . " guibg=#" . a:guibg
    endif
  endif
  if a:ctermfg !=? ""
    exec "hi! " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg !=? ""
    exec "hi! " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr !=? ""
    exec "hi! " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp !=? ""
    if index(l:gui_special_names, l:guisp) >= 0
      exec "hi! " . a:group . " guisp=" . l:guisp
    else
      exec "hi! " . a:group . " guisp=#" . l:guisp
    endif
  endif
endfunction

fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Tinted_Hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
" (see :h highlight-groups and :so $VIMRUNTIME/syntax/hitest.vim)
"call <sid>hi("ColorColumn",   "", s:gui_01, "", s:cterm_01, "none", "")
"call <sid>hi("Conceal",       s:gui_blue, s:gui_00, s:cterm_blue, s:cterm_00, "", "")
call <sid>hi("Cursor",        "bg", "fg", "", "", "", "")
hi! link lCursor Cursor
hi! link CursorIM Cursor
call <sid>hi("CursorColumn",  "", s:gui_01, "", s:cterm_01, "none", "")
call <sid>hi("CursorLine",    "", s:gui_01, "", s:cterm_01, "none", "")
call <sid>hi("Directory",     s:gui_blue, "", s:cterm_blue, "", "", "")
call <sid>hi("DiffAdd",      s:gui_green, s:gui_01,  s:cterm_green, s:cterm_01, "", "")
call <sid>hi("DiffChange",   s:gui_03, s:gui_01,  s:cterm_03, s:cterm_01, "", "")
call <sid>hi("DiffDelete",   s:gui_red, s:gui_01,  s:cterm_red, s:cterm_01, "", "")
call <sid>hi("DiffText",     s:gui_blue, s:gui_01,  s:cterm_blue, s:cterm_01, "", "")
hi! link EndOfBuffer NonText
call <sid>hi("ErrorMsg",      s:gui_red, s:gui_00, s:cterm_red, s:cterm_00, "", "")
call <sid>hi("VertSplit",     s:gui_02, s:gui_02, s:cterm_02, s:cterm_02, "none", "")
"call <sid>hi("Folded",        s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "", "")
"call <sid>hi("FoldColumn",    s:gui_cyan, s:gui_01, s:cterm_cyan, s:cterm_01, "", "")
call <sid>hi("SignColumn",    s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "", "")
hi! link IncSearch CurSearch
call <sid>hi("LineNr",        s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "", "")
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
call <sid>hi("CursorLineNr",  s:gui_04, s:gui_01, s:cterm_04, s:cterm_01, "bold", "")
"hi! link CursorLineFold FoldColumn
"hi! link CursorLineSign SignColumn
call <sid>hi("MatchParen",    "", s:gui_03, "", s:cterm_03,  "", "")
"Add MessageWindow
call <sid>hi("ModeMsg",       s:gui_05, "", s:cterm_05, "", "", "")
call <sid>hi("MoreMsg",       s:gui_green, "", s:cterm_green, "", "", "")
call <sid>hi("NonText",       s:gui_03, "", s:cterm_03, "", "", "")
call <sid>hi("Normal",        s:gui_05, s:gui_00, s:cterm_05, s:cterm_00, "", "")
call <sid>hi("PMenu",         s:gui_05, s:gui_01, s:cterm_05, s:cterm_01, "none", "")
call <sid>hi("PMenuSel",      s:gui_01, s:gui_05, s:cterm_01, s:cterm_05, "none", "")
hi! link PMenuKind PMenu
hi! link PMenuKindSel PMenuSel
hi! link PMenuExtra PMenu
hi! link PMenuExtraSel PMenuSel
call <sid>hi("PMenuSbar",     "", s:gui_03, "", s:cterm_03, "", "")
call <sid>hi("PMenuThumb",    "", s:gui_04, "", s:cterm_04, "", "")
"Add PopupNotification
call <sid>hi("Question",      s:gui_blue, "", s:cterm_blue, "", "", "")
call <sid>hi("QuickFixLine",  "", s:gui_01, "", s:cterm_01, "none", "")
call <sid>hi("Search",        "", s:gui_03, "", s:cterm_03,  "", "")
call <sid>hi("CurSearch",     s:gui_00, s:gui_green, s:cterm_00, s:cterm_green,  "", "")
call <sid>hi("SpecialKey",    s:gui_03, "", s:cterm_03, "", "", "")
call <sid>hi("SpellBad",     "", "", s:cterm_00, s:cterm_red, "undercurl", s:gui_red)
call <sid>hi("SpellCap",     "", "", s:cterm_00, s:cterm_blue, "undercurl", s:gui_blue)
call <sid>hi("SpellLocal",   "", "", s:cterm_00, s:cterm_cyan, "undercurl", s:gui_cyan)
call <sid>hi("SpellRare",    "", "", s:cterm_00, s:cterm_magenta, "undercurl", s:gui_magenta)
call <sid>hi("StatusLine",    s:gui_04, s:gui_02, s:cterm_04, s:cterm_02, "none", "")
call <sid>hi("StatusLineNC",  s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "none", "")
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
"call <sid>hi("TabLine",       s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "none", "")
"call <sid>hi("TabLineFill",   s:gui_03, s:gui_01, s:cterm_03, s:cterm_01, "none", "")
"call <sid>hi("TabLineSel",    s:gui_green, s:gui_01, s:cterm_green, s:cterm_01, "none", "")
"Add Terminal
call <sid>hi("Title",         s:gui_blue, "", s:cterm_blue, "", "", "")
call <sid>hi("Visual",        "", s:gui_02, "", s:cterm_02, "", "")
"call <sid>hi("VisualNOS",     s:gui_red, "", s:cterm_red, "", "", "")
call <sid>hi("WarningMsg",    s:gui_orange, "", s:cterm_orange, "", "", "")
call <sid>hi("WildMenu",      s:gui_00, s:gui_05, s:cterm_00, s:cterm_05, "", "")
"Add ToolbarLine
"Add ToolbarButton

" Syntax highlight groups
" (see :h group-name and :so $VIMRUNTIME/syntax/hitest.vim)
call <sid>hi("Comment",      s:gui_green, "", s:cterm_green, "", "italic", "")
call <sid>hi("Constant",     s:gui_orange, "", s:cterm_orange, "", "none", "")
"call <sid>hi("String",       s:gui_green, "", s:cterm_green, "", "italic", "")
"call <sid>hi("Character",    s:gui_red, "", s:cterm_red, "", "", "")
"call <sid>hi("Number",       s:gui_orange, "", s:cterm_orange, "", "none", "")
"call <sid>hi("Boolean",      s:gui_orange, "", s:cterm_orange, "", "none", "")
"call <sid>hi("Float",        s:gui_orange, "", s:cterm_orange, "", "none", "")
hi! link Identifier Normal
"call <sid>hi("Function",     s:gui_blue, "", s:cterm_blue, "", "none", "")
call <sid>hi("Statement",    s:gui_magenta, "", s:cterm_magenta, "", "", "")
"call <sid>hi("Conditional",  s:gui_blue, "", s:cterm_blue, "", "none", "")
"call <sid>hi("Repeat",       s:gui_blue, "", s:cterm_blue, "", "", "")
"call <sid>hi("Label",        s:gui_blue, "", s:cterm_blue, "", "", "")
hi! link Operator Normal
"call <sid>hi("Keyword",      s:gui_blue, "", s:cterm_blue, "", "", "")
"call <sid>hi("Exception",     s:gui_blue, "", s:cterm_blue, "", "", "")
call <sid>hi("PreProc",      s:gui_magenta, "", s:cterm_magenta, "", "", "")
"call <sid>hi("Include",      s:gui_blue, "", s:cterm_blue, "", "", "")
"call <sid>hi("Define",       s:gui_magenta, "", s:cterm_magenta, "", "none", "")
"call <sid>hi("Macro",         s:gui_red, "", s:cterm_red, "", "", "")
"call <sid>hi("PreCondit",      s:gui_cyan, "", s:cterm_cyan, "", "none", "")
call <sid>hi("Type",         s:gui_blue, "", s:cterm_blue, "", "none", "")
"call <sid>hi("StorageClass", s:gui_yellow, "", s:cterm_yellow, "", "none", "")
"call <sid>hi("Structure",    s:gui_magenta, "", s:cterm_magenta, "", "", "")
"call <sid>hi("Typedef",      s:gui_yellow, "", s:cterm_yellow, "", "none", "")
call <sid>hi("Special",      s:gui_brown, "", s:cterm_brown, "", "none", "")
"call <sid>hi("SpecialChar",  s:gui_brown, "", s:cterm_brown, "", "", "")
"call <sid>hi("Tag",          s:gui_yellow, "", s:cterm_yellow, "", "", "")
"call <sid>hi("Delimiter",    s:gui_brown, "", s:cterm_brown, "", "", "")
"call <sid>hi("SpecialComment", s:gui_yellow, "", s:cterm_yellow, "", "italic", "")
"call <sid>hi("Debug",         s:gui_red, "", s:cterm_red, "", "", "")
call <sid>hi("Underlined",   s:gui_magenta, "", s:cterm_magenta, "", "underline", "")
call <sid>hi("Ignore",       "", "", "", "", "", "")
call <sid>hi("Error",        s:gui_red, "", s:cterm_red, "", "bold", "")
call <sid>hi("Todo",         s:gui_cyan, "", s:cterm_cyan, "", "bold", "")
call <sid>hi("Added",        s:gui_green, "", s:cterm_green, "", "italic", "")
call <sid>hi("Changed",      s:gui_blue, "", s:cterm_blue, "", "italic", "")
call <sid>hi("Removed",      s:gui_red, "", s:cterm_red, "", "italic", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui_00 s:gui_01 s:gui_02 s:gui_03 s:gui_04 s:gui_05 s:gui_06 s:gui_07 s:gui_red s:gui_orange s:gui_yellow s:gui_green s:gui_cyan s:gui_blue s:gui_magenta s:gui_brown
unlet s:cterm_00 s:cterm_01 s:cterm_02 s:cterm_03 s:cterm_04 s:cterm_05 s:cterm_06 s:cterm_07 s:cterm_red s:cterm_orange s:cterm_yellow s:cterm_green s:cterm_cyan s:cterm_blue s:cterm_magenta s:cterm_brown
