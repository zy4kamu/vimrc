" user defined commands:
"
" in visual and normal mode:
"    J             --- move down for 25 lines
"
"    K             --- move up for 25 lines
"
"    B             --- move 4 words backward
"
"    W             --- move 4 words forward
"
"    L             --- go to the bottom of the screen
" in normal mode:
"    //            --- select word under cursor and search for its next occurence
"
"    #             --- select word under cursor and search for its previous occurence
"
"    R             --- select word under cursor and create a command which
"                      replaces it everywhere in the text: :%s/<word>/<word>/g
"
"    QQ            --- save file and exit from vim
"
"    qq            --- exit from vim without saving file
"
"    <C-w>w        --- select next screen
"
"    <C-w>q        --- close current screen
"
"    L             --- go to the bottom of the screen
"
"    V             --- switch to visual mode and select the whole line
"
"    :vs           --- open new vertical tab
"
"    ,,            --- move the whole line to the left border
"
"    m             --- insert next empty line (with O) and return back to normal mode
"
"   :vs            --- open the same file in the second tab
"
" in visual mode:
"    //            --- yank selected text and search for its next occurence
"    
"    R             --- select text under cursor and create a command which
"                     replaces it everywhere in the text: :%s/<word>/<word>/g

:set number
:set relativenumber

" Vundle plugins
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

" Colors
colorscheme nord

" cscope
:cs add cscope.out
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>

" tricks
:nnoremap v$ v$h
:nnoremap QQ :wqa<ENTER>
:nnoremap qq :q!<ENTER>
:nnoremap E :vs<ENTER><C-w>w:e<SPACE>
:nnoremap ,, <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
:nnoremap m o<ESC>
:nnoremap <Space> i <ESC>l
:nnoremap <TAB> i<TAB><ESC>

" jump
:nnoremap J 25j
:nnoremap K 25k
:vnoremap J 25j
:vnoremap K 25k
:nnoremap B 4b
:vnoremap B 4b
:nnoremap W 4e
:vnoremap W 4e

" search
:nnoremap // viwy/<C-r>"<ENTER>
:vnoremap // y/<C-r>"<ENTER>


" replace
:nnoremap R yiw:%s/<C-r>"/<C-r>"/g<left><left>
:vnoremap R  y:%s/<C-r>"/<C-r>"/g<left><left>

" indent
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Shell scripts
:silent exec "!bash ~/.vim/map_capslock.sh off"

" Print file path in the bottom of screen
set statusline+=%F
set laststatus=2

" NERDTree
map <F3> :NERDTree<ENTER>
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=60

" Go to definition
map go <C-]>
map gi <C-t>
