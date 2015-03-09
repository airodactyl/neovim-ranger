" forked from 
" https://github.com/hut/ranger/blob/master/doc/examples/vim_file_chooser.vim

function! RangeChooser(dirname)
    if isdirectory(a:dirname)
        let temp = tempname()
        exec 'silent !ranger --choosefiles=' . shellescape(temp) . ' ' . a:dirname
        if !filereadable(temp)
            redraw!
            " Nothing to read.
            return
        endif
        let names = readfile(temp)
        if empty(names)
            redraw!
            " Nothing to open.
            return
        endif
        " Edit the first item.
        exec 'edit ' . fnameescape(names[0])
        exec 'filetype detect'
        " Add any remaning items to the arg list/buffer list.
        for name in names[1:]
            exec 'tabe ' . fnameescape(name)
        endfor
        redraw!
    endif
endfunction

au BufEnter *  sil! call RangeChooser(expand("<amatch>"))
let g:loaded_netrwPlugin = 'disable'
