% --------------------------------------------------
% 國立中正大學碩博士論文模板
% National Chung Cheng University (CCU) Thesis Template
% --------------------------------------------------
% Author        : anlit <anson40512@gmail.com>
% Repository    : https://github.com/
% Last Updated  : 2024.01.17

% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
% Must indicate what's the release of LaTeX we are using.
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
% Define the name and description of class.
\ProvidesClass{ccuthesis}[CCU Thesis Template]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
% Include required packages for basic settings.

\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}

% [定義變數]
% Define essential variables.

% 變數: 路徑
% Variables: Path
\newcommand{\ccu@path@font}{./fonts/english/}
\newcommand{\ccu@path@cjkfont}{./fonts/chinese/}

% 變數: 中文翻譯
% Variables: Translation (Chinese)
\newcommand{\ccu@verificationletter@zh}{口試委員審定書}
\newcommand{\ccu@acknowledgement@zh}{致謝}
\newcommand{\ccu@abstract@zh}{摘要}
\newcommand{\ccu@keyword@zh}{關鍵字：}
\newcommand{\ccu@tableofcontents@zh}{目錄}
\newcommand{\ccu@listoffigures@zh}{圖目錄}
\newcommand{\ccu@listoftables@zh}{表目錄}
\newcommand{\ccu@denotation@zh}{符號列表}
\newcommand{\ccu@bibliography@zh}{參考文獻}
\newcommand{\ccu@appendix@zh}{附錄}
\newcommand{\ccu@figurename@zh}{圖}
\newcommand{\ccu@tablename@zh}{表}
\newcommand{\ccu@kwsymbol@zh}{、}

\newcommand{\ccu@titlesection@zh}{第\CJKnumber{\thesection}章}
\newcommand{\ccu@titlesectiontoc@zh}{第\CJKnumber{\thecontentslabel}章}

% 變數: 英文翻譯
% Variables: Translation (English)
\newcommand{\ccu@verificationletter@en}{Verification Letter from the Oral Examination Committee}
\newcommand{\ccu@tableofcontents@en}{Contents}
\newcommand{\ccu@listoffigures@en}{List of Figures}
\newcommand{\ccu@listoftables@en}{List of Tables}
\newcommand{\ccu@denotation@en}{Denotation}
\newcommand{\ccu@bibliography@en}{References}
\newcommand{\ccu@acknowledgement@en}{Acknowledgements}
\newcommand{\ccu@abstract@en}{Abstract}
\newcommand{\ccu@keyword@en}{Keywords:~}
\newcommand{\ccu@kwsymbol@en}{,~}
\newcommand{\ccu@appendix@en}{Appendix}
\newcommand{\ccu@figurename@en}{Figure}
\newcommand{\ccu@tablename@en}{Table}

\newcommand{\ccu@titlesection@en}{Chapter~\thesection}
\newcommand{\ccu@titlesectiontoc@en}{Chapter~\thecontentslabel}

% 變數: 版面設定
% Variables: Layouts
\newcommand{\ccu@geometry@main}{top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm}
\newcommand{\ccu@geometry@cover}{top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm}

\newcommand{\ccu@tocvspace}{1em}
\newcommand{\ccu@tocsectionsize@zh}{4.5em}
\newcommand{\ccu@tocsectionsize@en}{5.5em}

\newcommand{\ccu@tocsecindent@zh}{1.5em}
\newcommand{\ccu@tocsecnumwidth@zh}{3.0em}
\newcommand{\ccu@tocsubsecindent@zh}{3.0em}
\newcommand{\ccu@tocsubsecnumwidth@zh}{3.0em}

\newcommand{\ccu@tocsecindent@en}{2.5em}
\newcommand{\ccu@tocsecnumwidth@en}{3.0em}
\newcommand{\ccu@tocsubsecindent@en}{3.0em}
\newcommand{\ccu@tocsubsecnumwidth@en}{3.0em}

% [定義命令]
% Define essential commands.

% 命令: 錯誤訊息
% Command: Error and Warning Messages
%
\newcommand{\ccu@error}[1]{
  \ClassError{ccuthesis}{#1}{}
}

\newcommand{\ccu@warning}[1]{
  \ClassWarning{ccuthesis}{#1}
}

% 命令: 鍵值設定
% Command: Key Value Options
%
\SetupKeyvalOptions{
  family=ccu,
  prefix=ccu@,
  setkeys=\kvsetkeys
}

\newcommand{\ccusetup}{
  \kvsetkeys{ccu}
}

\newcommand{\ccu@define@key}[1]{
  \kvsetkeys{ccu@key}{#1}
}

\kv@set@family@handler{ccu@key}{%
  \@namedef{ccu@#1@@name}{#1}%
  \def\ccu@@default{}%
  \def\ccu@@choices{}%
  \kv@define@key{ccu@value}{name}{%
    \@namedef{ccu@#1@@name}{##1}%
  }%
  \kv@define@key{ccu@value}{code}{%
    \@namedef{ccu@#1@@code}{##1}%
  }%
  \@namedef{ccu@#1@@check}{}%
  \@namedef{ccu@#1@@code}{}%
  \@namedef{ccu@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{ccu@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{ccu@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{ccu@value}{choices}{%
    \def\ccu@@choices{##1}%
    \@namedef{ccu@#1@@reset}{}%
    \@namedef{ccu@#1@@check}{%
      \@ifundefined{%
        ifccu@\@nameuse{ccu@#1@@name}@\@nameuse{ccu@\@nameuse{ccu@#1@@name}}%
      }{%
        \ccu@error{Invalid value "#1 = \@nameuse{ccu@\@nameuse{ccu@#1@@name}}"}%
      }%
      \@nameuse{ccu@#1@@reset}%
      \@nameuse{ccu@\@nameuse{ccu@#1@@name}@\@nameuse{ccu@\@nameuse{ccu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{ccu@value}{default}{%
    \def\ccu@@default{##1}%
  }%
  \kvsetkeys{ccu@value}{#2}%
  \@namedef{ccu@\@nameuse{ccu@#1@@name}}{}%
  \kv@set@family@handler{ccu@choice}{%
    \ifx\ccu@@default\@empty
      \def\ccu@@default{##1}%
    \fi
    \expandafter\newif\csname ifccu@\@nameuse{ccu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname ccu@#1@@reset\endcsname{%
      \@nameuse{ccu@\@nameuse{ccu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{ccu@choice}{\ccu@@choices}%
  \expandafter\let\csname ccu@\@nameuse{ccu@#1@@name}\endcsname\ccu@@default
  \expandafter\ifx\csname ccu@\@nameuse{ccu@#1@@name}\endcsname\@empty\else
    \@nameuse{ccu@#1@@check}%
    \@nameuse{ccu@#1@@hook}%
  \fi
  \kv@define@key{ccu}{#1}{%
    \@namedef{ccu@\@nameuse{ccu@#1@@name}}{##1}%
    \@nameuse{ccu@#1@@check}%
    \@nameuse{ccu@#1@@hook}%
  }%
}

\newcommand\ccu@option@hook[2]{
  \expandafter\g@addto@macro\csname ccu@#1@@code\endcsname{#2}
}

% 命令: 鍵值陣列使用
% Command: Retrieve the array value with key-value pair.
%
\newcommand\ccu@clist@use[2]{%
  \def\ccu@@tmp{}%
  \kv@set@family@handler{ccu@clist}{%
    \ifx\ccu@@tmp\@empty
      \def\ccu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{ccu@clist}{#1}%
}

% 命令: 日期格式
% Commands: Data Formating
%
\newcommand{\ccu@format@date}[2]{%
  \edef\ccu@@date{#2}%
  \def\ccu@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\ccu@@process@date\ccu@@date\@nil
}
\newcommand\ccu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\ccu@date@zh@digit@short[3]{\the\numexpr#1-1911\relax~年~\number#2~月}

\newcommand{\ccu@setgeometry}[1]{\expandafter\newgeometry\expandafter{#1}}

% --------------------------------------------------
% 03 編譯檢查（Compile Checking）
% --------------------------------------------------

\ifXeTeX\else
  \ccu@error{XeLaTeX is required to compile this document.}
\fi

% --------------------------------------------------
% 04 論文設定（Document Configs）
% --------------------------------------------------

% [文檔選項]
% Configs from options
%
\ccu@define@key{
  degree = {
    choices = {
      master,
      doctor,
    },
    default = master,
    name    = degreeset
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  fontset = {
    choices = {
      default,
      system,
      overleaf,
      template,
    },
    default = default,
  },
  watermark = {
    choices = {
      true,
      false,
    },
    default = false,
  },
}

% [設定檔案]
% Configs from ccusetup.tex
%
\ccu@define@key{
  university = {
    default = {國立中正大學},
  },
  university* = {
    default = {National Chung Cheng University},
    name    = university@en,
  },
  college = {
    default = {工學院},
  },
  college* = {
    default = {College of Engineering},
    name    = college@en,
  },
  institute = {
    default = {電機工程學研究所},
  },
  institute* = {
    default = {Institute of Electrical Engineering},
    name    = institute@en,
  },
  title = {
    default = {論文標題},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {論文作者},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  ID = {
    default = {學號},
  },
  advisor = {
    default = {指導教授},
  },
  advisor* = {
    default = {Name of supervisor},
    name    = advisor@en,
  },
  keywords = {
    default = {關鍵字},
  },
  keywords* = {
    default = {Keywords},
    name    = keywords@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  oral-date = {
    name    = oraldate,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}

% --------------------------------------------------
% 05 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
% Option Declaration (pass tundefined options to father class)
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article}
}

% 處理選項並載入基礎文檔
% Terminates the options processing and loads the basic class.
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper, 12pt]{article}


% 根據設定值賦值變數
% Assign variables according to configs.
\ifthenelse{\equal{\ccu@degreeset}{master}}{
  \newcommand{\ccu@degree}{碩士}
  \newcommand{\ccu@degree@en}{Master}
  \newcommand{\ccu@type}{論文}
  \newcommand{\ccu@type@en}{Thesis}
}

\ifthenelse{\equal{\ccu@degreeset}{doctor}}{
  \newcommand{\ccu@degree}{博士}
  \newcommand{\ccu@degree@en}{Doctoral}
  \newcommand{\ccu@type}{論文}
  \newcommand{\ccu@type@en}{Dissertation}
}

\ifthenelse{\equal{\ccu@language}{chinese}}{
  % 設定中文
  \newcommand{\ccu@titlesection}{\ccu@titlesection@zh}
  \newcommand{\ccu@titlesectiontoc}{\ccu@titlesectiontoc@zh}
  \newcommand{\ccu@tocsectionsize}{\ccu@tocsectionsize@zh}
  \newcommand{\ccu@tocsectionindent}{\ccu@tocsectionindent@zh}
  \newcommand{\ccu@tocsubsectionindent}{\ccu@tocsubsectionindent@zh}
  \newcommand{\ccu@acknowledgement}{\ccu@acknowledgement@zh}
  \newcommand{\ccu@tableofcontents}{\ccu@tableofcontents@zh}
  \newcommand{\ccu@listoffigures}{\ccu@listoffigures@zh}
  \newcommand{\ccu@listoftables}{\ccu@listoftables@zh}
  \newcommand{\ccu@denotation}{\ccu@denotation@zh}
  \newcommand{\ccu@verificationletter}{\ccu@verificationletter@zh}
  \newcommand{\ccu@bibliography}{\ccu@bibliography@zh}
  \newcommand{\ccu@appendix}{\ccu@appendix@zh}
  \newcommand{\ccu@figurename}{\ccu@figurename@zh}
  \newcommand{\ccu@tablename}{\ccu@tablename@zh}

  % 設定單位
  \newcommand{\ccu@tocsecindent}{\ccu@tocsecindent@zh}
  \newcommand{\ccu@tocsecnumwidth}{\ccu@tocsecnumwidth@zh}
  \newcommand{\ccu@tocsubsecindent}{\ccu@tocsubsecindent@zh}
  \newcommand{\ccu@tocsubsecnumwidth}{\ccu@tocsubsecnumwidth@zh}
}

\ifthenelse{\equal{\ccu@language}{english}}{
  % 設定英文
  \newcommand{\ccu@titlesection}{\ccu@titlesection@en}
  \newcommand{\ccu@titlesectiontoc}{\ccu@titlesectiontoc@en}
  \newcommand{\ccu@tocsectionsize}{\ccu@tocsectionsize@en}
  \newcommand{\ccu@tocsectionindent}{\ccu@tocsectionindent@en}
  \newcommand{\ccu@tocsubsectionindent}{\ccu@tocsubsectionindent@en}
  \newcommand{\ccu@acknowledgement}{\ccu@acknowledgement@en}
  \newcommand{\ccu@tableofcontents}{\ccu@tableofcontents@en}
  \newcommand{\ccu@listoffigures}{\ccu@listoffigures@en}
  \newcommand{\ccu@listoftables}{\ccu@listoftables@en}
  \newcommand{\ccu@denotation}{\ccu@denotation@en}
  \newcommand{\ccu@verificationletter}{\ccu@verificationletter@en}
  \newcommand{\ccu@bibliography}{\ccu@bibliography@en}
  \newcommand{\ccu@appendix}{\ccu@appendix@en}
  \newcommand{\ccu@figurename}{\ccu@figurename@en}
  \newcommand{\ccu@tablename}{\ccu@tablename@en}

  % 設定單位
  \newcommand{\ccu@tocsecindent}{\ccu@tocsecindent@en}
  \newcommand{\ccu@tocsecnumwidth}{\ccu@tocsecnumwidth@en}
  \newcommand{\ccu@tocsubsecindent}{\ccu@tocsubsecindent@en}
  \newcommand{\ccu@tocsubsecnumwidth}{\ccu@tocsubsecnumwidth@en}
}

% --------------------------------------------------
% 06 載入套件 (Include Packages)
% --------------------------------------------------

% [載入套件]
% - ifthen                      條件判斷支持
% - xparse                      定義命令
% - xeCJK                       排版中日韓(CJK)字符
% - indentfirst                 首行縮進
% - fontspec                    設定中英文字體
% - xcolor                      設定顏色
% - geometry                    設定版面大小
% - titlesec                    設定章節格式
% - titletoc, tocloft           設定目錄格式
% - fancyhdr                    設定頁首頁尾
% - ulem                        下劃線、雙下劃線與波浪紋效果
% - setspace                    設定行距（標題內文分別設定）
% - graphicx                    插入圖片
% - tikz                        繪圖
% - eso-pic                     插入圖片於文字下方
% - pdfpages                    插入 pdf 檔案
% - tabularx                    插入表格
% - booktabs                    改善表格設置
% - array                       調整表格高度
% - longtable                   支援跨頁長表格
% - diagbox                     插入表格反斜線
% - multirow                    合併儲存格
% - amsmath, amsthm, amssymb    引入 AMS 數學環境
% - datetime                    日期格式轉換
% - CJKnumb                     中文數字轉換
% - zhnumber                    中文數字
% - fp, calc                    計算功能
% - hyperref                    超連結
% - paralist                    列表環境
% - footmisc                    自訂腳註符號
% - caption, subcaption         插入圖片、表格標題
%
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{titletoc, tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{ulem}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{diagbox}
\RequirePackage{multirow}
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{datetime}
\RequirePackage{CJKnumb}
\RequirePackage{zhnumber}
\RequirePackage{fp, calc}
\RequirePackage{hyperref}
\RequirePackage{paralist}
\RequirePackage{footmisc}
\RequirePackage{caption}
\RequirePackage[labelformat=simple]{subcaption}

% --------------------------------------------------
% 07 套件設定 (Package Settings)
% --------------------------------------------------

% [圖表目錄]
\graphicspath{{./figures/}}

% [文章排版]
%
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setlength{\parskip}{10pt}
\setlength{\parindent}{2em}

% [字體設定]
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%

\ifthenelse{\equal{\ccu@fontset}{default}}{
  \setmainfont{Times New Roman}[
    Path = \ccu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ccu@path@cjkfont ,
    Extension = .ttf , ]
}

\ifthenelse{\equal{\ccu@fontset}{template}}{
  \setmainfont{Times New Roman}[
    Path = \ccu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ccu@path@cjkfont ,
    Extension = .ttf ,
    BoldFont = Kaiti-Black, ]
}

\ifthenelse{\equal{\ccu@fontset}{overleaf}}{
  \setmainfont{Times New Roman}
  \setsansfont{Droid Sans}
  \setmonofont{Courier New}
  \setCJKmainfont{AR PL KaitiM Big5}
  \setCJKsansfont{AR PL KaitiM Big5}
  \setCJKmonofont{AR PL KaitiM Big5}
}

% [顏色設定]
%

% [版面大小]
%
\geometry{
  top=2.54cm,
  bottom=2.54cm,
  left=3.17cm,               % inner=3cm
  right=3.17cm               % outer=3cm
}

% [連結設定]
%
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=gray,
  anchorcolor=blue,
  citecolor=blue
}

% [目錄格式]
%
\addtocontents{toc}                                         % 修改目錄樣式
{~\hfill\textbf{Page}\par}
{}
{}
{}

% \titlecontents{標題名稱}[左間距]{標題格式}{標題內容}{無序號標題}{指引線與頁碼}[下間距]
\titlecontents{section}[0em]                                % 修改目錄樣式
{\addvspace{0.5em}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[\ccu@tocsectionsize][l]{\ccu@titlesectiontoc}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{8pt}                          % 修改目錄間距
\setlength{\cftbeforesubsecskip}{8pt}

\setcounter{tocdepth}{3}                                    % 設定目錄深度
\setcounter{secnumdepth}{3}                                 % 設定編號深度

% \cftsetindents{entry}{indent}{numwidth}
\cftsetindents{section}{\ccu@tocsecindent}{\ccu@tocsecnumwidth}
\cftsetindents{subsection}{\ccu@tocsubsecindent}{\ccu@tocsubsecnumwidth}

% [頁首頁尾]
%

% [標題格式]
% 載入套件包 titlesec 設定各層標題格式
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\section}                      % 設置 section 格式
{\centering\Huge\bfseries}                  % 定義 format
{\ccu@titlesection}              		        % 定義 label
{1em}                                       % 定義 sep
{}                                          % before

% [間距設定]
% \titleformat{command}{left}{top}{bottom}
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - left: 左邊界
% - top: 上邊界
% - bottom: 下邊界
%
% \titlespacing*{\section}{0pt}{-40pt}{40pt}

% [圖表標題]
%
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{skip=6bp}

% [引用格式]
%
\renewcommand\thesubfigure{~(\alph{subfigure})}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [添加路徑]
\newcommand\appendgraphicspath[1]{
  \g@addto@macro\Ginput@path{#1}
}

% [中文縮進]
% - \Eindent                    縮進
% - \Enoindent                  不縮進
%

% 獲取並定義 CJK 字符寬度
\newcommand{\ccu@CJKChar@size}{\hskip \f@size \p@}
\newdimen{\ccu@CJKChar@size@dimen}
\settowidth{\ccu@CJKChar@size@dimen}{\ccu@CJKChar@size\CJKglue}

% 定義命令
\newcommand{\CJKsetfontspace}{
  \settowidth\ccu@CJKChar@size@dimen{\ccu@CJKChar@size\CJKglue}
  \ifthenelse{\parindent=0pt}{\relax}{\parindent2\ccu@CJKChar@size@dimen}
}

% 縮進
\newcommand{\Eindent}{
  \CJKsetfontspace\parindent2\ccu@CJKChar@size@dimen
}

% 不縮進
\newcommand{\Enoindent}{
  \parident\z@
}

% [插入浮水印]
% - \makewatermark{#1}{#2}      生成浮水印
%   #1 Opacity                  設置透明度
%   #2 Logo Path                校徽路徑
%
\newcommand{\makewatermark}[2]{
  \AddToShipoutPicture{
    \put(-\paperwidth/2,-\paperheight/2){
      \parbox[b][\paperheight]{\paperwidth}{
        \vfill
        \centering
        \begin{tikzpicture}[remember picture, overlay]
          \coordinate (WM) at (current page.center);
          \node [scale=1.5] at (WM) {\includegraphics[width=5cm, height=5cm]{#2}};
          \filldraw [fill=white, draw=none, opacity=1-\the\numexpr#1] (current page.north east) rectangle (current page.south west);
        \end{tikzpicture}
      \vfill
}}}}

% [插入數位識別]
% - \InsertDOI{#1}              生成數位識別碼
%   #1 DOI Code                 數位識別碼
%
% \newcommand{\insertdoi}[1]{
%   \AddToShipoutPicture{
%     \AtPageUpperLeft{
%       \fboxrule=0pt\fboxsep=0pt\framebox[\paperwidth][r]{
%       \raisebox{-\paperheight}{
%       \put(\LenToUnit{-1cm},\LenToUnit{1cm}){
%       \fboxrule=0pt\fboxsep=0pt\framebox[0pt][r]{
%         \href{http://dx.doi.org/#1}{doi:#1}
% }}}}}}}

% [生成封面]
% Generate the cover page
%
\newcommand{\makecover}{
  \ccu@setgeometry{\ccu@geometry@cover}

  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        % 中文校系名稱 (28, 27)
        \fontsize{28}{27}\selectfont
        \textbf{\ccu@university\ccu@institute}\par
        \vspace{1cm}
        \textbf{\ccu@degree\ccu@type}\par

        % 中英文論文題目 (18, 27)
        \vfill
        \fontsize{18}{27}\selectfont
        \textbf{\ccu@title}\par
        \textbf{\ccu@title@en}\par

        % 中英文作者姓名 (18, 27)
        \vfill
        \textbf{\ccu@author}\par
        
        % 中英文指導教授 (18, 27)
        \vfill
        \textbf{指導教授：\ccu@advisor~博士}\par

        % 論文撰寫日期   (18, 27)
        \textbf{中華民國~\ccu@format@date{\ccu@date@zh@short}{\ccu@date}}
      \end{center}
    \end{singlespace}
  \end{titlepage}

  % 清除頁碼
  \clearpage
  \restoregeometry
}

% [生成口委審定書]
% Generate the verification letter page
%
\newcommand{\makeverification}{
  \clearpage
  \phantomsection
  \ccu@setgeometry{\ccu@geometry@main}
  % \pagenumbering{Roman}
  % \addcontentsline{toc}{section}{\ccu@verificationletter}
  \begin{singlespace}
    %  口委審定書標題 (24, 36) (26, 39)
    %  論文題目 (18, 30)
    \begin{center}
      \fontsize{24}{36}\selectfont
      \textbf{{\ccu@university}{\ccu@degree}學位{\ccu@type}考試審定書}
      \vfill
      \fontsize{18}{39}\selectfont
      {\ccu@institute}\par
      研究生\underline{\ccu@author}所提之論文\par
      \underline{\ccu@title}\par
      經本委員會審查，符合{\ccu@degree}學位論文標準。
    \end{center}
  \end{singlespace}

  \begin{doublespace}
    % 口委簽名表格 (18, 24)
    \begin{center}
      \vfill
      \fontsize{18}{24}\selectfont
      學位考試委員會召集人：\underline{\hspace{6cm}}簽章\par
      \begin{tabularx}{\textwidth}{Xl}
        委員
            & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}  \\
            & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}
      \end{tabularx}
      \vfill
      指導教授\underline{\hspace{8cm}}簽章\par
      中華民國\underline{\hspace{3cm}}年\underline{\hspace{3cm}}月\underline{\hspace{3cm}}日
      \vfill
    \end{center}
  \end{doublespace}

  % 恢復預設板型
  \restoregeometry
}

% [渲染口委審定書掃描檔]
% Render the verification letter scan pdf file
% 
\newcommand{\renderverification}[1]{
  \clearpage
  % \phantomsection
  % \ccu@setgeometry{\ccu@geometry@main}
  % \pagenumbering{Roman}
  % \addcontentsline{toc}{section}{\ccu@verificationletter}
  \includepdf[pages=-, pagecommand={\thispagestyle{empty}}, offset=0 0, width=\paperwidth, height=\paperheight]{#1}
}

% 定義 \cleardoublepage 命令，讓它的行為與 \clearpage 相同
\let\cleardoublepage\clearpage

% [生成目錄]
% Generate table of contents page.
%
\renewcommand{\contentsname}{\centerline{\ccu@tableofcontents}}
\newcommand{\maketableofcontents}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\ccu@tableofcontents}
  \tableofcontents
}

\let\oldnumberline\numberline
\renewcommand{\listfigurename}{\centerline{\ccu@listoffigures}}
\newcommand{\makelistoffigures}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\ccu@listoffigures}
  \renewcommand{\numberline}{\figurename~\oldnumberline}
  \listoffigures
}

\renewcommand{\listtablename}{\centerline{\ccu@listoftables}}
\newcommand{\makelistoftables}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\ccu@listoftables}
  \renewcommand{\numberline}{\tablename~\oldnumberline}
  \listoftables
}

% [設定間隔]
% \renewcommand{\cftbeforetoctitleskip}{-0.25in}
% \renewcommand{\cftaftertoctitleskip}{0in}
% \renewcommand{\cftbeforeloftitleskip}{-0.25in}
% \renewcommand{\cftafterloftitleskip}{0.2in}
% \renewcommand{\cftbeforelottitleskip}{-0.25in}
% \renewcommand{\cftafterlottitleskip}{0.2in}

% [致謝與論文摘要]
% \frontmatter
%
\newcommand{\frontmatter}{
  \cleardoublepage
  \ccu@setgeometry{\ccu@geometry@main}
  \pagenumbering{Roman}
  \fontsize{12}{18}\selectfont
}

% [正文開始]
% \mainmatter
%
\newcommand{\mainmatter}{
  \cleardoublepage
  \ccu@setgeometry{\ccu@geometry@main}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont
}

% [參考文獻]
% \refmatter
%
\newcommand{\refmatter}{
  \cleardoublepage
  \phantomsection
  \renewcommand{\refname}{\ccu@bibliography}
  \addcontentsline{toc}{section}{\ccu@bibliography}
}

% [附錄]
% \appendix{NUM}{TITLE}
%
\renewcommand{\appendix}[2]{
  \cleardoublepage
  \phantomsection
  \section*{\ccu@appendix~{#1}~---~#2}
  \addcontentsline{toc}{section}{\ccu@appendix~{#1}~---~#2}

  \renewcommand{\thesection}{\ccu@appendix}
  \renewcommand{\thefigure}{\Roman{figure}}
  \renewcommand{\theequation}{\Roman{equation}}
  \renewcommand{\thetable}{\Roman{table}}

  \setcounter{equation}{0}
  \setcounter{figure}{0}
  \setcounter{footnote}{0}
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \setcounter{table}{0}
}

% --------------------------------------------------
% 09 自訂環境（Custom Environments）
% --------------------------------------------------

% [符號列表]
% Denotation Environment
%
\newenvironment{denotation}[1][2.5cm]{
\phantomsection
\section*{\centering \ccu@denotation}
\addcontentsline{toc}{section}{\ccu@denotation}
\noindent
\begin{list}{}{
  \renewcommand\makelabel[1]{##1\hfill}
  \setlength{\labelwidth}{#1}                     % 符號欄寬度
  \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離
  \setlength{\itemindent}{0cm}                    % 標籤縮進
  \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
  \setlength{\rightmargin}{0cm}                   % 標籤右邊界
  \setlength{\parsep}{0cm}                        % 段落間距
  \setlength{\itemsep}{18pt}                      % 標籤間距
  \setlength{\listparindent}{0cm}                 % 段落縮進
  \setlength{\topsep}{0pt}                        % 標籤與上文距離
}}{\end{list}}

% [致謝環境]
% Acknowledgement Environment
%
\newenvironment{acknowledgement}{
  \phantomsection
  \section*{\centering \ccu@acknowledgement}
  \addcontentsline{toc}{section}{\ccu@acknowledgement}
  \fontsize{12}{18}\selectfont
}

% [摘要環境]
% Abstract Environment
%
\renewenvironment{abstract}{
  \fontsize{12}{18}\selectfont
  \phantomsection
  \section*{\centering \ccu@abstract@zh}
  \addcontentsline{toc}{section}{\ccu@abstract@zh}
}{
  \bigbreak
  \noindent \textbf{\ccu@keyword@zh}
  \ccu@clist@use{\ccu@keywords}{\ccu@kwsymbol@zh}
}

\newenvironment{abstract*}{
  \fontsize{12}{24}\selectfont
  \phantomsection
  \section*{\centering \ccu@abstract@en}
  \addcontentsline{toc}{section}{\ccu@abstract@en}
}{
  \bigbreak
  \noindent \textbf{\ccu@keyword@en}
  \ccu@clist@use{\ccu@keywords@en}{\ccu@kwsymbol@en}
}

% --------------------------------------------------
% 10 文檔處理（Document Processing）
% --------------------------------------------------

% 根據設定決定是否添加浮水印
% Insert watermark according to the config.
%
\ifthenelse{\equal{\ccu@watermark}{true}}{\makewatermark{0.25}{watermark}}{}

% 根據設定決定是否添加數位標識
% Insert DOI according to the config.
%
% \ifthenelse{\equal{\ccu@doi}{true}}{\insertdoi{\ccu@DOI}}{}

% 章節之間加入分頁符號
\let\oldsection\section
\renewcommand{\section}{\clearpage\oldsection}

% 設定行距
% 1.2：1.5 倍行距
% 1.6：2.0 倍行距
\setstretch{1.5}

% 套用翻譯
\renewcommand{\figurename}{\ccu@figurename}
\renewcommand{\tablename}{\ccu@tablename}