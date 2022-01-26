highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10ss
set spell spelllang=en

" Start in insert mode to avoid pressing 'i' before enterring commit message.
if !&diff
	autocmd VimEnter * startinsert
endif

" WORKARROUND
" Following variable (t_ti) contains escape sequence for engaging alternate buffer
" Windows terminal does not support restore properly. 
" By resetting it we make sure to get proper git message without getting it messed up.
" For details check 'man xterm' specially section 'titeInhibit'
" For further information search for 'Xterm Control Sequences'
autocmd VimLeave * set t_ti=

" Following works best on Windows terminal.
set term=xterm-256color


if &diff
	map <C-Down> ]c
	map <C-Up> [c
	map <C-Right> <ESC>:diffget LOCAL<CR>:diffupdate<CR>
	map <C-Left> <ESC>:diffget REMOTE<CR>:diffupdate<CR>
	map <C-End> <ESC>:diffoff<CR>
	map <C-Home> <ESC>:diffthis<CR>
endif