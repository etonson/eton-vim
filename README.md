# Vim + Pydiction 自動安裝腳本

此專案提供一鍵安裝 Vim Pydiction 補全環境的腳本，適用於 Ubuntu/Debian 系統。

## 📦 內容

- 安裝必要工具 `git` 與 `curl`
- 安裝 Vundle 外掛管理器
- 設定 `.vimrc` 啟用 Pydiction
- 修改 Pydiction 自動補全按鍵（Ctrl-n → Ctrl-y）

## 🚀 安裝方式

```bash
chmod +x install.sh
./install.sh
```

## 🧪 測試方式

```bash
vim test.py
```

輸入部分關鍵字並按下 `Ctrl-y` 應可出現補全選單。

## 🔁 可重複執行

腳本支援重複執行，但會在 `.vimrc` 中追加設定。建議首次執行前備份原始設定。

## 📁 結構

- `install.sh` - 安裝腳本
- `README.md` - 使用說明
