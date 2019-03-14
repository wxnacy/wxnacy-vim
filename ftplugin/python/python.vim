set tabstop=4 shiftwidth=4 textwidth=79 expandtab ai
nnoremap <buffer> <Leader>F :call FormatPy()<cr>
inoremap <buffer> <Leader>/ """"""<esc>hhi
setlocal foldmethod=indent
setlocal foldignore=

iabbrev <buffer> main if __name__ == "__main__":<cr>
iabbrev <buffer> init def __init__(self, *args, **kwargs):<cr>
iabbrev <buffer> fh #!/usr/bin/env python<cr>
                    \# -*- coding:utf-8 -*-<cr>
                    \# Author: wxnacy
                    \(wxnacy@gmail.com)<cr>
                    \# Description:<cr>
                    \<cr>
autocmd BufNewFile *.py exec ":call NewPyFile()"
function! NewPyFile()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding:utf-8 -*-")
        call append(2, "\# Author: wxnacy(wxnacy@gmail.com)")
        call append(3, "\# Description: ")
    endif

    normal G
    normal o
    normal o
endfunc

function! FormatPy()
    normal 079lF)
    let b:nc = col('.')
    if b:nc < 80
        exec "normal! i\<cr>\<esc>"
    elseif b:nc == 80
        if @@ ==# ')'
            exec "normal! i\<cr>\<esc>"
        else
            normal! F,
            exec "normal! a\<cr>\<esc>"
        endif
    endif
endfunc
" nnoremap  <Leader>F :call FormatPy()<esc>
