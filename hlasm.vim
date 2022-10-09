syntax case ignore
setlocal iskeyword+=*

" Line comment if * is 1st char.
syntax match hlasmLineComment /^\*.*/
" Identifier or Leading blanks before Opcode
syntax match hlasmIdentifier  /^[^* ]\+/ nextgroup=hlasmOpcode skipwhite 
syntax match hlasmLeadBlank   /^ \+/     nextgroup=hlasmOpcode
" Opcode + Operand + Comment
syntax match hlasmOpcode      /[^* ]\+/  contained nextgroup=hlasmOperands skipwhite 
syntax match hlasmOperands    /[^ ]\+/   transparent contained nextgroup=hlasmComment skipwhite contains=hlasmSymbol,hlasmNumber,hlasmLiteral
syntax match hlasmComment     /[^ ]\+.*$/ contained
" Operand elements
syntax match hlasmSymbol      /[^0-9()\-+=/,' ][^()\-+=,/' ]*/ contained
syntax match hlasmNumber      /[0-9]\+/ contained
" syntax match hlasmLiteral      /[CXFHB]\(L[0-9]\+\)\{,1\}'[^']\+'/ contained
syntax region hlasmLiteral matchgroup=hlasmQuote start=/[CXFHB]\(L[0-9]\+\)\{,1\}'/ end=/'/

highlight link hlasmLineComment Comment
highlight link hlasmComment Comment
highlight link hlasmIdentifier Identifier
highlight link hlasmOpcode Statement

highlight Identifier ctermfg=White
highlight Statement ctermfg=Cyan
highlight Comment ctermfg=Darkgrey
highlight hlasmSymbol ctermfg=Blue
highlight hlasmNumber ctermfg=Magenta
highlight hlasmLiteral ctermfg=Yellow
highlight hlasmQuote ctermfg=White
