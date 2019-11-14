Vim Trusted Local
=================

This plugin adds support for project-local vimrc files, but with the benefit of
requiring you to specifically "trust" the file before it will be loaded.

Local vimrcs
------------

The "trust" mechanism works by creating a directory in git when trusting the
file, and then using that directory as an ad-hoc safe lookup path. Specifically,
we use `./.git/safe/../../.vimrc.local` as the path to the file.

Trusting
--------

For convenience, the plugin will automatically "trust" (create the `.git/safe`
dir) if you `:write` a `.vimrc.local` file in Vim. If you prefer, you can
explictly "trust" the file by creating the `.git/dir` 
