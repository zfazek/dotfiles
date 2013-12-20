" Vim indent file
" Language:    Ttcn.cfg
" Maintainer:  Zoltan Fazekas, zoltan.fazekas@ericsson.com
" Created:     2012 Mar 25
" Last Change: 2012 Mar 25
"
" This is version 1.0

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetTtcnIndent(v:lnum)

if exists("*GetTtcnIndent")
    finish
endif

function! s:GetPrevNonCommentLineNum( line_num )

    " Skip lines starting with a comment
    " let SKIP_LINES = '^\s*\(\((\*\)\|\(\*\ \)\|\(\*)\)\|{\|}\)'
    let SKIP_LINES = '^\s*\(\/\/\|\*\|\/\*\)'

    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile

    return nline
endfunction

function! GetTtcnIndent( line_num )

    " Line 0 always goes at column 0
    if a:line_num == 0
        return 0
    endif

    let this_codeline = getline( a:line_num )

    " Middle of a three-part comment
    if this_codeline =~ '^\s*\*'
        return indent( a:line_num - 1)
    endif

    let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
    let prev_codeline = getline( prev_codeline_num )
    let indnt = indent( prev_codeline_num )

    if prev_codeline =~ '{' && prev_codeline !~ '}'
        return indnt + &shiftwidth
    endif

    if this_codeline =~ '}' && this_codeline !~ '{'
        return indnt - &shiftwidth
    endif

    " If nothing changed, return same indent.
    return indnt
endfunction

