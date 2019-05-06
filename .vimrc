-
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
"
"    <F3>          --- to open NERDTree
"
"    <F5>          --- to open terminal (then exit inside it to close)
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
"    <C-i>         --- go to previous navigation position
"
"    <C-o>         --- go to next navigation position
"
"    <C-]>         --- go to definition if tags plugin is enabled
"
"    <C-t>         --- revert go to defintion if tags plugin is enabled
"    
"    go            --- go to definition with rtags plugin
"
"    C-q           --- search for file (manual function)
"
"    C-u           --- search for file with Command-T plugin
"
"    fu            --- find usages with  rtags plugin
"
"    <C-y>         --- open list of recent files
"
" in visual mode:
"    //            --- yank selected text and search for its next occurence
"    
"    R             --- select text under cursor and create a command which
"                     replaces it everywhere in the text: :%s/<word>/<word>/g
" in terminal mode:
"    F5            --- exit
"    F4            --- start searching
"    i             --- return to usual mode

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
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
" Plugin 'lyuts/vim-rtags'
Plugin 'yegappan/mru'

call vundle#end()            " required
filetype plugin indent on    " required

" Colors
" colorscheme colorsbox-greenish
" :highlight Normal ctermbg=darkgrey
:set hlsearch
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:loaded_youcompleteme = 1 " delete later

" cscope
:cs add cscope.out
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>

" tricks
:nnoremap v$ v$h
:nnoremap QQ :wqa<ENTER>
:nnoremap qq :q!<ENTER>
:nnoremap qa :qa!<ENTER>
:nnoremap E :vs<ENTER><C-w>w:e<SPACE>
:nnoremap ,, <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
:nnoremap m o<ESC>
:nnoremap <Space> i <ESC>l

" open terminal
set splitbelow
:map <F5> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>clear<CR>
:tnoremap <F4> <C-w>N
:tnoremap <F5> exit<ENTER>

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
:nnoremap <C-u> :CommandT .<ENTER>
:nnoremap <C-y> :MRU<ENTER>
let CommandTMaxFiles=200000

" replace
:nnoremap R yiw:%s/<C-r>"/<C-r>"/g<left><left>
:vnoremap R  y:%s/<C-r>"/<C-r>"/g<left><left>

" indent
filetype plugin indent on

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" Shell scripts
:silent exec "!bash ~/.vim/map_capslock.sh off"

" Print file path in the bottom of screen
" set statusline+=%F
set laststatus=2

" NERDTree
map <F3> :NERDTree<ENTER><C-w>l:NERDTreeFind<ENTER><C-w>h
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=120

" Go to definition if rtags plugin is enabled
map go <Leader>rj

" Find usages with rtags plugin
map fu <Leader>rf

" Switch between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
:tnoremap <C-h> <C-w>h
:tnoremap <C-j> <C-w>j
:tnoremap <C-k> <C-w>k
:tnoremap <C-l> <C-w>l

" Resize split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
nmap <C-Right> <C-W>><C-W>>
nmap <C-Left> <C-W><<C-W><

" Comment code
:nnoremap cp :s/^/# /g<ENTER>:s/akjsfka;dfkadfja//g<ENTER>
:vnoremap cp :s/^/# /g<ENTER>:s/akjsfka;dfkadfja//g<ENTER>
:nnoremap <C-?> :s/^/\/\/ /g<ENTER>:s/akjsfka;dfkadfja//g<ENTER>
:vnoremap <C-?> :s/^/\/\/ /g<ENTER>:s/akjsfka;dfkadfja//g<ENTER>

" Find file in current directory and edit it.
map <C-q> :Find **<left>

" User defined functions

function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
" replace above line with below one for gvim on windows
" let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")
