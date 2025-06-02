#!/bin/bash

set -e

# 安裝 git 和 curl
echo ">> Installing git and curl..."
sudo apt-get update
sudo apt-get install -y git curl

# 安裝 Vundle
echo ">> Installing Vundle..."
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
  echo "Vundle already exists."
fi

# 安裝 Pydiction
echo ">> Installing Pydiction plugin via Vundle..."
if ! grep -q "Plugin 'vim-scripts/Pydiction'" ~/.vimrc; then
  echo "Adding Pydiction to .vimrc..."
  echo "set nocompatible" >> ~/.vimrc
  echo "filetype off" >> ~/.vimrc
  echo "set rtp+=~/.vim/bundle/vundle" >> ~/.vimrc
  echo "call vundle#begin()" >> ~/.vimrc
  echo "Plugin 'gmarik/vundle'" >> ~/.vimrc
  echo "Plugin 'vim-scripts/Pydiction'" >> ~/.vimrc
  echo "call vundle#end()" >> ~/.vimrc
  echo "filetype plugin indent on" >> ~/.vimrc
  echo "let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'" >> ~/.vimrc
fi

# 自動下載 eton-vimv 的 .vimrc 並套用（可選）
read -p ">> 是否下載 eton-vimv 作為你的 vimrc 設定？(y/n): " yn
if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
  echo ">> Cloning eton-vimv vimrc..."
  git clone https://github.com/etonson/eton-vimv.git /tmp/eton-vimv
  cp /tmp/eton-vimv/.vimrc ~/.vimrc
fi

# 執行 Vundle 安裝插件
echo ">> Installing plugins via Vundle..."
vim +PluginInstall +qall

# 建立 Pydiction 設定：更改自動補全鍵為 Ctrl-y
echo ">> Creating python_pydiction.vim config..."
mkdir -p ~/.vim/bundle/Pydiction/after/ftplugin
cat <<EOF > ~/.vim/bundle/Pydiction/after/ftplugin/python_pydiction.vim
" Pydiction key mapping change
inoremap <C-y> <C-n>
EOF

echo "✅ Setup complete! Open a Python file in Vim and try Ctrl-y for completion."

