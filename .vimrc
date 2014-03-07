" Bulk of this file provided by Bram Moolenaar <Bram@vim.org>, personalization by yours truly
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Vundle Settings
"

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
"
" Required pairing vim to MacVim
Bundle 'Valloric/YouCompleteMe' 
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'

syntax enable

" jshint
" syntastical plugin

filetype plugin indent on 

map <C-M> :NERDTreeToggle<CR>

let g:syntastic_css_checkers = ['csslint']
"let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_haml_checkers = ['haml']
let g:syntastic_html_checkers = ['html']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_sass_checkers = ['sass']
" let g:syntastic_debug = 1 " logs debugger messages in vim's :mes

let g:gitgutter_enabled = 1
" GitGutter settings
" turn off  :GitGutterDisable
" turn on   :GitGutterEnable
" toggle    :GitGutterToggle.

" turn on highlighting   :GitGutterLineHighlightsEnable
" turn off highlighting  :GitGutterLineHighlightsDisable
" toggle highlighting    :GitGutterLineHighlightsToggle.

" jump to next hunk: :GitGutterNextHunk
" jump to previous hunk: :GitGutterPrevHunk.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" sets a color column at the end of the allotted column width
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set nocompatible

set pastetoggle=<F2>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set incsearch		" do incremental searching
set ignorecase  " ignores all case when searching
set nohlsearch
set number " shows line numbers
set ruler		" show the cursor position all the time
set scrolloff=10 " maintains a minimal buffer of visible spaces around the active line
set shiftwidth=2
set showcmd		" display incomplete commands
set smartcase   " ignores case only when search is all lowercase
set smartindent
set expandtab
set tabstop=2
set wildmode=longest,full

set hlsearch

" Don't use Ex mode, use Q for formatting
map Q gq

map <C-e> :nohlsearch<CR> 
imap <C-p> console.log();<ESC>2ha
imap <C-l> logger.debug <ESC>ha 
nmap <C-p> o<C-p>
nmap <C-l> o<C-l>
nmap W :w<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern. -- Removed 1/24/13
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
