" forked from 
" https://github.com/hut/ranger/blob/master/doc/examples/vim_file_chooser.vim

function! s:RangerChooser(dirname)
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
        " open any remaning items in new tabs
        for name in names[1:]
            exec 'tabe ' . fnameescape(name)
            exec 'filetype detect'
        endfor
        redraw!
    endif
endfunction

au BufEnter *  sil! call s:RangerChooser(expand("<amatch>"))
let g:loaded_netrwPlugin = 'disable'
