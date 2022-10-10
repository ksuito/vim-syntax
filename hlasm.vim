" Vim syntax file
" Language: IBM High-Level-Assembler
" Maintainer: Kazuki Niidome <example@vim.org>
" Last Change: 2022 Oct 22
"
syntax case ignore

" Line comment if * is 1st char.
syntax match hlasmComment   /^\*.*/
" Label or Leading blanks 
syntax match hlasmLabel     /^[^* ]\+/ nextgroup=hlasmOpcode skipwhite  
syntax match hlasmLeadBlank /^ \+/     nextgroup=hlasmOpcode

" Opcode -> Operands -> Comment
syntax match hlasmOpcode    /[^ ]\+/    contained nextgroup=hlasmOperands  
syntax match hlasmOperands  / \+[^ ]\+/ contained nextgroup=hlasmComment2 skipwhite transparent 
  \ contains=hlasmSymbol,hlasmNumber,
  \          hlasmLiteral,hlasmDCspec,hlasmAcon,
  \          hlasmDSspec,hlasmDSspec2,
  \          hlasmString
syntax match hlasmComment2  /[^ ]\+.*$/ contained contains=NONE

" Basic Items 
syntax match hlasmSymbol    /[A-Z$#][A-Z$#0-9]*/ contained contains=NONE
syntax match hlasmNumber    /[0-9]\+/ contained

" DS specification
syntax match hlasmDSspec    / [0-9]*[ADPCXFHB]\(L[0-9]\+\)\?$/ contained contains=hlasmType
syntax match hlasmDSspec2   / [0-9]*[ADPCXFHB]\(L[0-9]\+\)\? / contained contains=hlasmType
" DC specification, Literal, Immediate
syntax match hlasmDCspec    / [0-9]*[BXCPFHEDL]\(L[0-9]\+\)\?'[^']*'/ transparent contained
  \ contains=hlasmType,hlasmString
syntax match hlasmLiteral   /[,=][0-9]*[BXCPFHEDL]\(L[0-9]\+\)\?'[^']*'/ transparent contained
  \ contains=hlasmType,hlasmString 
" Type 
syntax match hlasmType      /[0-9]*[CXFHB]\(L[0-9]\+\)\?/ contained contains=NONE
" String in Quotes 
syntax match hlasmString    /'[^']*'/ms=s+1,me=e-1 contained contains=NONE

" Address Constant (ACON,VCON,SCON)
syntax match hlasmAcon      /[AVS]([^),]\+)/ contained contains=hlasmAconChar,hlasmSymbol
syntax match hlasmAconChar  /[AVS](/he=e-1 contained

" Error line
syntax match hlasmBadline   /^.\{81,\}$/ 

highlight link hlasmBadline Error
highlight link hlasmComment Comment
highlight link hlasmComment2 Comment
highlight link hlasmLabel Label
highlight link hlasmNumber Number
highlight link hlasmOpcode Statement
highlight link hlasmSymbol Special
highlight link hlasmString String
highlight link hlasmType Type
highlight link hlasmAconChar Type

" to see the line.
highlight Error ctermfg=White
