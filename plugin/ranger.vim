" forked from 
" https://github.com/hut/ranger/blob/master/examples/vim_file_chooser.vim
" https://github.com/Mizuchi/vim-ranger/blob/master/plugin/ranger.vim

function! s:RangerMagic(dirname)
	if exists('g:rangered')
		let rangered = g:rangered
		unlet g:rangered

		if !filereadable(rangered)
			return
		endif

		let names = readfile(rangered)

		if empty(names)
			return
		endif

		exec 'edit ' . fnameescape(names[0])
        filetype detect

		for name in names[1:]
            exec 'tabe ' . fnameescape(name)
            filetype detect
        endfor
	elseif isdirectory(a:dirname)
		let g:rangered = tempname()
		bdelete!
		exec 'terminal ranger --choosefiles=' . shellescape(g:rangered) . ' ' . shellescape(a:dirname)
	endif
endfunction

au BufEnter * silent call s:RangerMagic(expand("<amatch>")) 
let g:loaded_netrwPlugin = 'disable'
