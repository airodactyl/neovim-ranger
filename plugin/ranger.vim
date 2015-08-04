" forked from 
" https://github.com/hut/ranger/blob/master/examples/vim_file_chooser.vim

function! s:RangerChooser(dirname)
    if isdirectory(a:dirname)
        let temp = tempname()
        if has("gui_running")
            exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp) . ' ' . a:dirname
        else
            exec 'silent !ranger --choosefiles=' . shellescape(temp) . ' ' . a:dirname
        endif
        if !filereadable(temp)
            " close window if nothing to read, probably user closed ranger
            close
            redraw!
            return
        endif
        let names = readfile(temp)
        if empty(names)
            " close window if nothing to open.
            close
            redraw!
            return
        endif
        " Edit the first item.
        exec 'edit ' . fnameescape(names[0])
        filetype detect
        " open any remaning items in new tabs
        for name in names[1:]
            exec 'tabe ' . fnameescape(name)
            filetype detect
        endfor
        redraw!
    endif
endfunction

au BufEnter * silent call s:RangerChooser(expand("<amatch>"))
let g:loaded_netrwPlugin = 'disable'
