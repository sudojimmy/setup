syntax on

"set expandtab "expand tabs
set tabstop=4 "
set softtabstop=4
set shiftwidth=4

colorscheme zellner 
set hlsearch " turn on search pattern highlighting
set ignorecase " ignore case when searching...
set smartcase "... unless pattern has uppercase character
set incsearch " enable incremental matches
"set list " display tabs and line endings
set lcs=trail:-,tab:-- " change the way tabs and line ends are displayed
set number      "show line numbers
set backspace=2 "allow backspace to delete characters

"wrapping settings
"set wrap
"set linebreak
"set nolist
set textwidth=132
"set fo+=t

filetype plugin on

"set tags=/Users/kthirukonda/Work/repos/pim/services/pimcore/tags
"set tags=./tags;

"simulate pressing ,ms on vim startup. This is my shortut for highlighting
"marks
call feedkeys(",ms")

if &diff
	colorscheme pablo 
endif

au BufRead,BufNewFile *.logcat set filetype=logcat

set autochdir

"Settings for TagList plugin
"let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 1 
let Tlist_WinWidth = 50  
let Tlist_Exit_OnlyWindow = 1 

"show full path name of the file in the status bar
set statusline+=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"++++++++++++ MACROS +++++++++++++++++++++++++++++++++++++++++++++++
"Remove whitespaces at the end of the line
let @a=':%s/\s\+$//'
let @t=':%s/\t/    /g'

filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" my own setting
set wildmenu
set cursorline

nnoremap ; :
nnoremap Q :q!
