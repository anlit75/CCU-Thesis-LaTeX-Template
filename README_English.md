# CCU Thesis LaTeX Template
This template is designed for writing master's and doctoral theses at National Chung Cheng University, providing a predefined structure and basic syntax examples for users to refer to. 
Users only need to make adjustments according to their own needs.  
The template has been pre-set with Times New Roman and DFKai-SB as two commonly used fonts.

## Table of Contents
- [Getting Started](#getting-started)
- [Template Demonstration](#template-demonstration)
- [Template Structure](#template-structure)
- [LaTeX Environment Setup](#latex-environment-setup)
- [User Guide](#user-guide)
- [Acknowledgement](#acknowledgement)
- [Collaborators](#collaborators)
- [Disclaimer](#disclaimer)
- [License](#license)

## Getting Started
You have several options to obtain this template. Please choose according to your preference :
1. Download the zip file of this template.
2. Use the git clone command : `git clone https://github.com/anlit75/CCU-Thesis-LaTeX-Template.git`
3. Use the fork feature to copy this template to your own GitHub repository.
4. Download the latest release version : https://github.com/anlit75/CCU-Thesis-LaTeX-Template/releases
5. Click the **Use this template** button at the top right of this page to create a new repository ( recommended method ).

If you had not use Git or GitHub before, here are some quick tutorials :
- Basics of git : [Learn the Basics of Git in Under 10 Minutes](https://www.freecodecamp.org/news/learn-the-basics-of-git-in-under-10-minutes-da548267cc91/)
- GitHub Fork : [Fork a repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo)

## Template Demonstration
Below are prefilled thesis using the template for your reference : 
- [demo/master_chinese_template.pdf](./demo/master_chinese_template.pdf) is a demo file of **Master Traditional Chinese** thesis
- [demo/doctor_chinese_template.pdf](./demo/doctor_chinese_template.pdf) is a demo file of **Ph.D. Traditional Chinese** dissertations

## Template Structure

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

Please write in the corresponding .tex file based on the content. If you wish to add or remove sections, you can adjust by adding/removing `.tex` files in the "sections" folder.  
Then, in the `main.tex`, use the `\input{./path/to/texfile}` syntax to add new section or delete relevant section accordingly.

## LaTeX Environment Setup
- Requirements: `MiKTex`, `perl`, `VSCode (option)`
1. Install `MiKTeX` and set it as the default compiler ( https://miktex.org/download ).
2. Install `perl` ( https://strawberryperl.com/ ).
3. Install `VSCode` and add the extensions `LaTeX Workshop` and `LaTeX Utilities`.

### LaTeX Workshop Settings
In the `settings.json` file, you can rearrange the order of the recipes, and the one at the top will be the default compiler.  
Move the group `latexmk (xelatex)` to the top, as shown below:

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

// Optional parameters
"latex-workshop.latex.autoBuild.run": "onSave",         // automatically compile when saving
"latex-workshop.latex.autoClean.run": "onSucceeded",    // automatically clean up when compilation is successful
```

> After the installation is complete, VSCode must be restarted!

### LaTeX Workshop SyncTex
In the Keyboard Shortcuts Settings, you can configure the shortcut for `SyncTex` as shown in the image below.  
The default is `ctrl+alt+j`, but you can adjust as needed.

![SyncTex](./figures/synctex.png)

- Press `ctrl+Left-Click` on the text in the PDF file to automatically jump to the corresponding location in the .tex file.
- In the `.tex` file, use `ctrl+alt+j` to automatically jump to the corresponding location in the PDF file.

The actual operation results are demonstrated as follows :

![SyncTex](./figures/sync_demo.gif)

### LaTeX Utilities Settings
This extension can automatically generate formatted tables and figures when **pasting** into vscode.  
Please paste the following settings in the `settings.json` file :

```json
// The template is automatically applied when `ctrl+v` is used. If it is false, you need to use `ctrl+shift+v`
"latex-utilities.formattedPaste.useAsDefault": false,

// figure template
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

The actual operation results are demonstrated as follows :

![formattedPaste](./figures/paste_demo.gif)

For further settings please refer to [LaTeX Utilities Wiki](https://github.com/tecosaur/LaTeX-Utilities/wiki).

## User Guide
For detailed instructions on using the template, please refer to the [Wiki Page](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki).  
Please read in the following order and make configuration adjustments accordingly :
1. [Editing Thesis Configurations](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/Thesis-Configurations-English)
2. [User Guide](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/User-Guide-English)
3. [LaTeX Basic Syntax](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/LaTeX-Basic-Syntax-English)

## Acknowledgement
Huge thanks to the following template authors for their contributions.  
Their work has provided valuable references and has contributed to the successful completion of this template :
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)

## Collaborators
Special thanks to [joeyuping](https://github.com/joeyuping) for his contributions, which have greatly enhanced the completeness of this template!

## Disclaimer
This template is an unofficial version, and the format may contain errors. It is provided for reference only, and users should use it at their own risk.

It is recommended that users make adjustments according to the requirements of their department. 
If there are any problem, please feel free to create the issues or send an email to the [author's email](mailto:anson40512@gmail.com).

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
