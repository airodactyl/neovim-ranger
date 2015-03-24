vim-ranger
==========

Copyright (C) 2015 Tianjiao Yin <ytj000@gmail.com>

User Guide
----------

`ranger <http://ranger.nongnu.org/>`_ is a file manager with VI key bindings.

This plugin is similar to `nerdtree <https://github.com/scrooloose/nerdtree>`_. 
It overrides the default file browser (netrw), so if you :edit a directory a ranger will be opened. 
When you open a file in ranger, it will be opened in vim.
You could also select multiple files and open'em all at once (use ``v`` to select multiple files in ranger).
BTW, don't use it with nerdtree at the same time. 

Requirement
------------

ranger >= 1.5.1

Known bug
----------

After opening ranger once and back to vim, you can't use arrow-up/arrow-down to observe vim command line ":" history doesn't work anymore (unless restart vim).
Workaground: use Ctrl+UP/DOWN to observe history, instead of just UP/DOWN.

Tips
-----

Add ``nnoremap <f9> :tabe %:p:h<cr>`` to your vimrc, so that you could use ``<f9>`` to open new files in new tab.
