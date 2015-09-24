neovim-ranger
==========

Copyright (C) 2015 Tianjiao Yin <ytj000@gmail.com>

with fixes for neovim by Michael Hoang <enzime@users.noreply.github.com>

User Guide
----------

`ranger <http://ranger.nongnu.org/>`_ is a file manager with VI key bindings.

This plugin is similar to `nerdtree <https://github.com/scrooloose/nerdtree>`_. 
It overrides the default file browser (netrw), so if you :edit a directory a ranger will be opened. 
When you open a file in ranger, it will be opened in neovim.
You could also select multiple files and open'em all at once (use ``v`` to select multiple files in ranger).
BTW, don't use it with nerdtree at the same time. 

Requirement
------------

neovim

ranger >= 1.5.1

Tips
-----

Add ``nnoremap <f9> :tabe %:p:h<cr>`` to your nvimrc, so that you could use ``<f9>`` to open new files in new tab.

Known issues
-----------

1. After closing ranger, the prompt waiting for a key press is displayed. This can't be bypassed, and will hopefully be fixed by neovim-0.2.
2. <C-h> does not work in ranger through neovim, zh can be used instead.

Notes
-----

This plugin is forked from the official ranger example here:
https://github.com/hut/ranger/blob/master/examples/vim_file_chooser.vim

There are 2 main differences

1. Unlike the original plugin, in my plugin the files are opened in tabs instead of buffers.
2. Ranger will be opened automatically when you :edit a directory. The original plugin requires to execute a vim command to open ranger.
