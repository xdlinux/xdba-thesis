
%% This program is a LaTeX class file for bachelor thesis template
%% of Xidian university , built with the CTeX 2.9.0, writen with
%% WinEdt 6.0.
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program; if not, write to the Free Software
%% Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
%%
%% Copyright \copyright\ 2010 Xue-Jilong @ xidian
%% $Xue-Jilong xuejilong@gmail.com, v0.2, 2011/04/01$
%% ----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{XDBAthesis}[2011/03/20 v0.1 XDBAthesis document class]

\newif\ifXDBA@typeinfo \XDBA@typeinfotrue
\DeclareOption{notypeinfo}{\XDBA@typeinfofalse}
\newif\ifXDBA@dvips \XDBA@dvipsfalse
\newif\ifXDBA@gbk \XDBA@gbktrue
\newif\ifXDBA@master \XDBA@masterfalse
\newif\ifXDBA@bachelor \XDBA@bachelortrue
\DeclareOption{dvips}{\XDBA@dvipstrue}
\DeclareOption{dvipdfm}{\XDBA@dvipsfalse}
\DeclareOption{pdftex}{\XDBA@dvipsfalse}
\DeclareOption{xetex}{\XDBA@dvipsfalse\XDBA@gbkfalse}
\DeclareOption{utf-8}{\XDBA@gbkfalse}
\DeclareOption{master}{\XDBA@mastertrue\XDBA@bachelorfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}[2005/11/25]


\ifXDBA@bachelor
    %% set line spacing 1.5times,1.24*14.5=18pt
    \renewcommand{\baselinestretch}{1.62}
\else
    \setlength{\baselineskip}{20pt}
    \setlength{\jot}{-2pt}
\fi

% fix bullet for xetex with adobe font
%\ifxetex
%\renewcommand{\labelitemi}{\LARGE$\textbullet$}
%\fi
% set equation numer as (1-5)
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

%% check pdfTeX mode
\RequirePackage{ifpdf}
%% check XeLaTeX mode
\RequirePackage{ifxetex}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% modify caption
\RequirePackage[font=small,labelsep=space]{caption}
%% modity tabs
\RequirePackage{booktabs,tabularx}
%% graphics packages
\RequirePackage{graphicx}
%% sort and compress citations
\RequirePackage[square,sort&compress,numbers,super]{natbib}
%% for dashedUnderline
\RequirePackage{ulem}
%% packages and settings depend on PDF mode

\ifpdf   % We're running pdfTeX in PDF mode
    \RequirePackage[pdftex]{hyperref}
    \DeclareGraphicsExtensions{.pdf,.eps,.mps,.jpg,.png}
\else    % We're not running pdfTeX, or running pdfTeX in DVI mode
    \ifXDBA@dvips
        \RequirePackage[dvips]{hyperref}
        \RequirePackage{psfrag}
        \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
    \fi
    \ifxetex
        \RequirePackage{hyperref}
    \else
        \RequirePackage[dvipdfm]{hyperref}
    \fi
    \DeclareGraphicsExtensions{.eps,.ps,.mps,.pdf,.jpg,.png}
\fi
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
       plainpages=false,%
       %colorlinks,
       %citecolor=black,
       %filecolor=black,
       %linkcolor=black,
       %urlcolor=black,
       hidelinks,
       pdfstartview=FitH }

\ifxetex
  \XDBA@gbkfalse
  \RequirePackage[T1]{fontenc}
\fi
\ifXDBA@gbk
  \AtEndOfPackage{\makeatletter\input{XDBAthesis.cfg}\makeatother}
\else
  \AtEndOfPackage{\makeatletter\input{XDBAthesis-utf8.cfg}\makeatother}
\fi
\RequirePackage{times} % set english fonts to Times New Roman

%% set margin with left:3cm,right:2cm,up:3cm,down:2cm
\oddsidemargin 1.46 true cm
\evensidemargin -0.54 true cm
\topmargin -0.54 true cm
\headheight 12.9pt
\headsep 17.3527pt
\textheight 24.7 true cm
\textwidth 15 true cm
\footskip 0 cm
\parskip 0.5ex plus 0.25ex minus 0.25ex


%\makeatletter
%\def\tagform@#1{\maketag@@@{\ignorespaces[#1]\unskip\@@italiccorr}}
%\makeatother

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    %\thispagestyle{empty}
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand{\floatpagefraction}{0.80}

\bibliographystyle{plain}
\newcommand\XDBAspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand\XDBAquad{\protect\CTEX@spaceChar}

\def\XDBA@getfileinfo#1 #2 #3\relax#4\relax{%
    \def\XDBAfiledate{#1}%
    \def\XDBAfileversion{#2}%
    \def\XDBAfileinfo{#3}}%

%this paragraph maybe confused, i didn't understand
\expandafter\ifx\csname ver@XDBAthesis.cls\endcsname\relax
    \edef\reserved@a{\csname ver@ctextemp_XDBAthesis.cls\endcsname}
    \else
    \edef\reserved@a{\csname ver@XDBAthesis.cls\endcsname}
\fi
\expandafter\XDBA@getfileinfo\reserved@a\relax? ? \relax\relax

%% define the underline
\def\XDBA@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\XDBAunderline{\@ifnextchar[\XDBA@underline\underline}

\def\XDBA@dashuline[#1]#2{%
  \dashuline{\hbox to #1{\hfill#2\hfill}}}
\def\XDBAdashuline{\@ifnextchar[\XDBA@dashuline\dashuline}

%% define the bookface
\newcommand\schoolnumber[1]{\def\XDBA@value@schoolnumber{#1}}
\renewcommand\title[2]{\def\XDBA@value@title{#1} \def\XDBA@value@resttitle{#2}}
\newcommand\major[1]{\def\XDBA@value@major{#1}}
\renewcommand\author[1]{\def\XDBA@value@author{#1}}
\newcommand\advisor[1]{\def\XDBA@value@advisor{#1}}

\ifXDBA@bachelor
\newcommand\class[1]{\def\XDBA@value@class{#1}}
\newcommand\college[1]{\def\XDBA@value@college{#1}}
\else
\newcommand\entitle[2]{\def\XDBA@value@entitle{#1} \def\XDBA@value@enresttitle{#2}}
\newcommand\identifier[1]{\def\XDBA@value@identifier{#1}}
\newcommand\classnumber[1]{\def\XDBA@value@classnumber{#1}}
\newcommand\classification[1]{\def\XDBA@value@classification{#1}}
\newcommand\majorclass[1]{\def\XDBA@value@majorclass{#1}}
\renewcommand\date[1]{\def\XDBA@value@date{#1}}
\fi

\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \ifXDBA@bachelor
    \begin{flushright}
        \bf\songti\zihao{-4}
        \XDBA@label@class~ \XDBAunderline[100pt]{\XDBA@value@class}\\
        \XDBA@label@schoolnumber~ \XDBAunderline[100pt]{\XDBA@value@schoolnumber}
    \end{flushright}

    \begin{center}
        \vskip \stretch{2}
            \includegraphics[width=9cm]{xd1}
        \vskip \stretch{1}
            {\heiti\zihao{0}\ziju{0.25} \XDBA@label@thesis}
        \vskip \stretch{2}
            \includegraphics[width=5cm]{xd2}
        \vskip \stretch{2}
            \heiti\zihao{3} \XDBA@label@title~ \XDBAunderline[250pt]{~\XDBA@value@title~}
        \vskip \stretch{0.5}
                            \XDBAspace\XDBAspace~\XDBAunderline[250pt]{~\XDBA@value@resttitle}
        \vskip \stretch{0.5}
            \heiti\zihao{3} \XDBA@label@college~
            \songti\zihao{-3}\XDBAunderline[250pt]{~\XDBA@value@college~}
        \vskip \stretch{0.5}
            \heiti\zihao{3} \XDBA@label@major~
            \songti\zihao{-3}\XDBAunderline[250pt]{~\XDBA@value@major~}
        \vskip \stretch{0.5}
            \heiti\zihao{3} \XDBA@label@author~
            \songti\zihao{-3}\XDBAunderline[250pt]{~\XDBA@value@author~}
        \vskip \stretch{0.5}
            \heiti\zihao{3} \XDBA@label@advisor~
            \songti\zihao{-3}\XDBAunderline[250pt]{~\XDBA@value@advisor~}
    \end{center}
    \fi
    \ifXDBA@master
    \setlength{\baselineskip}{24pt}
    { \bf\heiti\zihao{5}\noindent
        \XDBA@label@identifier\XDBAdashuline[4.45cm]{\XDBA@value@identifier}\hspace*{1cm}
        \XDBA@label@schoolnumber\XDBAdashuline[4.45cm]{\XDBA@value@schoolnumber}\\
        \XDBA@label@classnumber\XDBAdashuline[4.45cm]{\XDBA@value@classnumber}\hspace*{1cm}
        \XDBA@label@classification\XDBAdashuline[4.45cm]{\XDBA@value@classification}
        \vskip \stretch{15}\bf\heiti\zihao{4}
        \noindent\makebox[3.08cm][s]{\XDBA@label@title}\songti\XDBAdashuline[11.88cm]{\XDBA@value@title}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{}\XDBAdashuline[11.88cm]{\XDBA@value@resttitle}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{}\XDBAdashuline[11.88cm]{\XDBA@value@entitle}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{}\XDBAdashuline[11.88cm]{\XDBA@value@enresttitle}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{\heiti\zihao{4} \XDBA@label@author}
            \songti\zihao{4}\XDBAdashuline[2.50cm]{\XDBA@value@author~}
            \makebox[4.45cm][s]{\heiti\zihao{4} \XDBA@label@advisor}
            \songti\zihao{4}\XDBAdashuline[4.46cm]{\XDBA@value@advisor~}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{\heiti\zihao{4} \XDBA@label@majorclass}
            \songti\zihao{4}\XDBAdashuline[2.54cm]{\XDBA@value@majorclass}
            \makebox[2.54cm][s]{\heiti\zihao{4} \XDBA@label@major}
            \songti\zihao{4}\XDBAdashuline[6.3cm]{\XDBA@value@major~}
        \vskip \stretch{0.3}
        \noindent\makebox[3.08cm][s]{\heiti\zihao{4} \XDBA@label@date}
            \kaishu\zihao{4}\XDBAdashuline[11.68cm]{\XDBA@value@date~}
        \vskip \stretch{0.3}
        \makebox[1cm]{}
    \setlength{\baselineskip}{20pt}
        }
    \fi
    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \ifXDBA@typeinfo
        \vspace*{\stretch{1}}
        \begin{footnotesize}
            {\bf\noindent Contributers:}
            \begin{description}
                \item[HaoChen] write the statement page
                \item[Olorin183795] bug report
                \item[yzg3307] bug report
            \end{description}
            \noindent
            Author by Xue-Jilong ( xuejilong@gmail.com ) and Justin-Wong ( bigeagle@xdlinux.info )\\
            Typeset by \LaTeXe{} and \CTeX{} and provide for Bachelor Thesis of Xidian University. \\
            The first page will not appear in your final thesis paper.  Take it easy for this copyright footnote. :-)
        \end{footnotesize}
    \fi
    \cleardoublepage
  \fi
}

\fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead{} % clear all header fields
    \fancyhead[C]{\songti\zihao{5} \leftmark}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75 pt}%
}

\fancypagestyle{content}{%
    \fancyhf{}
    \fancyhead[CO]{\songti\zihao{5} \nouppercase \leftmark}
    \fancyhead[CE]{\songti\zihao{5} \nouppercase {\XDBA@value@title\XDBA@value@resttitle}}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75pt}%
}

\fancypagestyle{tableOfContent}{%
    \fancyhf{}
    \fancyhead[CO]{\songti\zihao{5} \nouppercase \leftmark}
    \fancyhead[CE]{\songti\zihao{5} \nouppercase \leftmark}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75pt}%
}

\fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead{}
    \fancyhead[CO]{\songti\zihao{5} \leftmark}
    \fancyhead[CE]{\zihao{5} {\XDBA@value@title\XDBA@value@resttitle}}
    \fancyhead[LE,RO]{}
    \renewcommand{\headrulewidth}{0.75pt}%
}
\pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CE]{\songti\zihao{5} \leftmark}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75 pt}%

\newenvironment{abstract}
{\NCchapter{\heiti\zihao{3} \XDBA@label@abstract}{\XDBA@label@abstract}}
    {\pagestyle{front}\thispagestyle{front}\cleardoublepage}

\newcommand\keywords[1]{%
    \vspace{2ex}\noindent{\heiti\zihao{-4} \XDBA@label@keywords} \heiti\zihao{-4}#1}

\newenvironment{englishabstract}
    {\NCSchapter{\bf\zihao{3} \XDBA@label@englishabstract}{\XDBA@label@englishabstract}}
    {\pagestyle{front}\thispagestyle{front}\cleardoublepage}
\newcommand\englishkeywords[1]{%
    \vspace{2ex}\noindent{\bf\zihao{-4} \XDBA@label@englishkeywords} \bf\zihao{-4}#1}

\renewcommand\tableofcontents{%
  \setcounter{page}{1}
  \pagestyle{tableOfContent}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \NCchapter{\contentsname}{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \thispagestyle{plain}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}
\addtocontents{toc}{\let\string\XDBA@spaceChar\relax}

\newcommand\NCSchapter[2]{%
\renewcommand{\chapter}{\if@openright\clearpage\else\clearpage\fi
\global\@topnum\z@ \@afterindentfalse \secdef\@chapter\@schapter}
    \if@mainmatter%
        \@mainmatterfalse%
        \chapter*{#1} \chaptermark{#2}%
        \@mainmattertrue%
  \else
        \chapter*{#1}\chaptermark{#2}%
  \fi
}

\newcommand\NCchapter[2]{%
    \if@mainmatter%
        \@mainmatterfalse%
        \chapter*{#1} \chaptermark{#2}%
        \@mainmattertrue%
  \else
        \chapter*{#1}\chaptermark{#2}%
  \fi
}
\newcommand\Nchapter[1]{%
    \if@mainmatter%
        \@mainmatterfalse%
        \chapter[#1]{#1}%
        \@mainmattertrue%
    \else
        \chapter[#1]{#1}%
    \fi
}

\def\@dottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode
        \@tempdima #3\relax
        \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par}%
    \fi}
\renewcommand*\l@part[2]{%
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \large \bfseries #1
            \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi}
\renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip 1.0em \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \bf\songti\zihao{-4}
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak
            \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi}

\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


\renewenvironment{thanks}
    {\Nchapter{\XDBA@label@thanks}}
    {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
    {}%      Space above, empty = `usual value'
    {}%      Space below
    {\itshape}% Body font
    {}%         Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}% Thm head font
    {.}%        Punctuation after thm head
    {\newline}% Space after thm head: \newline = linebreak
    {}%         Thm head spec
\endinput
%%
%% End of file `XDBAthesis.cls'.
