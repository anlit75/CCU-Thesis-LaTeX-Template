# CCU-國立中正大學 Latex 模板
國立中正大學碩士論文Latex模板, XeLaTeX is required to compile this document.

# 模板檔案結構

```
Template Structure
├── main.tex                        // 主文件
├── frontpages
│   ├── acknowledgement.tex         // 致謝
│   └── abstract.tex                // 中/英文摘要
├── sections
│   ├── introduction.tex            // 緒論
│   ├── related_work.tex            // 文獻探討
│   ├── method.tex                  // 研究方法
│   ├── experiments.tex             // 研究結果
│   └── conclusion.tex              // 結論
├── backpages
│   ├── bibliography.tex            // 參考文獻
│   ├── reference.bib               // 參考文獻文件
│   └── appendix.tex                // 附錄
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

# Acknowledgement
- LaTex template modified from : [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template) 、 [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
