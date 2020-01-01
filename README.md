# Why
Vim, plugins and all, entirely on an iPad with *iVim* and *Working
Copy*.

## iPad as a development tool or general purpose editor

### Free tools

- *iVim*
- *Working Copy*
- *GitHub* account
- *BitBucket* account

### Buy a bluetooth keyboard
All bluetooth keyboards occassionally go unresponsive for a few
seconds. Bluetooth keyboards work well on the iPad.

For any external keyboard, *iVim* lets you enable the `Alt` key
and remap the `Caps Lock` key to `Ctrl` or `Esc`, so fancy
keyboard config options (like the Anne Pro 2 offers) are not
necessary.

#### Mechanical
"Anne Pro 2" is very compact without any sacrifices for Vim users.

#### Non-mechanical
"Jelly Comb" is low-cost keyboard with a slot to hold
the iPad. Keys are better than usual for non-mechanical. Flashing
bluetooth blue LED is annoying.

### Functionality
- Tools:
    - *iVim*: Vim, Python, and some shell tools
    - *Working Copy*: basic Git repository management
- Functions:
    - edit markdown text
    - script in Vim
    - script in Python
    - manage repos

### Edit markdown text
Vim and Markdown for text editing:

- create a repo in *Working Copy*
- create a markdown doc in *Working Copy*
- open markdown doc in `Preview` mode
- edit doc from *iVim* with `:idoc`
- `Cmd+Tab` between *iVim* and *Working Copy* to go between
  Markdown `Preview` and Markdown editing

### Markdown folding
`iVim` includes the *tpope* `vim-markdown` plugin (as expected
since it's part of Vim).  Install the *nelstrom* plugin
`vim-markdown-folding` plugin for text folding Markdown files.

- `vim-markdown-folding` folds **flat** by default
- `:FoldToggle` toggles between **flat** and **nested**:
    - flat: `zM` shows *all* headings
    - nested: `zM` shows first-level headings

### Additional Vim plugins
Install *tpope* plugins `vim-commentary`, `vim-surround`, and
`vim-repeat`.

# In this repo
This repository contains my *iVim* dotfiles.

## iPad repository locations
Sharing my *iVim* dotfiles in a repo is tedious on an iPad because
there is no command-line Git on an iPad.

- the iPad has no shell (of course)
- *iVim* provides *some* shell commands/utilities (even python3!),
  but unfortunately, no Git

To get around not having a command-line Git, I use *Working Copy*
as a Git GUI.  It is free and, as iPad data-sharing goes, it is
easy to share data with *iVim*. But the repo locations are limited
to the *Working Copy* sandbox.

- I cannot create a repository in the *iVim* `$HOME` folder:
    - iPad app data is sandboxed
    - I can only make a repo through *Working Copy*
    - any repo is therefore part of the *Working Copy* sandbox

There are two ways to *kind of* get around the sandboxed-nature of
the iPad:

1. Use the *Working Copy* GUI to copy *iVim* files into a repo
   managed by *Working Copy*. This sucks because it is a copy.
   Buut it is the only way to share files that need to live in the
   *iVim* sandbox. If there is a way to tell *iVim* to look in the
   *Working Copy* sandbox for settings files (like the `.vimrc`),
   I have yet to find it.
2. Use *iVim* command `:idoc` to edit files managed by *Working
   Copy* repos.

Option 2 has amazing implications. As long as I don't *need* a
file to be visible to *iVim* via it's Vim `runtimepath` variable,
there is no reason to place it in the *iVim* sandbox. Create/clone
the repo in *Working Copy*, then let *iVim* access it there.

For example, this `README.md` only exists in my `ivim-dotvim`
repo in the *Working Copy* sandbox. It does not exist in my *iVim*
`$HOME` directory.

# This repo was created on an iPad
- make a new repository in *Working Copy* named "ivim-dotvim"
- make a new repository on GitHub named "ivim-dotvim"
- From *Working Copy*:
- `Create text file`
    - write this `README.md`
- `Create directory`
    - manually mimic directory structure in `~/.vim` directory,
      starting with `~/.vim`
    - check the directory structure from iVim:

    ```vim
    :!ls -a ~/.vim/ > dir.md
    :e dir.md
    ```

    - repeat for sub-directories
    - Cmd+Tab between *iVim* and *Working Copy*, copying directory
      names from iVim window to clipboard, pasting them in Working
      Copy
- `Import file`
    - works for files that are not hidden
    - but `.` files are hidden
- Copy `.` files:
    - open the dot file in iVim
    - `"+yG` (yank all text in file into clipboard)
    - *Working Copy*: `Import file from clipboard`
