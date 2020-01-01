" Mike's .vimrc for iVim on ios{{{
" Created: 2019-12-7
" iPad .vimrc is located in $HOME/.vimrc
" see ~/vim-notes.md
" TODO: install timpope's surrounds.vim
" TODO: install NERDTree
"}}}
" Vim behavior{{{
" Make Vim behave in a more useful way{{{
set nocompatible
" Put this at the start of the vimrc file.}}}
" Undo history persists after file is closed and reopened{{{
set undofile"}}}
" Show keystrokes in bottom right of screen{{{
set showcmd"}}}
" Turn on filetype detection, filetype plugins, and indent files{{{
filetype plugin indent on
syntax on
" see :h vimrc-filetype}}}
" Open vertical splits to the right with :vnew and ;wv{{{
set splitright"}}}
"}}}
" Appearance{{{
" allow cursor to reach top and bottom of screen (H L zt zb){{{
set scrolloff=0
" see :h scroll-cursor for more scroll commands}}}
" show line numbers{{{
set number relativenumber
"}}}
" use two screenlines for the command line{{{
set cmdheight=2"}}}
" always show a status line for the last window{{{
set laststatus=2"}}}
" highlight the line we're on{{{
set cursorline"}}}
" show the textwidth as a highlighted column{{{
set colorcolumn=+1
set textwidth=66"}}}
" show whitespace{{{
exec "set listchars=tab:>-,trail:\uB7,space:\uB7"
set list"}}}
"}}}
" Folds{{{
" set foldmethod=manual{{{
" zf and zd create and destroy invisible fold markers
" Manual is the default.}}}
" set foldmethod=marker{{{
" zf and zd create and destroy fold markers "{{{ }}}"
" When a file uses markers (like this .vimrc), append this line at
" the end of the file:
" "vim:set fdm=marker:"
" }}}
" set foldmethod=indent{{{
" Fold at indents}}}
" set foldmethod=syntax{{{
" Fold at syntax highlights.
" This does not work for Markdown files.
" For markdown folding, use the `vim-markdown-folding` plugin.
" }}}
" set foldmethod=expr{{{
" This is used by the `vim-markdown-folding` plugin.
" The plugin sets foldmethod for `markdown` files to `expr`.
" Install in " .vim/pack/foo/start/vim-markdown-folding/ftplugin/markdown/folding.vim{{{
" Note this is a `filetype` plugin, so the `.vim` file goes in a
" folder name `ftplugin/markdown`, not `plugin`.
" Adding a `markdown` folder is how the plugin tells Vim it is for
" the `markdown` filetype.
" See :h add-filetype-plugin.
" The plugin is *not installed correctly* if running
" "set: foldmethod?" on a markdown file returns anything other
" than "expr".
"}}} }}}
"}}}
" Color{{{
colorscheme badwolf " dark colorful
" colorscheme goodwolf " dark greyscale
" Get new colorschemes{{{
" Default Vim colorscheme makes line numbers and white space too
" noisy. I like badwolf for almost everything.
" git clone colorschemes in .vim/colors/}}}
"}}}
" Search{{{
" Ignore case in search expression unless expression has caps{{{
set ignorecase smartcase"}}}
" Highlight search expression matches as you type{{{
set incsearch"}}}
"}}}
" Typing{{{
" use indent of current line when starting next line{{{
set autoindent"}}}
" turn tabs into four spaces{{{
set expandtab tabstop=4 shiftwidth=4 softtabstop=4"}}}
" show matching opening braces when you type the closing braces{{{
set showmatch"}}}
"}}}
" Shortcuts without a leader{{{
" Map Caps Lock key to Esc in iVim app settings{{{
" scroll down to `HARDWARE KEYBOARD`
" change `Map [caps lock]` from `none` to `esc`
"}}}
" Use jk instead of Esc{{{
inoremap jk <Esc>
cnoremap jk <C-c>
"}}}
" Map v to visual block{{{
nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v
"}}}
" Slide lines of text up/down{{{
" single lines
nnoremap - zvddp
nnoremap _ zvddkP
" multiple lines (use V for visual lines, not v for visual block)
vnoremap - zvdpzvV']
vnoremap _ zvdkPzvV']
"}}}
" Change Y to yank from cursor to end of line, like how D works.{{{
nnoremap Y y$
"}}}
" Quickfix navigation{{{
" Navigate a quickfix list such as :helpgrep regex.
nnoremap <M-/> :cnext<CR>
nnoremap <M-?> :cprev<CR>
nnoremap <M-w> :cwindow<CR>
"}}}
" Redo{{{
" Use Alt-r instead of Ctrl-r for redo
nnoremap <M-r> :redo<CR>
"}}}
"}}}
" Shortcuts with ; as leader{{{
let mapleader = ';' "{{{
nnoremap <leader>, ;
"}}}
" Create headings{{{
nnoremap <silent> <leader>-s I---<Esc>A---<Esc>bb
nnoremap <silent> <leader>=s I====[<Space><Esc>A<Space>]====<Esc>F[w
"}}}
" Edit and save .vimrc{{{
" Source .vimrc
nnoremap <leader>sv :source $HOME/.vimrc<CR>
" Edit .vimrc
nnoremap <leader>ev<Space> :edit $HOME/.vimrc<CR>zv
nnoremap <leader>evt :tabedit $HOME/.vimrc<CR>zv
nnoremap <leader>evs :split $HOME/.vimrc<CR>zv
nnoremap <leader>evv :vertical split $HOME/.vimrc<CR>zv
"}}}
" Open iPad files and folders in iVim{{{
nnoremap <leader>i<Space> :idoc<CR>
nnoremap <leader>id :idoc dir<CR>
"}}}
" View packages / plugins (open read-only){{{
nnoremap <leader>vp :view ~/.vim/pack/mike/start/
" Tab-complete to select package/plugin to view.
"}}}
" Windows{{{
" Use ;w instead of <C-w> (;wt ;wb ;wp ;wL ;ws ;wv etc.){{{
nnoremap <leader>w <C-w>
"}}}
" Grow/shrink window by holding down Ctrl and an arrow key.{{{
nnoremap <C-Right> :wincmd><CR>
nnoremap <C-Left> :wincmd<<CR>
nnoremap <C-Up> :wincmd+<CR>
nnoremap <C-Down> :wincmd-<CR>"}}}
" Alternate ways to set window size:{{{
" zN to set height to N lines
" ;w| maximizes width
" N;w| width is N columns
" ;w_ maximizes height
" N;w_ height is N columns
" ;w= equal width and height for all windows
" see :h wincmd for more window control and movement commands
"}}}
"}}}
" Turn on relative line numbers{{{
nnoremap <leader>ln :set number relativenumber<CR>
"}}}
" Diff{{{
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff<CR>
"}}}
" Path to clipboard
nnoremap <leader>% :let @" = expand("%")<CR>
"}}}

" vim:set fdm=marker:
