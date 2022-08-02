\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muyadoc}[2022/08/02 v0.2.0 A template for muya publications based on brill]

\RequirePackage{iftex}
\RequirePackage{kvoptions}
\SetupKeyvalOptions {
   family  = muyadoc,
   prefix  = muyadoc@,
   setkeys = \kvsetkeys
}
\DeclareDefaultOption{%
   \expandafter\PassOptionsToClass\expandafter\CurrentOption{brill}%
}
\ProcessKeyvalOptions*
%\PassOptionsToClass{twoside=false}{scrbook}

\RequireLuaTeX
\LoadClass{brill}
\setmainfont{Brill}
\newcommand*{\@collaborator}{}
\newcommand*{\collaborator}[1]{\renewcommand*{\@collaborator}{#1}}
\renewcommand*{\maketitle}[1][1]{%
   \begin{titlepage}
      \setcounter{page}{%
         #1%
      }%
      \let\titlepage@restore\relax
      %\let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
      {\centering
         {\usekomafont{title}\LARGE\@title\par}
         \ifx\@subtitle\@empty
         \vskip 3\baselineskip
         \else
         \vskip 2\baselineskip
         {\usekomafont{subtitle}\Large\@subtitle\par}
         \vskip 3\baselineskip
         \fi%
         {\usekomafont{author}\@author\par}
         \vskip 3\baselineskip
         \ifdefempty{\@collaborator}{}{\@collaborator\\}%
         \@date\par
         \vfill
         \includegraphics[width=.5\textwidth]{muya_logo}\par
      }%
      \if@twoside
         \@tempswatrue
         \expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
         \else
            \ifx\@uppertitleback\@empty\ifx\@lowertitleback\@empty
               \@tempswafalse
            \fi\fi%
         \fi%
         \if@tempswa
            \next@tpage
               \begin{minipage}[t]{\textwidth}
                  \@uppertitleback
               \end{minipage}\par
            \vfill
               \begin{minipage}[b]{\textwidth}
                  \@lowertitleback
               \end{minipage}\par
         \fi%
      \else
         \ifx\@uppertitleback\@empty\else
            \ClassWarning{\KOMAClassName}{%
            non empty \string\uppertitleback\space ignored
            by \string\maketitle\MessageBreak
            in `twoside=false' mode%
            }%
         \fi%
         \ifx\@lowertitleback\@empty\else
            \ClassWarning{\KOMAClassName}{%
            non empty \string\lowertitleback\space ignored
            by \string\maketitle\MessageBreak
            in `twoside=false' mode%
            }%
         \fi%
      \fi%
   \end{titlepage}
   \setcounter{footnote}{0}%
   \global\let\and\relax
}

\makeindex[%
   name=manuscripts,%
   title={Index of Manuscripts},%
   columns=3,%
   columnsep=4mm,%
   options={-n -c brill}%
]%
