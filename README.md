# 國立中正大學碩博士論文LaTeX模板
本模板適用於國立中正大學碩博士論文的撰寫，並設置好論文基本架構和基礎語法示例供使用者參考，使用者只需根據自己的需求進行增減即可，並已預先設置Times New Roman與標楷體兩種通用字型。

## 目錄
- [模板範例演示](#模板範例演示)
- [模板檔案結構](#模板檔案結構)
- [LaTeX環境建置](#latex環境建置)
    - [vscode設置](#vscode設置)
- [LaTeX基礎語法](#latex基礎語法)
    - [標題](#標題)
    - [字體](#字體)
    - [列點項目](#列點項目)
    - [插入圖片](#插入圖片)
    - [插入表格](#插入表格)
    - [插入數學公式](#插入數學公式)
    - [插入演算法](#插入演算法)
    - [引用](#引用)
- [致謝](#致謝)
- [免責聲明](#免責聲明)
- [License](#license)

## 模板範例演示
- [mian.pdf](./main.pdf) 為本LaTeX模板的繁體中文論文範例檔案，可供使用者參考。

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
│   └── reference.bib               // 參考文獻資料庫
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

## LaTeX環境建置
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

// 可選參數
"latex-workshop.latex.autoBuild.run": "onSave",         // 當儲存時自動編譯
"latex-workshop.latex.autoClean.run": "onSucceeded",    // 當編譯成功時自動清理
```

## LaTeX基礎語法
以下為LaTeX基礎語法，若需要更完整的教學，可參考 [Overleaf LaTeX Basics](https://www.overleaf.com/learn/latex/) 或在 `sections/*.tex` 中參考其中範例。

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

### 字體
```latex
粗體   : \textbf{粗體字}
斜體   : \textit{斜體字}
粗斜體 : \textbf{\textit{粗斜體字}}
底線   : \underline{底線字}
```

### 列點項目
```latex
\begin{itemize}
    \item 個別項目1
    \item 個別項目2
\end{itemize}

\begin{enumerate}
    \item 清單編號1
    \item 清單編號2
\end{enumerate}
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
引用表格 : \ref{table:tabname}
\begin{table}[htbp]
    \centering
    \caption{表格標題}
    \label{table:tabname}
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
引用公式 : \ref{equation:eqname}
\begin{equation}
    \label{equation:eqname}
    \begin{aligned}
        \mathbf{X} &= \mathbf{U} \mathbf{\Sigma} \mathbf{V}^T
    \end{aligned}
\end{equation}
```

### 插入演算法
```LaTeX
% 演算法標題在上方
引用演算法 : \ref{algorithm:algoname}
\begin{algorithm}[htbp]
    \caption{演算法標題}
    \label{algorithm:algoname}
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

### 引用
```LaTeX
引用論文 : \cite{paper1}, \cite{paper2, paper3}
引用圖片 : \ref{figure:figname}
引用表格 : \ref{table:tabname}
```

## 致謝
感謝以下模板作者的貢獻，提供了許多參考，使得本模板能夠順利完成 : 
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)


## 免責聲明
本模板為非官方版本，因此格式可能有誤，僅供參考，若使用上有任何問題，請自行承擔風險。

建議使用者根據系上的要求進行調整，若有任何問題，請提issue或是寄信至[作者信箱](mailto:anson40512@gmail.com)。

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
