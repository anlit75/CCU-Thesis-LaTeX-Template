# 國立中正大學碩博士論文LaTeX模板

[![License](https://img.shields.io/github/license/anlit75/ccu-thesis-latex-template)](LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/anlit75/ccu-thesis-latex-template)](https://github.com/anlit75/ccu-thesis-latex-template/releases)
[![Build Status](https://github.com/anlit75/ccu-thesis-latex-template/actions/workflows/build.yml/badge.svg)](https://github.com/anlit75/ccu-thesis-latex-template/actions)
<!-- [![Open in Overleaf](https://img.shields.io/badge/Overleaf-Open%20in%20Overleaf-47ba40?style=flat&logo=overleaf)](https://www.overleaf.com/docs?snip_uri=https://github.com/anlit75/ccu-thesis-latex-template/archive/refs/heads/main.zip) -->

整合 Docker 與 GitHub Codespaces 的國立中正大學學位論文 LaTeX 模板，提供開箱即用的「零配置」寫作環境，確保排版合規並自動備份 PDF。

> English version of `README` file please refer to [README_English.md](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/blob/master/README_English.md)

## 目錄 | Table of Contents
- [💻 線上試玩 | Online Demo](#-線上試玩--online-demo)
- [⚡ 獲取本模板 | Get The Template](#-獲取本模板--get-the-template)
- [🚀 快速開始 | Quick Start](#-快速開始--quick-start)
- [🐳 本地環境建置 | Local DevContainer](#-本地環境建置--local-devcontainer)
- [☁️ 自動編譯與備份 | Auto Build & Backup](#️-自動編譯與備份--auto-build--backup)
- [📂 模板檔案結構 | Template Structure](#-模板檔案結構--template-structure)
- [📖 模板使用說明 | User Guide](#-模板使用說明--user-guide)
- [🎨 模板範例演示 | Template Demonstration](#-模板範例演示--template-demonstration)
- [🤝 致謝 | Acknowledgement](#-致謝--acknowledgement)
- [⚠️ 免責聲明 | Disclaimer](#️-免責聲明--disclaimer)
- [📄 License](#-license)

## 💻 線上試玩 | Online Demo
如果你只想看看環境長怎樣，或測試編譯結果，可以點擊下方按鈕快速啟動：\
\
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/anlit75/ccu-thesis-latex-template)

> [!CAUTION]\
> *此模式無法直接儲存進度，請勿用於正式寫作。*

## ⚡ 獲取本模板 | Get The Template

請點擊上方綠色的 **`[Use this template]`** 按鈕，並選擇 **Private** 來建立您的論文儲存庫。

> [!WARNING]\
> 建議不要直接 Fork 本儲存庫！\
> 論文應保持機密，Fork 的儲存庫預設為公開（除非您想貢獻程式碼）。

## 🚀 快速開始 | Quick Start

**適合：** 不想安裝任何軟體、電腦效能有限、或只是想快速預覽的使用者。

這將在您的瀏覽器中啟動一個完整的 GitHub Codespaces 環境，**無需任何設定**。

1. 點擊頁面右上角的綠色 **`Code`** 按鈕 > 切換到 **`Codespaces`** 分頁。
2. 點擊 **`Create codespace on branch-name`**。
3. 等待瀏覽器載入環境（首次約需 10-15 分鐘）。
4. **完成!**

> [!TIP]\
> 打開 `main.tex` 檔案，按下 `Ctrl+S` 即可自動觸發編譯。\
> 或點擊左側 "TeX" 圖示 > `Build LaTeX project`。\
> \
> 編譯完成後，PDF 檔會自動顯示在右側檔案總管視窗中。\
> 在 `*.tex` 檔案中按下 `ctrl+alt+j` 會自動跳轉到 PDF 對應的位置。

> [!NOTE]\
> 接下來請跳過 `🐳 本地環境建置`。根據 [模板使用說明](#-模板使用說明--user-guide) 開始撰寫論文。

> [!WARNING]\
> 免費帳戶每月的 GitHub Codespaces 使用時間配額約為 120 小時。\
> 實際使用限制請參考 [GitHub 官方說明](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces) 了解更多資訊。

## 🐳 本地環境建置 | Local DevContainer

**適合：** 需要**長期離線寫作**、希望在自己電腦上離線工作、習慣本地 VS Code 的使用者。

### Docker 環境設置
1. 安裝 [Docker Desktop](https://www.docker.com/products/docker-desktop)，安裝後須重新啟動電腦。
2. 安裝 VS Code，並安裝 `Remote Explorer`、`Dev Containers`、`Docker (optional)` 擴充程式。

### 啟動步驟
1.  `git clone` 您的論文儲存庫。
2.  使用 VS Code 開啟儲存庫資料夾。
3.  點擊視窗右下角的提示 **"Reopen in Container"** (或按 `F1` 搜尋 `Dev Containers: Reopen in Container`)。
4.  等待容器啟動，環境即自動配置完成（首次約需 10-15 分鐘）。
5. **完成!**

<details>
<summary><strong>如果上述步驟無法使用，請手動建立 Docker Container (點擊展開)</strong></summary>

於論文根目錄下開啟 VS Code，並在終端機中輸入以下指令，即可建立 Docker Container :

```bash
# --name thesis : 指定 container 名稱為 thesis (可自行更改)
docker run -itd --name thesis -v .:/home/thesis anlit/thesistex:latest
```

接著在 `Remote Explorer` 擴充程式中會看到剛建立的 container，如下圖所示，接著在 `thesis` 資料夾處右鍵，選擇 `Open in Container in Current Window` 即可進入 container 環境中。

<div style="text-align: center;">
    <img src="https://github.com/anlit75/CCU-Thesis-LaTeX-Template/blob/assets/figures/RemoteExplorer.png?raw=true" alt="Remote Explorer"> <br>
    Remote Explorer - Dev Container <br><br>
    <img src="https://github.com/anlit75/CCU-Thesis-LaTeX-Template/blob/assets/figures/attach.png?raw=true" alt="Open in Container in Current Window"> <br>
    Open in Container in Current Window <br><br>
</div>

</details>

> [!NOTE]\
> 接下來請根據 [模板使用說明](#-模板使用說明--user-guide) 開始撰寫論文。

## ☁️ 自動編譯與備份 | Auto Build & Backup
當您將進度推送 (Push) 到 GitHub 時，系統會自動在雲端執行編譯，為您的論文提供**額外的 PDF 備份**。

1. 點擊儲存庫上方的 **`Actions`** 分頁。
2. 點擊最新的 Workflow 紀錄 (通常顯示為 Commit 訊息)。
3. 在頁面底部的 **`Artifacts`** 區域，點擊 `PDF` 即可下載。

> [!NOTE]\
> **注意時效**：雲端生成的 PDF 檔案僅會保留 **5 天**。

## 📂 模板檔案結構 | Template Structure
```
Template Structure
├── main.tex                            // 主文件
├── main.pdf                            // [自動生成] 主文件編譯後的PDF檔
├── frontpages
│   ├── abstract.tex                    // 中/英文摘要
│   ├── acknowledgement.tex             // 致謝
│   ├── denotation.tex                  // 符號列表
│   └── verification.pdf                // 論文審定書PDF檔
├── sections
│   ├── introduction.tex                // 緒論
│   ├── related_work.tex                // 文獻探討
│   ├── method.tex                      // 研究方法
│   ├── experiments.tex                 // 研究結果
│   └── conclusion.tex                  // 結論
├── backpages
│   ├── appendix.tex                    // 附錄
│   └── reference.bib                   // 參考文獻資料庫
├── figures
│   ├── watermark.jpg                   // 浮水印
│   └── ...
├── ccusetup.tex                        // 模板設定
└── ccuthesis.cls                       // 模板文件
```

> [!NOTE]\
> 請依據內容撰寫在相對應的 .tex 檔案。\
> 如需增減章節，可在 `sections` 資料夾中增加/移除 `.tex` 檔，並在 `main.tex` 中用 `\input{./path/to/texfile}` 語法進行調整。

## 📖 模板使用說明 | User Guide
詳細模板使用說明請見 [Wiki Page](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki)，請依造下列順序進行閱讀，並根據指示修改設定 :
1. [模板資料設定](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/Thesis-Configurations)
2. [模板使用說明](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/User-Guide)
3. [LaTeX基本語法](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/LaTeX-Basic-Syntax)

## 🎨 模板範例演示 | Template Demonstration
模板的範例 PDF 檔案請至 [Releases](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/releases) 下載參考。

## 🤝 致謝 | Acknowledgement
感謝以下模板作者的貢獻，提供了許多參考，使得本模板能夠順利完成 :
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)

> [!IMPORTANT]\
> 特別感謝 [joeyuping](https://github.com/joeyuping) 學長的貢獻，使得本模板能夠更加完善 !

## ⚠️ 免責聲明 | Disclaimer
本模板為非官方版本，因此格式可能有誤，僅供參考，若使用上有任何問題，請自行承擔風險。

建議使用者根據系上的要求進行調整，若有任何問題，請提 Issues 或是寄信至 [作者信箱](mailto:anson40512@gmail.com)。

## 📄 License
[MIT License](LICENSE)

Copyright (c) 2024 Ting-An Cheng
