"Stop running in vi-compatible mode.
set nocompatible

" Just in case default configuration says something else
colorscheme default
set t_Co=8

"Use light font colors
set background=dark

"Do not run in paste mode. It is for PASTING only
set nopaste

"Set indentation rules
set expandtab
set shiftwidth=4
set ts=4

"More cmdline history
set history=2000

"Show the current mode on the last line
set showmode

""Write changes in the buffer to the hard drive when 25 new chars are typed.
set updatecount=0

"Hide the mouse when writing
set mousehide

"Use the mouse everywhere
set mouse=a

"Highlight all matches to the current search
set hlsearch

"Search as the search expression is being typed
set incsearch

"Use smart case search
set ignorecase
set smartcase

"Enable syntax highlighting
syntax on

"Display current line and char numbers
set ruler

"Display line numbers
set number

"Only for GUI version
if has('gui_running')
	"Set default color scheme
	colorscheme torte
	"Do not display the menu in GUI
	set guioptions-=m
	set guioptions-=T

	"Paste with Shift+Insert and Ctrl+V
	nnoremap <S-Insert> <MiddleMouse>
	inoremap <S-Insert> <MiddleMouse>
	inoremap <C-v> "+p
	inoremap <C-v> <C-O>"+p

	"Auto complete with Ctrl+Space
	"imap <c-space> <c-x><c-o><c-p>
endif

"Highlight cursor line
" set cursorline
" hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE guibg=#2d2d2d guifg=NONE

"Start spell checking
set spell spelllang=en_us
"Fix spell check error highlight
hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=red
hi SpellBad ctermbg=red

"Be quiet :)
set noerrorbells

"Complete partial commands
set wildmenu
set wildmode=list:longest

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'fisadev/vim-isort'
Plugin 'psf/black'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'
call vundle#end()

"Local vimrc files
call lh#local_vimrc#munge('whitelist', $HOME.'/code')

"Start filetype plugin
filetype plugin indent on

"Set the window status line and make it always visible.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}

"Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Isort recommended settings
let g:vim_isort_python_version = 'python3'
autocmd BufWritePre *.py execute ':Isort'

"Black
let g:black_virtualenv='/usr/local/'
autocmd BufWritePre *.py execute ':Black'

"Highlight the column after max line length
highlight ColorColumn ctermbg=grey guibg=grey

"indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '.'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '˰'

"Set maximum number of open tabs
set tabpagemax=20
