# 國立中正大學碩博士論文LaTex模板
國立中正大學碩博士論文LaTex模板，已預先設置Times New Roman與標楷體兩種通用字型，並設置好論文基本架構，使用者只需根據自己的需求進行增減即可。

## 目錄
- [模板檔案結構](#模板檔案結構)
- [LaTex環境建置](#latex環境建置)
  - [vscode設置](#vscode設置)
- [LaTex基礎語法](#latex基礎語法)
  - [標題](#標題)
  - [插入圖片](#插入圖片)
  - [插入表格](#插入表格)
  - [插入數學公式](#插入數學公式)
  - [插入演算法](#插入演算法)
  - [論文引用](#論文引用)
- [致謝](#致謝)
- [License](#license)

## 模板檔案結構

```
Template Structure
├── main.tex                        // 主文件
├── frontpages
│   ├── abstract.tex                // 中/英文摘要
│   ├── acknowledgement.tex         // 致謝
│   └── denotation.tex              // 符號列表
├── sections
│   ├── introduction.tex            // 緒論
│   ├── related_work.tex            // 文獻探討
│   ├── method.tex                  // 研究方法
│   ├── experiments.tex             // 研究結果
│   └── conclusion.tex              // 結論
├── backpages
│   ├── appendix.tex                // 附錄
│   ├── bibliography.tex            // 參考文獻
│   └── reference.bib               // 參考文獻文件
├── figures
│   ├── watermark.jpg               // 浮水印
│   └── ...
├── fonts
│   ├── chinese
│   │   ├── BiauKai.ttf             // 標楷體
│   │   └── ...
│   └── english
│       ├── Times New Roman-*.ttf   // Times New Roman
│       └── ...
├── ccusetup.tex                    // 模板設定
└── ccuthesis.cls                   // 模板文件
```

根據內容決定撰寫在哪個檔案，sections中的文件可以自行透過增加/移除`.tex`檔進行調整，只需將新增的檔案在主文件`main.tex`中根據位置用`\input{./path/to/texfile}`新增即可。

## LaTex環境建置
- Requirements: `MiKTex`, `perl`, `vscode` 
1. 安裝`MiKTex`，並設置為預設的compiler ( https://miktex.org/download )
2. 安裝`perl` ( https://strawberryperl.com/ )
2. 安裝`vscode`，並安裝`LaTeX Workshop`擴充程式

### vscode設置
在`settings.json`中，recipe可以調換順序，最上面的是預設執行的compiler，須將`"latexmk (xelatex)"`組別移動到最上方，如下所示 :
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
```

## LaTex基礎語法
### 標題
```latex
% 編號標題
\section{大標題}                 % 大標題
\subsection{小標題}              % 小標題
\subsubsection{小小標題}         % 小小標題

% 無編號標題
\section*{無編號大標題}          % 無編號大標題
\subsection*{無編號小標題}       % 無編號小標題
\subsubsection*{無編號小小標題}  % 無編號小小標題
```

### 插入圖片
```latex
% 圖片標題在下方
引用圖片 : \ref{figure:figname}
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.5\textwidth]{./path/to/figure}
    \caption{圖片標題}
    \label{figure:figname}
\end{figure}
```

### 插入表格
```latex
% 表格標題在上方
引用表格 : \ref{table:tablename}
\begin{table}[htbp]
    \centering
    \caption{表格標題}
    \label{table:tablename}
    \begin{tabular}{|c|c|c|}
        \hline
        1 & 2 & 3 \\
        \hline
        4 & 5 & 6 \\
        \hline
    \end{tabular}
\end{table}
```

### 插入數學公式
```LaTeX
% 公式標題在右方
引用公式 : \ref{equation:equationname}
\begin{equation}
    \label{equation:equationname}
    \begin{aligned}
        \mathbf{X} &= \mathbf{U} \mathbf{\Sigma} \mathbf{V}^T
    \end{aligned}
\end{equation}
```

### 插入演算法
```LaTeX
% 演算法標題在上方
引用演算法 : \ref{algorithm:algorithmname}
\begin{algorithm}[htbp]
    \caption{演算法標題}
    \label{algorithm:algorithmname}
    \begin{algorithmic}[1]
        \Require $n \geq 0$
        \Ensure $y = x^n$
        \State $y \leftarrow 1$
        \State $X \leftarrow x$
        \State $N \leftarrow n$
        \While{$N \neq 0$}
            \If{$N$ is even}
                \State $X \leftarrow X \times X$
                \State $N \leftarrow N / 2$
            \Else[$N$ is odd]
                \State $y \leftarrow y \times X$
                \State $N \leftarrow N - 1$
            \EndIf
        \EndWhile
    \end{algorithmic}
\end{algorithm}
```

### 論文引用
```LaTeX
引用論文 : \cite{paper1}, \cite{paper2, paper3}
```

## 致謝
本LaTex模板修改自 : 
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)


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
