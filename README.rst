vim-ranger
==========

Copyright (C) 2015 Tianjiao Yin <ytj000@gmail.com>

user guide
----------

`ranger <http://ranger.nongnu.org/>`_ is a file manager with VI key bindings.

This plugin is similar to `nerdtree <https://github.com/scrooloose/nerdtree>`_. 
It overrides the default file browser (netrw), so if you :edit a directory a ranger will be opened. 
When you open a file in ranger, it will be opened in vim.
You could also select multiple files and open'em all at once (use ``v`` to select multiple files in ranger).

tips
-----

Add ``nnoremap <f9> :tabe %:p:h<cr>`` to your vimrc, so that you could use ``<f9>`` to open new files in new tab.
