" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Clear the syntax
syntax clear

" Define highlighting groups
syntax keyword schemerKeyword background light dark
syntax keyword schemerNone NONE
syntax keyword schemerAttrs italic bold
syntax match schemerGroup "^[A-Z][^ ]*"
syntax match schemerName "[ ,]\zs[^# ][^ ]*"
syntax match schemerColor "#[0-9a-fA-F]\+"
syntax match schemerDelims "[,.]" containedin=schemerLinkSource
syntax match schemerLinkLine "^link .*$" contains=schemerLink,schemerLinkSource,schemerLinkDest
syntax keyword schemerLink contained link
syntax match schemerLinkSource "\(link \)\@<=[a-zA-Z,]\+" contained
syntax match schemerLinkDest "[a-zA-Z]\+$" contained
syntax region schemerComment start=/^ *"/ end="$"
syntax region schemerPalette start="^palette:" end="\." contains=schemerPaletteKeyword,schemerPaletteColorName,schemerPaletteColorVal,schemerComment
syntax match schemerPaletteColorName "^ *\zs[^ ]\+" contained
syntax match schemerPaletteColorVal "#[a-fA-F0-9]\+" contained
syntax keyword schemerPaletteKeyword palette contained

" Perform the actual highlighting
hi def link schemerKeyword Include
hi def link schemerGroup Statement
hi def link schemerLinkSource Statement
hi def link schemerColor Constant
hi def link schemerNone Include
hi def link schemerDelims Delimiter
hi def link schemerAttrs String
hi def link schemerLink Operator
hi def link schemerLinkDest Identifier
hi def link schemerComment Comment
hi def link schemerPaletteColorName Number
hi def link schemerPaletteColorVal Constant
hi def link schemerPaletteKeyword Include
hi def link schemerName Number

let b:current_syntax = "schemer"
let &cpo = s:cpo_save
unlet s:cpo_save
