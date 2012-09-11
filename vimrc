" TESTING SYMLINKS BETWEEN VIMRC ON IMAC
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" ADDED BY ME START

" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

command! Status echo "All systems are go!"

set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
set background=dark     " dark background
highlight clear

" http://vim.1045645.n5.nabble.com/vimdiff-colors-td1173870.html
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=yellow ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=magenta ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

if &diff
  "set t_Co=256
  set background=dark
  "colorscheme peaksea
else
  colorscheme elflord
endif

set softtabstop=2
set shiftwidth=2
set tabstop=2
" Use spaces instead of tabs
set expandtab
"colorscheme elflord
set guifont=monospace\ 13
set number
set ignorecase
set vb                   " turns off visual bell

let g:sql_type_default = 'mysql'

syntax enable

let g:vimrplugin_underscore = 0

map <S-Enter> 0<Esc>j
map <CR> o<Esc>

nnoremap <C-L> :set invpaste paste?<CR>
set pastetoggle=<C-L>
set showmode

let mapleader = "\\"
let vimrplugin_screenvsplit = 1
let g:ScreenImpl = 'Tmux'
"let vimrplugin_screenplugin = 0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showcmd              " display incomplete commands
set incsearch            " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
syntax on
endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
if has("autocmd")
  filetype plugin indent on
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\endif |
\endif

" ADDED BY ME END

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" disable xml autocomplete
let loaded_xmledit = 1
let xml_no_auto_nesting = 1

"Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
