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

" 程式碼自動完成，安裝完外掛還需要額外配置才可以使用
Plugin 'ycm-core/YouCompleteMe'

" 用來提供一個導航目錄的側邊欄
Plugin 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plugin 'jistr/vim-nerdtree-tabs'


" 可以在導航目錄中看到 git 版本資訊
" Plug 'Xuyuanp/nerdtree-git-plugin'

"AutoComplPop
Plugin 'vim-scripts/AutoComplPop'

"AutoPairs
Plugin 'jiangmiao/auto-pairs'

" Vim狀態列外掛，包括顯示行號，列號，檔案型別，檔名，以及Git狀態
Plugin 'vim-airline/vim-airline'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速對齊的外掛
Plugin 'junegunn/vim-easy-align'

" 可以在文件中顯示 git 資訊
Plugin 'airblade/vim-gitgutter'

" markdown 外掛
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'


" 下面兩個外掛要配合使用，可以自動生成程式碼塊
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


"syntastic
Plugin 'scrooloose/syntastic'

"java complete
Plugin 'vim-scripts/javacomplete'

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

"vim-arduino----------------------------
"The default key mapping can be turned off
let g:vim_arduino_map_keys = 0
"To open the serial monitor automatically after each deploy
let g:vim_arduino_auto_open_serial = 1

"vim-emmt
let g:user_emmet_expandabbr_key = '<c-e>'

"設定error和warning的提示符，如果沒有設定，ycm會以syntastic的
" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 這兩個為準
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'

"vim-YouCompleteMe----------------------------
"設定跳轉的快捷鍵，可以跳轉到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>

"設定全域性配置檔案的路徑
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"開啟基於tag的補全，可以在這之後新增需要的標籤路徑
let g:ycm_collect_identifiers_from_tags_files = 1
"開啟語義補全
let g:ycm_seed_identifiers_with_syntax = 1
"在接受補全後不分裂出一個視窗顯示接受的項
set completeopt-=preview
"不顯示開啟vim時檢查ycm_extra_conf檔案的資訊
let g:ycm_confirm_extra_conf=0
"每次重新生成匹配項，禁止快取匹配項
let g:ycm_cache_omnifunc=0
"在註釋中也可以補全
let g:ycm_complete_in_comments=1
"輸入第一個字元就開始補全
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_key_invoke_completion = '<C-F>' 
"文件路徑
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"代碼提示框高亮
highlight PMenu ctermbg=red ctermfg=15
highlight PMenuSel ctermbg=14 ctermfg=16
