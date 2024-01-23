# 國立中正大學碩博士論文LaTeX模板 | CCU Thesis LaTeX Template
本模板適用於國立中正大學碩博士論文的撰寫，並設置好論文基本架構和基礎語法示例供使用者參考，使用者只需根據自己的需求進行增減即可，已預先設置 Times New Roman 與標楷體兩種通用字型。

This template is designed for writing master's and doctoral theses at National Chung Cheng University, providing a predefined structure and basic syntax examples for users to refer to. Users only need to make adjustments according to their own needs. The template has been pre-set with Times New Roman and DFKai-SB as two commonly used fonts.

## 目錄 | Table of Contents
- [入門 | Getting Started](#入門--getting-started)
- [模板範例演示 | Template Demonstration](#模板範例演示--template-demonstration)
- [模板檔案結構 | Template Structure](#模板檔案結構--template-structure)
- [LaTeX環境建置 | LaTeX Environment Setup](#latex環境建置--latex-environment-setup)
- [模板使用說明 | User Guide](#模板使用說明--user-guide)
- [致謝 | Acknowledgement](#致謝--acknowledgement)
- [合作者 | Collaborators](#合作者--collaborators)
- [免責聲明 | Disclaimer](#免責聲明--disclaimer)
- [License](#license)

## 入門 | Getting Started
您有以下幾種方式可以取得本模板，請依照自己的喜好選擇 :
1. 下載本模板的 zip 檔案
2. 使用 git clone 指令 : `git clone https://github.com/anlit75/CCU-Thesis-LaTeX-Template.git`
3. 使用 fork 功能將本模板複製到自己的 github
4. 下載 release 版本 : https://github.com/anlit75/CCU-Thesis-LaTeX-Template/releases
5. 點擊**此頁面右上方綠色**的 `Use this template` 按鈕，創建一個新的 repository ( 推薦使用此方式 )

You have several options to obtain this template. Please choose according to your preference:
1. Download the zip file of this template.
2. Use the git clone command: `git clone https://github.com/anlit75/CCU-Thesis-LaTeX-Template.git`
3. Use the fork feature to copy this template to your own GitHub repository.
4. Download the release version: https://github.com/anlit75/CCU-Thesis-LaTeX-Template/releases
5. Click the **Use this template** button at the top right of this page to create a new repository (recommended method).

如果您之前未使用過 Git / GitHub，以下是一些入門指南：

If you had not use Git or GitHub before, here are some quick tutorials
- Basics of git : [Learn the Basics of Git in Under 10 Minutes](https://www.freecodecamp.org/news/learn-the-basics-of-git-in-under-10-minutes-da548267cc91/)
- GitHub Fork : [Fork a repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo)

## 模板範例演示 | Template Demonstration
以下為模板的範例檔案，僅供參考 Below are prefilled thesis using the template for your reference : 
- [demo/master_chinese_template.pdf](./demo/master_chinese_template.pdf) 為**碩士繁體中文**論文範例檔案
- [demo/doctor_chinese_template.pdf](./demo/doctor_chinese_template.pdf) 為**博士繁體中文**論文範例檔案

## 模板檔案結構 | Template Structure

```
Template Structure
├── main.tex                            // 主文件
├── main.pdf                            // 主文件編譯後的PDF檔
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
├── fonts
│   ├── chinese
│   │   ├── BiauKai.ttf                 // 標楷體
│   │   └── ...
│   └── english
│       ├── Times New Roman-*.ttf       // Times New Roman
│       └── ...
├── demo
│   ├── master_chinese_template.pdf     // 碩士繁體中文論文範例檔案
│   ├── doctor_chinese_template.pdf     // 博士繁體中文論文範例檔案
│   └── ...
├── ccusetup.tex                        // 模板設定
└── ccuthesis.cls                       // 模板文件
```

請依據內容撰寫在相對應的tex 檔案。如需增減章節，可在sections資料夾中增加/移除`.tex`檔進行調整，並在主文件`main.tex`中根據增減的位置用`\input{./path/to/texfile}`語法新增章節，或刪除相關章節即可。

Please write in the corresponding .tex file based on the content. If you wish to add or remove sections, you can adjust by adding/removing `.tex` files in the "sections" folder. Then, in the `main.tex`, use the `\input{./path/to/texfile}` syntax to add new section or delete relevant section accordingly.

## LaTeX環境建置 | LaTeX Environment Setup
- Requirements: `MiKTex`, `perl`, `vscode(option)`
1. 安裝`MiKTex`，並設置為預設的compiler ( https://miktex.org/download )
   Install `MiKTeX` and set it as the default compiler (https://miktex.org/download).
2. 安裝`perl` ( https://strawberryperl.com/ )
   Install `perl` (https://strawberryperl.com/).
3. 安裝`vscode`，並安裝 `LaTeX Workshop`、`LaTeX Utilities` 擴充程式
   Install `VSCode` and add the extensions `LaTeX Workshop` and `LaTeX Utilities`.

### LaTeX Workshop Settings
在`settings.json`中，recipe可以調換順序，最上面的是預設執行的compiler，須將`"latexmk (xelatex)"`組別移動到最上方，如下所示 :

In the `settings.json` file, you can rearrange the order of the recipes, and the one at the top will be the default compiler. Move the group `latexmk (xelatex)` to the top, as shown below:

```json
"latex-workshop.latex.recipes": [
    {
        "name": "latexmk (xelatex)",
        "tools": [
            "xelatexmk"
        ]
    },
    {
        "name": "latexmk",
        "tools": [
            "latexmk"
        ]
    },
    {
        "name": "latexmk (latexmkrc)",
        "tools": [
            "latexmk_rconly"
        ]
    },
    {
        "name": "latexmk (lualatex)",
        "tools": [
            "lualatexmk"
        ]
    },
    ...
],

// 可選參數
"latex-workshop.latex.autoBuild.run": "onSave",         // 當儲存時自動編譯
"latex-workshop.latex.autoClean.run": "onSucceeded",    // 當編譯成功時自動清理
```

### LaTeX Workshop SyncTex
在 Shorcut Settings 中可以設置 `SyncTex` 的快捷鍵 (如下圖所示)，預設為 `ctrl+alt+j`，可自行調整。

In the Keyboard Shortcuts Settings, you can configure the shortcut for `SyncTex` as shown in the image below. The default is `ctrl+alt+j`, but you can adjust as needed.

![SyncTex](./figures/synctex.png)

- `ctrl+Left-Click`PDF檔案中的文字，會自動跳轉到對應的`.tex`檔案中
Press `ctrl+Left-Click` on the text in the PDF file to automatically jump to the corresponding location in the .tex file.
- 在`.tex`檔案中使用 `ctrl+alt+j` 會自動跳轉到對應的PDF檔案中
In the `.tex` file, use `ctrl+alt+j` to automatically jump to the corresponding location in the PDF file.


實際操作效果如下所示 :

The actual operation results are demonstrated as follows:

![SyncTex](./figures/sync_demo.gif)

### LaTeX Utilities Settings
此擴充程式可以在**貼上**時自動生成模板，適用於表格及圖片，請先在`settings.json`中輸入下方設定 :

This extension can automatically generate formatted tables and figures when pasting into vscode. Please paste the following settings in the settings.json file:

```json
// `ctrl+v`時自動套用模板，若為false則需使用`ctrl+shift+v`
"latex-utilities.formattedPaste.useAsDefault": true,

// 圖片模板 figure template
"latex-utilities.formattedPaste.image.template": [
    "\\begin{figure}[!htb]",
    "\t\\centering",
    "\t\\includegraphics[width=\\textwidth]{${imageFilePath}}",
    "\t\\caption{${imageFileNameWithoutExt}}",
    "\t\\label{fig:${imageFileNameWithoutExt}}",
    "\\end{figure}",
    ""
],
```

實際操作效果如下所示 :

The actual operation results are demonstrated as follows:

![formattedPaste](./figures/paste_demo.gif)

更詳細的設定請參考 For further settings please refer to [LaTeX Utilities Wiki](https://github.com/tecosaur/LaTeX-Utilities/wiki)

## 模板使用說明 | User Guide
詳細模板使用說明請見 [Wiki Page](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki)，請依造下列順序進行閱讀，並根據指示修改設定 :

For detailed instructions on using the template, please refer to the [Wiki Page](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki). Please read in the following order and make configuration adjustments accordingly:
1. [模板資料設定 ( Information Configs Manual )](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/Information-Configs-Manual)
2. [模板使用說明 ( User Guide )](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/User-Guide)
3. [LaTeX基本語法 ( LaTeX Basic Syntax )](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/LaTeX-Basic-Syntax)

## 致謝 | Acknowledgement
感謝以下模板作者的貢獻，提供了許多參考，使得本模板能夠順利完成 : 

Huge thanks to the following template authors for their contributions. Their work has provided valuable references and has contributed to the successful completion of this template:
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)

## 合作者 | Collaborators
特別感謝 [joeyuping](https://github.com/joeyuping) 學長的貢獻，使得本模板能夠更加完善 !

Special thanks to [joeyuping](https://github.com/joeyuping) for his contributions, which have greatly enhanced the completeness of this template!

## 免責聲明 | Disclaimer
本模板為非官方版本，因此格式可能有誤，僅供參考，若使用上有任何問題，請自行承擔風險。

This template is an unofficial version, and the format may contain errors. It is provided for reference only, and users should use it at their own risk.

建議使用者根據系上的要求進行調整，若有任何問題，請提issue或是寄信至[作者信箱](mailto:anson40512@gmail.com)。

It is recommended that users make adjustments according to the requirements of their department. If there are any issues, please feel free to send an email to the [author's email](mailto:anson40512@gmail.com).

## License
MIT License

CopyRight (c) 2024 Ting-An Cheng

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  
SOFTWARE.
