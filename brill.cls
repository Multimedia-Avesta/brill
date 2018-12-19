\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brill}[2018/11/13 v0.6 A template for Brill publications]
\newif\if@corpusavesticum
\DeclareOption{CorpusAvesticum}{\@corpusavesticumtrue}%
\DeclareOption{localbibfile}{\ClassWarning{brill}{%
   The option `localbibfile` is no longer supported.\MessageBreak
   Please use \string\addbibresource{}\space directly.}}      
\newif{\if@showgrid}
\DeclareOption{showgrid}{\@showgridtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ExecuteOptions{CorpusAvesticum}
\ProcessOptions*\relax
\RequirePackage{iftex}
\RequireLuaTeX
\LoadClass[%
   captions=nooneline,%
   captions=tableabove,
   chapterprefix,%
   headings=optiontohead,
   listof=leveldown,%
   open=any,%
   toc=bibliography,%
   toc=numberline,%
]{scrbook}[2018/03/30]
\def\normalsize{%
  \@setfontsize\normalsize{11bp}{13.2bp}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}%
\def\small{%
  \@setfontsize\small{10bp}{13.2bp}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
    \topsep 4\p@ \@plus2\p@ \@minus2\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}%
\def\footnotesize{%
  \@setfontsize\footnotesize{9bp}{11bp}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
    \topsep 3\p@ \@plus\p@ \@minus\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}%
\def\large{\@setfontsize\large{13bp}{13bp}}%
\def\LARGE{\@setfontsize\LARGE{16bp}{20bp}}%
\normalsize%
\RequirePackage{luatex85}
\RequirePackage{fontspec}
\RequirePackage[french,ngerman,italian,spanish,main=british]{babel}
\defaultfontfeatures{Ligatures={TeX,Common,NoRare}}
\setmainfont{Brill}
\RequirePackage{realscripts}
%%%\setmonofont[Scale=MatchLowercase]{Noto Sans Mono}
\RequirePackage[driver=none]{geometry}
\geometry{%
   paperwidth=155truemm,paperheight=235truemm,
   top=19.75truemm,headsep=4.75truemm,
   inner=20truemm,outer=20truemm,
   lines=40
}
\RequirePackage[a4,center,frame]{crop}
\RequirePackage[%
   final,%
   tracking=smallcaps,%
   expansion=alltext,%
   protrusion=true%
   ]{microtype}%
\SetTracking{encoding=*,shape=sc}{50}%
\RequirePackage[english]{selnolig}
\RequirePackage{etoolbox}
\RequirePackage[autostyle,english=british]{csquotes}
\RequirePackage[%
   backend=biber,%
   style=muya,%
   maxcitenames=3,%
   maxbibnames=99,%
   doi=false]%
{biblatex}
\RequirePackage[automark,markcase=lower]{scrlayer-scrpage}
\automark[chapter]{chapter}
\renewcommand*{\chaptermarkformat}{}
\clearpairofpagestyles
\rehead{%
   \ifboolexpr { bool {@mainmatter} 
      and test {\ifnumcomp{\value{chapter}}{>}{0}}}%
      {\MakeMarkcase{\chapapp}\ \thechapter\autodot}%
      {\headmark}%
}%
\lohead{\headmark}
\ohead{\pagemark}
\pagestyle{scrheadings}
\setkomafont{pagehead}{\normalfont\small\scshape}

\if@corpusavesticum
   \AtEndOfClass{%
      \InputIfFileExists{CorpusAvesticum.tex}%
         {\ClassInfo{brill}{Successfully loaded configuration file 
         ``CorpusAvesticum.tex''}%
         }%
         {\ClassWarning{brill}{Could not find configuration file 
         ``CorpusAvesticum.tex''!}%
         }%
   }%
\fi%   
%%%\RequirePackage{fnpct}
\RequirePackage{refcount}
\newlength{\fnlabelsep}
\newcounter{changeToTenI}
\newcounter{changeToTenII}
\newcounter{changeToTenIII}
\newcounter{changeToTenIV}
\newcounter{changeToTenV}
\newcounter{changeToTenVI}
\newcounter{changeToTenVII}
\newcounter{changeToTenVIII}
\newcounter{changeToTenIX}
\newcounter{changeToHundredI}
\newcounter{changeToHundredII}
\newcounter{changeToHundredIII}
\newcounter{changeToHundredIV}
\newcounter{changeToHundredV}
\newcounter{changeToHundredVI}
\newcounter{changeToHundredVII}
\newcounter{changeToHundredVIII}
\newcounter{changeToHundredIX}
\newcommand\actcounterT{}
\newcommand\actcounterH{}
\newcounter{chaptercount}
\newcounter{testcounter}
%%%\RequirePackage{bigfoot}
\let\ORIG@footnote\footnote
\renewcommand{\footnote}[2][]{%
     \ifnum\value{footnote}=0%
        \global\stepcounter{chaptercount}%
        \ifcase\thechaptercount
         \or %
             \renewcommand\actcounterT{changeToTenI}%
             \renewcommand\actcounterH{changeToHundredI}%
         \or %
             \renewcommand\actcounterT{changeToTenII}%
             \renewcommand\actcounterH{changeToHundredII}%
         \or %
             \renewcommand\actcounterT{changeToTenIII}%
             \renewcommand\actcounterH{changeToHundredIII}%
         \or%
             \renewcommand\actcounterT{changeToTenIV}%
             \renewcommand\actcounterH{changeToHundredIV}%
         \or%
             \renewcommand\actcounterT{changeToTenV}%
             \renewcommand\actcounterH{changeToHundredV}%
         \or%
             \renewcommand\actcounterT{changeToTenVI}%
             \renewcommand\actcounterH{changeToHundredVI}%
         \or%
             \renewcommand\actcounterT{changeToTenVII}%
             \renewcommand\actcounterH{changeToHundredVII}%
         \or%
             \renewcommand\actcounterT{changeToTenVIII}%
             \renewcommand\actcounterH{changeToHundredVIII}
         \or%    
            \renewcommand\actcounterT{changeToTenIX}%
             \renewcommand\actcounterH{changeToHundredIX}%
         \else%
        \fi%
     \fi%
     \ifnum\value{footnote}=99%
        \protected@write\@auxout{}%
           {\string\global%
                \string\setcounter{\actcounterH}{\thepage}%
           }%
     \fi% 
     \ifnum\value{footnote}=9%
        \protected@write\@auxout{}%
           {\string\global\string\setcounter{\actcounterT}{\thepage}}%
     \fi%
     \setcounter{testcounter}{\value{footnote}}%
     \stepcounter{testcounter}%
     \ifnum\value{footnote}<99%
        \ifnum\value{footnote}<9%
           \ifnum 
           \getpagerefnumber{footnote\thechaptercount\thetestcounter}=\value{\actcounterT}%
              \setlength{\fnlabelsep}{2\normalparindent}%
           \else%
              \setlength{\fnlabelsep}{\normalparindent}%
           \fi%
        \else%11-99
           \ifnum 
           \getpagerefnumber{footnote\thechaptercount\thetestcounter}=\value{\actcounterH}%
              \setlength{\fnlabelsep}{3\normalparindent}%
           \else%
              \setlength{\fnlabelsep}{2\normalparindent}%
           \fi%
       \fi%
  \else%
      \setlength{\fnlabelsep}{3\normalparindent}%
  \fi%
  %%\deffootnote{\fnlabelsep}{\fnlabelsep}{\makebox[\fnlabelsep][l]{\thefootnotemark}}%
  \protect\ORIG@footnote{\label{footnote\thechaptercount\thefootnote}#2}%
}%


\renewcommand*{\partheadstartvskip}{\null\vfill}
\renewcommand*{\partheadmidvskip}{%
   \par\nobreak\vskip 0pt%
}%
\renewcommand*{\partheadendvskip}{%
   \par\nobreak\vskip -\baselineskip%
   \null\hfill\sigbreakvarone\hfill\null%
   \par\nobreak\vskip 19\baselineskip\null\cleardoubleoddemptypage
}%
\newlength{\@tocstartindent}
\providecommand{\totalchapters}{0}
\AfterEndPreamble{\setlength{\@tocstartindent}{%
   \ifnumless{\numexpr\totalchapters\relax}{10}{4mm}{8mm}}}

\RedeclareSectionCommand[%
   innerskip=0pt,
   font={\LARGE\bfseries\itshape},
   prefixfont={\LARGE\bfseries\scshape},
   tocnumwidth=0pt,
   tocindent=0pt
   ]{part}

\renewcommand{\partlineswithprefixformat}[3]{%
   \MakeLowercase{#2}\enspace#3%
}
\renewcommand*{\thepart}{\arabic{part}}
\renewcommand*{\partformat}{\partname\enskip\thepart\autodot}
%\renewcommand*{\addparttocentry}[2]{%
%   \addtocentrydefault{part}{\hspace*{12mm}\partname~#1}{#2}}%
\DeclareRobustCommand*\DefLowercaseString{%
  \gdef\LowercaseString
}
 
\renewcommand*{\addparttocentry}[2]{%
   \MakeLowercase{\DefLowercaseString{\partformat}}
   \addtocentrydefault{part}{}{%
      \hspace*{12mm}%
      \large\bfseries%
      \scshape\LowercaseString%
      \newline%
      \upshape\itshape #2%
   }%
}
\newlength{\@chapterheight}
\patchcmd[]{\scr@@makechapterhead}{\chapterheadstartvskip}{%
   \settoheight{\@chapterheight}{%
      \parbox[b]{\textwidth}{%
         \normalfont\usekomafont{disposition}{%
            \usekomafont{chapter}{%
               #2%
            }%
         }%
      }%
   }%
   \ifdimless{\@chapterheight}{15pt}{%
      \setlength{\@addchapterheight}{0bp}%
   }{%
      \setlength{\@addchapterheight}{6.4bp}%
   }%
   \chapterheadstartvskip%
}{}{}%

%\patchcmd[]{\scr@@makeschapterhead}{\chapterheadstartvskip}{%
%   \chapterheadstartvskip%
%   \vskip -.5\baselineskip%
%}{}{}%

\newlength{\@addchaptertocskip}
\newlength{\@addchapterheight}
\RedeclareSectionCommand[%
   beforeskip=-1sp,%
   afterskip={\dimexpr 2\baselineskip+\@addchapterheight\relax},
   innerskip=.5\baselineskip,
   font={\LARGE\bfseries},
   prefixfont=\normalsize\mdseries\scshape,
   tocnumwidth=\dimexpr\@tocstartindent\relax,
   tocindent=0pt,
   tocbeforeskip=\dimexpr\@addchaptertocskip\relax,
   ]{chapter}

\renewcommand*{\chapterformat}{%
  \hspace*{3\normalparindent}\chapappifchapterprefix\enspace\thechapter\autodot%
}%

\renewcommand\chapterlineswithprefixformat[3]{%
  \ifstrempty{#2}
   {{%
      \usekomafont{#1prefix}{\strut%
         \setlength{\@tempskipa}{\csname scr@#1@innerskip\endcsname}%
         \addtolength{\@tempskipa}{-2\baselineskip}%
         \chapterheadmidvskip%
      }%
   }}%
   {\MakeLowercase{#2}}%
   #3%
}%

\newcommand{\introduction}[1]{%
   {%
    \renewcommand*{\chapterformat}{\hspace*{3\normalparindent}\introductionname}%
    \ifnum\value{chapter}=0
      \renewcommand*{\scr@chapter@innerskip}{6.4bp}%
    \fi%
    \addchap{#1}%
   }%
}%   

\RedeclareSectionCommand[%
   beforeskip=-2\baselineskip,
   afterskip=1\baselineskip,
   font={\normalsize\bfseries},
   tocnumwidth=8mm,
   tocindent=\dimexpr\@tocstartindent\relax
]{section}
\renewcommand{\thesection}{\arabic{section}}

\RedeclareSectionCommand[%
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\normalsize\bfseries\itshape},
   tocnumwidth=8mm,
   tocindent=\dimexpr\@tocstartindent+8mm\relax
]{subsection}
%%\renewcommand{\thesection}{\arabic{section}}

\RedeclareSectionCommand[%
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\normalsize},
   tocnumwidth=8mm,
   tocindent=\dimexpr\@tocstartindent+16mm\relax
]{subsubsection}

\ProvideSectionCommand[%
   style=section,
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\normalsize\itshape},
   indent=0pt,
   level=4,
   tocindent=0pt,%%%TODO
   tocnumwidth=6\parindent,
   tocstyle=section,
   counterwithin=subsubsection,
]{subthreesection}
\renewcommand{\thesubthreesection}{\thesubsubsection.\arabic{subthreesection}}

\ProvideSectionCommand[%
   style=section,
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\small},
   indent=0pt,
   level=5,
   tocindent=0pt,%%%TODO
   tocnumwidth=7\parindent,
   tocstyle=section,
   counterwithin=subthreesection,
]{subfoursection}
\renewcommand{\thesubfoursection}{\thesubthreesection.\arabic{subfoursection}}

\ProvideSectionCommand[%
   style=section,
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\small\itshape},
   indent=0pt,
   level=6,
   tocindent=0pt,%%%TODO
   tocnumwidth=8\parindent,
   tocstyle=section,
   counterwithin=subfoursection,
]{subfivesection}
\renewcommand{\thesubfivesection}{\thesubfoursection.\arabic{subfivesection}}

\RedeclareSectionCommand[%
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\small},
   indent=0pt,
   level=7,
   tocindent=0pt,%%%TODO
   tocnumwidth=9\parindent,
   counterwithin=subfivesection,
]{paragraph}
\renewcommand{\theparagraph}{\thesubfivesection.\arabic{paragraph}}

\RedeclareSectionCommand[%
   beforeskip=-1\baselineskip,
   afterskip=1sp,
   font={\small\itshape},
   indent=0pt,
   level=8,
   tocindent=0pt,%%%TODO
   tocnumwidth=10\parindent,
]{subparagraph}
%%%\renewcommand{\theparagraph}{\thesubsixsection.\arabic{paragraph}}

\renewcommand{\sectionlinesformat}[4]{%
   \ifstr{#1}{section}{%
      \makebox[12mm][l]{\upshape #3}%
   }{%
      \ifstr{#1}{subsection}{%
         \makebox[12mm][l]{\upshape #3}%
      }{%
         \ifstr{#1}{subsubsection}{%
            \makebox[16mm][l]{\upshape #3}%
         }{%
            \ifstr{#1}{subthreesection}{%
               \makebox[16mm][l]{\upshape #3}%
            }{%
               \ifstr{#1}{subfoursection}{%
                  \makebox[20mm][l]{\upshape #3}%   
               }{%
                  \ifstr{#1}{subfivesection}{%
                     \makebox[20mm][l]{\upshape #3}%
                  }{%
                     \ifstr{#1}{paragraph}{%
                        \makebox[24mm][l]{\upshape #3}%
                     }{%
                        \ifstr{#1}{subparagraph}{%
                           \makebox[24mm][l]{\upshape #3}%
                        }{}%
                     }%
                  }%
               }% 
            }%       
         }%
      }%
   }%
   #4%
}%

\newcommand\tocpageseparator{\unskip\hspace{2em}}
\newcommand\tocpagenumberbox[1]{\mbox{#1}}%
\RedeclareSectionCommands[%
   tocraggedpagenumber,%
   toclinefill=\tocpageseparator,
   tocpagenumberbox=\tocpagenumberbox,
   %%beforeskip=0pt
   ]{part,chapter,section,subsection,subsubsection}
\RedeclareSectionCommands[%
   tocpagenumberbox={\@gobble}
   ]{part}
%   tocbreakafternumber=true,
%   tocentryformat=\large\bfseries\scshape
%   ]{part}
%%\RedeclareSectionCommands[
%%   toconstartsamelevel=\vspace{0pt},%
%%   toconstartlowerlevel=\vspace{\baselineskip}]{chapter}
\RedeclareSectionCommands[tocentrynumberformat=\upshape,tocentryformat=\itshape]{subsection}

\setcounter{secnumdepth}{8}
\setcounter{tocdepth}{3}
\setkomafont{disposition}{\normalcolor\normalfont}
\addtokomafont{pagenumber}{\addfontfeatures{Numbers=Lining}\scshape}
\addtokomafont{chapterentry}{\bfseries}
\addtokomafont{chapterentrypagenumber}{\mdseries\addfontfeatures{Numbers=Lining}\scshape}
\addtokomafont{footnotelabel}{\addfontfeatures{Numbers=Tabular}}%
%\addtokomafont{footnotereference}{\addfontfeatures{VerticalPosition=Superior}}
\setfootnoterule[.25pt]{16mm}
\deffootnote[\fnlabelsep]{\fnlabelsep}{\normalparindent}{\makebox[\fnlabelsep][l]{\thefootnotemark}}%
\newlength{\normalparindent}
\AtBeginDocument{\setlength{\normalparindent}{\parindent}}
%%%\deffootnote[1.25em]{1.25em}{1.25em}{\makebox[1.25em][r]{\thefootnotemark}\
%% }
%%\deffootnotemark{\thefootnotemark}

%%%\recalctypearea

\RequirePackage{enumitem}
\setlist{labelsep=*,align=left,nosep}
\setlist[enumerate,1]{leftmargin=2\parindent}
\setlist[itemize]{leftmargin=\parindent,label=\textendash}
%%\setlist[itemize,2]{leftmargin=\parindent,label=\textendash}

\RequirePackage[cmyk,x11names,table,hyperref]{xcolor}
\RequirePackage[newcommands]{ragged2e}
\RequirePackage{array}
\newcolumntype{L}{>{\raggedright}X}
\newcolumntype{C}{>{\centering}X}
\newcolumntype{R}{>{\raggedleft}X}
%%%\newcolumntype{d}{S}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{ltablex}
\RequirePackage{booktabs}
\RequirePackage[flushleft]{threeparttable}
\patchcmd{\bottomrule}{\heavyrulewidth}{\lightrulewidth}%
   {\ClassInfo{brill}{\string\bottomrule\space successfully patched!}}%
   {\ClassInfo{brill}{\string\bottomrule\space could not be patched!}}%
\setlength{\heavyrulewidth}{0.6pt}%
\setlength{\lightrulewidth}{0.3pt}%
\let\origtable\table
\let\endorigtable\endtable
\renewenvironment{table}[1][tbp]{%
   \expandafter\origtable\expandafter[#1]%
}{%
   \endorigtable
}

\RequirePackage{keyval}
\RequirePackage{environ}
\newif\if@tablebgscreen
\define@key{brill}{bgscreen}[true]{\@tablebgscreentrue}%
\define@key{brill}{caption}{\def\@tablecaption{#1}}%
\define@key{brill}{fontsize}{\def\@tablefontsize{#1}}%
\define@key{brill}{headers}{\def\@tableheaders{#1}}%
\define@key{brill}{label}{\def\@tablelabel{#1}}%
\define@key{brill}{orientation}{\def\@tableorientation{#1}}%
\define@key{brill}{placement}{\def\@tableplacement{#1}}%
\define@key{brill}{shortcaption}{\def\@tableshortcaption{#1}}%
\define@key{brill}{width}{\def\@tablewidth{#1}}%
\newif\if@firstitem
\NewEnviron{brilltable}[2][]{%
   \setkeys{brill}{%
      fontsize=\normalsize,%
      orientation=portrait,%
      placement={},
      #1}% Set default and updated keys
   \begin{table}[\@tableplacement]
   \addfontfeatures{Numbers=Tabular}
   \@tablefontsize
   \ifdefvoid{\@tablecaption}{}{%
      \caption{\@tablecaption}%
      \ifdefvoid{\@tablelabel}{}{\label{\@tablelabel}}%
   }%
   \if@tablebgscreen
      \rowcolors{1}{white}{black!10}%
   \fi%
   \begin{tabularx}{\textwidth}{#2}
      \toprule
      \hiderowcolors
      \ifdefvoid{\@tableheaders}{}{%
         \@tableheaders%
         \midrule
      }%
      \showrowcolors
      \BODY%
      \bottomrule
   \end{tabularx}
   \end{table}
}

\newcommand*{\tabhead}[2][\@tablefontsize]{\bfseries #1}
\setkomafont{captionlabel}{\normalfont\footnotesize\scshape}
\setkomafont{caption}{\normalfont\footnotesize}
\setcapindent{16mm}
\newlength{\@currentcaplabelwidth}
\renewcommand*{\captionformat}{%
   \ifstr{\@captype}{figure}
      {\settowidth{\@currentcaplabelwidth}{\figureformat}}%
      {\settowidth{\@currentcaplabelwidth}{\tableformat}}%
   \hspace{\dimexpr 16mm-\@currentcaplabelwidth\relax}}
\renewcommand*{\figureformat}{\MakeLowercase{\figurename}~\thefigure\autodot}
\renewcommand*{\tableformat}{\MakeLowercase{\tablename}~\thetable\autodot}
\renewcaptionname{british}{\listtablename}{Tables}
\renewcaptionname{british}{\listfigurename}{Figures}
\providecaptionname{british}{\listfiguretablename}{List of Figures and Tables}
\providecaptionname{british}{\introductionname}{Introduction}
%TODO: TOC adjustments
\newcommand{\listoffigurestables}{%
   \addchap*{Figures and Tables}
   \addchaptertocentry{}{\listfiguretablename}
   \listoffigures
   \listoftables
}
\RequirePackage{imakeidx}
\indexsetup{%
   %headers={\textls*[50]{\MakeMarkcase{\indexname}}}{\textls*[50]{\MakeMarkcase{\indexname}}},
   othercode={\RaggedRight\footnotesize}}%
\renewcommand{\@idxitem}{\par\hangindent 2\normalparindent}%
\renewcommand{\subitem}{\par\hangindent 2\normalparindent\hspace*{\parindent}}%
\renewcommand*\indexspace{%
  \par \vskip \baselineskip\relax
}%

\if@showgrid
\RequirePackage{atbegshi,picture,xcolor}
\AtBeginShipout{%
  \AtBeginShipoutUpperLeft{%
    \color{red}%
    \put(\dimexpr 1in+\oddsidemargin,
         -\dimexpr 1in+\topmargin+\headheight+\headsep+\topskip)%
      {%
       \vtop to\dimexpr\vsize+\baselineskip{
         \hrule
         \leaders\vbox to\baselineskip{\hrule width\hsize\vfill}\vfill
       }%
      }%
  }%
}
\fi%

\RequirePackage{url}
\urlstyle{same}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}
\RequirePackage[nomain,abbreviations,toc,numberline,nonumberlist]{glossaries-extra}

\makeglossaries

\setabbreviationstyle{short}
\renewcommand{\glsnamefont}[1]{\normalfont\mdseries #1}

\RequirePackage{cleveref}

%%\renewcaptionname{british}{\acronymname}{Abbreviations}
\appto\captionsbritish{%
   \renewcommand*{\abbreviationsname}{Abbreviations}%
}
\newcommand{\altering}{\rowcolors{1}{white}{gray!10}}

\newcommand{\sigbreakvarone}{%
   \par\nobreak\vspace{\baselineskip}%
   {\noindent\ignorespaces%
    \normalfont\fontsize{24bp}{13.2bp}\selectfont%
    \null\hfill\char"2235\hfill\null}%
   \par\nobreak\vspace{\baselineskip}%
}%
\newcommand{\sigbreakvartwo}{%
   \par\nobreak\vspace{\baselineskip}%
   {\noindent\ignorespaces%%
    \normalfont\fontsize{24bp}{13.2bp}\selectfont%
    \null\hfill\char"2026\hfill\null}%
   \par\nobreak\vspace{\baselineskip}%
}%

\def\useignorespacesandallpars#1\ignorespaces\fi{%
#1\fi\ignorespacesandallpars}

\def\ignorespacesandallpars{%
  \@ifnextchar\par
    {\expandafter\ignorespacesandallpars\@gobble}%
    {}%
}

\let\quote\@undefined
\let\endquote\@undefined
\newenvironment{quote}[1][]%
   {%
    \par\vspace{\baselineskip}%
    \addmargin[\parindent]{0pt}%
    \ignorespaces%
    \aftergroup\useignorespacesandallpars%
    \ifstrempty{#1}{}{\def\@source{#1}}
   }%
   {%
    \ifdef{\@source}{\\*\hspace*{2\parindent}\@source}{}%
    \endaddmargin%
    \par\vspace{\baselineskip}\noindent\ignorespaces%
   }%

\appto{\tableofcontents}{\cleardoubleoddemptypage}
\patchcmd{\frontmatter}{roman}{Roman}%
   {\ClassInfo{brill}{Macro \string\frontmatter\space patched!}}%
   {\ClassInfo{Macro \string\frontmatter\space NOT patched!}}%
\appto{\frontmatter}{\setcounter{page}{5}} 
\appto{\mainmatter}{%
   \addtocontents{toc}{\protect\addvspace{2\baselineskip}}%
   \addtocontents{toc}{\protect\setlength{\@addchaptertocskip}{1\baselineskip}}%
}   
\appto{\backmatter}{\cleardoubleoddemptypage}
\setlength{\parindent}{4mm}

\AtEndDocument{%
   \immediate\write\@auxout%
      {\string\numgdef{\string\totalchapters}{\thechapter}}%
}%
\toks0{\ifvoid\footins\else\suppressfloats[b]\fi}
\output\expandafter{\the\toks0\the\output}
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\displaywidowpenalty=10000
\clubpenalty=5000
\interfootnotelinepenalty=9999
\brokenpenalty=2000
\vfuzz \hfuzz
\endinput
