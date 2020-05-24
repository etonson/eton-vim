"=================================================================
"Vundle initialization 
"Avoid modify this section, unless you are very sure of what you are doing

"no vi-compatible
set nocompatible              " be iMproved, required

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)""
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif""

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
"==================================================================
"Active plugins
"You can disable or add new ones here:

"THE-NERD-tree
Plugin 'vim-scripts/The-NERD-tree'

"AutoComplPop
Plugin 'vim-scripts/AutoComplPop'

"AutoPairs
Plugin 'jiangmiao/auto-pairs'

"syntastic
Plugin 'scrooloose/syntastic'

"java complete
Plugin 'vim-scripts/javacomplete'

"pythondiction
Plugin 'etonson/Pydiction'

"python-mood
Plugin 'klen/python-mode'

"vim-arduino
Plugin 'jplaut/vim-arduino-ino'

"vim-arduino-syntax
Plugin 'sudar/vim-arduino-syntax'

"vim-emmt
Plugin 'mattn/emmet-vim'

filetype plugin indent on  



"==================================================================="
" 檔案編碼
" set encoding=utf-8
" set fileencodings=utf-8,cp950
"  
"  " 編輯喜好設定                                                                                                                                                                                                    
syntax on        " 語法上色顯示
set ai           " 自動縮排
set shiftwidth=2 " 設定縮排寬度 = 4
set tabstop=4    " tab 的字元數
set softtabstop=4
set expandtab   " 用 space 代替 tab
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set nu           " 顯示行數
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
set guifont=Monaco:h20 "設定字體
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\[%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

colorscheme torte "配色
set t_Co=256

"=================folding===================
set foldenable 
set foldmethod=marker
set foldcolumn=0 
nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')

"=====tab length exceptions on some file types========
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

"==================Compile==========================="
autocmd BufRead *.py nmap <F5> :w !python3 %<CR>
autocmd BufRead *.sh nmap <F5> :w !sh %<CR>
autocmd FileType java map <F5> :!java "%:p" && java -cp "%:p:h" "%:t:r"<CR>
autocmd FileType c map <F5> :!gcc --o "%:p:r.out" "%:p" && "%:p:r.out"<CR> 
autocmd FileType php noremap <F5> :w!<CR>:!/usr/bin/php %<CR>

"===================方向鍵配置======================="
nnoremap <up> <C-U>zz
nnoremap <down> <C-D>zz
nnoremap <left> :N<CR><Esc>zz
nnoremap <right> :n<CR><Esc>zz
"==================Plugin seting====================="

"about NERDTreeToggle seting-------------
map <F6> <ESC>:NERDTreeToggle<CR> " Toggles NERD Tree view (file viewer)

"about AutoComplPop seting--------------
imap <C-J> <C-X><C-O>

"Syntastic 檢查語法錯誤--------------
let g:syntastic_check_on_open = 1

"javacomplete setting---------------
setlocal omnifunc=javacomplete#Complete
autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>

"pydiction setting-----------------
filetype plugin on
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20 "defalut g:pydiction_menu_height == 15

"python-mode----------------------------
" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>

"vim-arduino----------------------------
"The default key mapping can be turned off
let g:vim_arduino_map_keys = 0
"To open the serial monitor automatically after each deploy
let g:vim_arduino_auto_open_serial = 1

"vim-emmt
let g:user_emmet_expandabbr_key = '<c-e>'
