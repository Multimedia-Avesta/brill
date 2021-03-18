%% brill.cls
%% Copyright 2018-2021 Martin Sievers
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Martin Sievers
%
% This work consists of the files 
% brill.cls
% CorpusAvesticum.tex
% muya.bbx
% muya.cbx
% muya.dbx
% muya.lua
% xindex-brill.lua
% xindex-muya.lua
% xindex-muyaPassages.lua
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brill}[2021/01/26 v0.76.0 A template for Brill publications]
\RequirePackage{iftex}
\RequirePackage{kvoptions}
\SetupKeyvalOptions {
   family  = brill,
   prefix  = brill@,
   setkeys = \kvsetkeys
}
\DeclareStringOption{series}
\DeclareStringOption[dot]{enumsep}[dot]
\DeclareStringOption[dot]{alphenumsep}[dot]
\DeclareStringOption[3]{tocdepth}[3]
%%%
\DeclareBoolOption[false]{showgrid}
\DeclareBoolOption[false]{gitver}
\DeclareComplementaryOption{nogitver}{gitver}
\DeclareBoolOption[false]{PhD}
\DeclareBoolOption[false]{countwords}
\DeclareBoolOption[false]{printversion}
\DeclareBoolOption[false]{colorlinks}
%%

\DeclareVoidOption{CorpusAvesticum}{\setkeys{brill}{series=CorpusAvesticum}}
\DeclareVoidOption{enumdot}{\setkeys{brill}{enumsep=dot}}
\DeclareVoidOption{enumenclparen}{\setkeys{brill}{enumsep=enclparen}}
\DeclareVoidOption{enumparen}{\setkeys{brill}{enumsep=paren}}
\DeclareVoidOption{enumspace}{\setkeys{brill}{enumsep=space}}
\DeclareVoidOption{alphenumdot}{\setkeys{brill}{alphenumsep=dot}}
\DeclareVoidOption{alphenumenclparen}{\setkeys{brill}{alphenumsep=enclparen}}
\DeclareVoidOption{alphenumparen}{\setkeys{brill}{alphenumsep=paren}}
\DeclareVoidOption{alphenumspace}{\setkeys{brill}{alphenumsep=space}}
\DeclareVoidOption{colourlinks}{\setkeys{brill}{colorlinks=true}}

\DeclareDefaultOption{%
   \expandafter\PassOptionsToClass\expandafter\CurrentOption{scrbook}%
}
\ProcessKeyvalOptions*
\ifbrill@PhD
   \PassOptionsToClass{twoside=false}{scrbook}
\else
   \PassOptionsToClass{twoside=true}{scrbook}
\fi%   
\RequireLuaTeX
\LoadClass[%
   parskip=never,%
   captions=nooneline,%
   captions=tableabove,%
   captions=bottombeside,%
   captions=rightbeside,%
   appendixprefix,%
   chapterprefix,%
   listof=leveldown,%
   listof=nochaptergap,%
   open=any,%TODO: right?
   toc=bibliography,%
   toc=numberline,%
   numbers=noenddot,%
   headings=optiontoheadandtoc,%
]{scrbook}[2018/03/30]
\ifbrill@PhD
   \def\normalsize{%
     \@setfontsize\normalsize{12bp}{18bp}%
     \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
     \abovedisplayshortskip \z@ \@plus3\p@
     \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
     \belowdisplayskip \abovedisplayskip
     \let\@listi\@listI
   }%
   \def\small{%
     \@setfontsize\small{11bp}{13.2bp}%
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
   \def\scriptsize{\@setfontsize\scriptsize{8bp}{9.5bp}}%
   \def\tiny{\@setfontsize\tiny{6bp}{7bp}}%
   \def\large{\@setfontsize\large{14bp}{14bp}}%
   \def\LARGE{\@setfontsize\LARGE{17bp}{20bp}}%
\else
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
   \def\scriptsize{\@setfontsize\scriptsize{8bp}{9.5bp}}%
   \def\tiny{\@setfontsize\tiny{6bp}{7bp}}%
   \def\large{\@setfontsize\large{13bp}{13bp}}%
   \def\LARGE{\@setfontsize\LARGE{16bp}{20bp}}%
\fi%
\KOMAoptions{parskip=never}
\normalsize%
\RequirePackage{luatex85}
\RequirePackage{fontspec}
\RequirePackage[%
   dutch,%
   french,%
   italian,%
   latin,%
   ngerman,%
   russian,%
   spanish,%
   main=british]{babel}
%%% We define some babel shortcuts, which are available for ngerman for British as well.
\initiate@active@char{"}
\addto\extrasbritish{\languageshorthands{british}\bbl@activate{"}}
\addto\noextrasbritish{\bbl@deactivate{"}}
\declare@shorthand{british}{"-}{\nobreak\-\bbl@allowhyphens}
\declare@shorthand{british}{"|}{%
   \textormath{\penalty\@M\discretionary{-}{}{\kern.03em}%
      \allowhyphens}{}}
\declare@shorthand{british}{""}{\hskip\z@skip}
\declare@shorthand{british}{"~}{\textormath{\leavevmode\hbox{-}}{-}}
\declare@shorthand{british}{"=}{\penalty\@M-\hskip\z@skip}
\newenvironment{nohyphens}
   {%
      \hyphenrules{nohyphenation}%
      \hyphenpenalty=\@M%
      \exhyphenpenalty=\@M%
   }%
   {%
      \endhyphenrules%
   }%
%\directlua{
%   fonts.handlers.otf.addfeature {
%      name = "thetasubst",
%      type = "substitution",
%      data = {
%         theta = "uni03d1",
%      },
%   }
%}
%\patchcmd{\realsuperscript}{\addfontfeature{VerticalPosition=Superior}}%
%   {\addfontfeature{VerticalPosition=Superior,RawFeature={+moresups}}}%
%   {}%
%   {\ClassWarning{brill}{Patch of realsuperscript failed}}
\defaultfontfeatures{Ligatures={TeX}}
% Uses proportional oldstyle numbers by default
%\setmainfont{Brill}[RawFeature={+ktest+thetasubst},SmallCapsFeatures = {RawFeature=+c2sc}]
\setmainfont{Brill}[%
   Ligatures         = {Common,NoRare},%
   SmallCapsFeatures = {RawFeature=+c2sc},%
   Renderer          = Node,%
]
\newfontfamily{\trackingfont}{Brill}
[%
   Ligatures      = {NoCommon,NoRare},%
   WordSpace      = {1.35,1.45,1.55},%
   LetterSpace    = 12.5,%
   Renderer       = Node,%
]%

\newrobustcmd*{\nosmallcaps}{\addfontfeatures{SmallCapsFeatures={RawFeature={-smcp;-c2sc}}}}
\newcommand*{\@morewordspace}{\spaceskip=2\fontdimen2\font plus 2\fontdimen3\font minus \fontdimen4\font}
\newrobustcmd*{\texttracking}[1]{{\trackingfont #1}}%
\newrobustcmd*{\texttrackingL}[1]{\ifhmode\unskip\fi{\trackingfont\ #1}}%
\newrobustcmd*{\texttrackingR}[1]{{\trackingfont #1\ }\ignorespaces}%
\newrobustcmd*{\texttrackingLR}[1]{%
   \ifhmode\unskip\fi%
   {\trackingfont\ #1\ }\ignorespaces%
}%   
\RequirePackage{realscripts}
%
\ifbrill@PhD
   \RequirePackage{geometry}
   \geometry{%
      a4paper,twoside=false,includehead,%
      top=20truemm,bottom=20truemm,%
      headsep=5truemm,%
      left=40truemm,right=20truemm,%
      headheight=\baselineskip,
      heightrounded,%
   }
   \setlength{\footnotesep}{\baselineskip}
   \patchcmd[]{\footnoterule}%
      {\kern 2.6\p@}%
      {\kern \dimexpr 2.6\p@-\footnotesep+0.5\baselineskip\relax}%
      {\ClassWarningNoLine{brill}{Macro \string\footnoterule\space successfully patched}}%
      {\ClassError{brill}{Error when trying to patch macro \string\footnoterule}{}}
\else
   \RequirePackage[driver=none]{geometry}
   \geometry{%
      paperwidth=155truemm,paperheight=235truemm,%
      top=19.75truemm,headsep=4.75truemm,%
      inner=20truemm,outer=20truemm,%
      lines=40%
   }
   \ifbrill@printversion\else
      \RequirePackage[a4,center,frame]{crop}
   \fi%
\fi%
\RequirePackage{luatexbase}
\RequirePackage[%
   final,%
   babel,%
   tracking=smallcaps,%
   expansion=alltext,%
   protrusion=true,%
   verbose=true%
   ]{microtype}%
\SetTracking{encoding=*,shape=sc}{50}%
\RequirePackage[soul]{lua-ul}
\PreventPackageFromLoading{soul}
\RequirePackage[english]{selnolig}
\RequirePackage{etoolbox}
% In recent versions of KOMA-Script, macro \ifstr was renamed to \Ifstr
% We make sure, that this macro exists for older versions as well.
\ifundef{\Ifstr}{\let\Ifstr\ifstr}{}
\ifundef{\Ifisinteger}{\let\Ifisinteger\ifisinteger}{}
\RequirePackage[autostyle,english=british]{csquotes}
\RequirePackage[%
   backend=biber,%
   style=muya,%
   maxcitenames=3,%
   maxbibnames=99,%
   doi=false]%
{biblatex}

\newif\if@blockquotestar
\newif\if@blockcquotestar

\renewrobustcmd*{\blockquote}{%
   \@ifstar%
      {\SetCiteCommand{\cite}\@blockquotestartrue\csq@getcargs{\csq@bquote{}{}}}%
      {\SetCiteCommand{\footcite}\@blockquotestarfalse\csq@getcargs{\csq@bquote{}{}}}%
}
\renewrobustcmd*{\blockcquote}{%
   \@ifstar%
      {\SetCiteCommand{\cite}\@blockcquotestartrue\csq@getccargs{\csq@bquote{}{}}}%
      {\SetCiteCommand{\footcite}\@blockcquotestarfalse\csq@getccargs{\csq@bquote{}{}}}%
}

\renewcommand*{\mkcitation}[1]{%
   \if@blockquotestar
      \ifblockquote
         {%
            \par\nopagebreak%
            \hspace*{2\parindent}%
            \AtNextCite{\DeclareNameWrapperFormat{labelname}{\textsc{##1}}}%
            #1%
         }%
         {\ (#1)}%   
   \else
      #1%
   \fi%
}
\renewcommand*{\mkccitation}[1]{%
   \if@blockcquotestar
      \ifblockquote
         {%
            \par\nopagebreak%
            \hspace*{2\parindent}%
            \AtNextCite{\DeclareNameWrapperFormat{labelname}{\textsc{##1}}}%
            #1%
         }%
         {\ (#1)}%   
   \else
      #1%
   \fi%
}
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
%
\AtEndOfClass{%
   \ifx\brill@series\@empty
      \ClassWarning{brill}{No series option found.}%
   \else
      \InputIfFileExists{\brill@series.tex}%
         {\ClassInfo{brill}{Successfully loaded configuration file for series
         ``\brill@series''}%
         }%
         {\ClassWarning{brill}{Could not load file `\brill@series`.tex}}%
   \fi%
   % Now all glossaries have been defined. We can call \cs{makeglossaries}      
   % TODO: Call macro for _all_ configs; use config option or similar
   \makeglossaries
}
%\RequirePackage{noindentafter}
%% Fix for noindentafter (cf. https://tex.stackexchange.com/questions/514127/incompatibility-between-noindentafter-and-etoolbox-v2-5f)
%\expandafter\patchcmd\csname end \endcsname{%
%   \if@ignore\@ignorefalse\ignorespaces\fi%
%}{%
%   \if@ignore\@ignorefalse\ignorespaces\fi%
%   \csuse{@noindent@#1@hook}%
%}{\PackageInfo{noindentafter}{`\string\end' patched by fix in brill.cls}}{%
%   \PackageWarningNoLine{noindentafter}{%
%      Patching `\string\end' failed!\MessageBreak%
%      `\string\NoIndentAfter...' commands won't work%
%   }%
%}
\RequirePackage{xstring}
\RequirePackage{multicol}
\AtBeginEnvironment{multicols}{\raggedright}
%\AtEndEnvironment{multicols}{\setlength{\multicolsep}{0.9\normalbaselineskip}}
\setlength{\columnsep}{4mm}
\setlength{\premulticols}{4\normalbaselineskip}
\setlength{\postmulticols}{2\normalbaselineskip}
\setlength{\multicolsep}{\normalbaselineskip}
%\setlength{\multicolbaselineskip}{0bp}
%\raggedcolumns
\RequirePackage[savepos,abspage,user]{zref}
\newlength{\normalparindent}
\newlength{\fnlabelsep}
\AtBeginDocument{%
   \setlength{\normalparindent}{\parindent}%
   \setlength{\fnlabelsep}{\normalparindent}%
}
\newcommand\actcounterT{}
\newcommand\actcounterH{}
\newcounter{chaptercount}
\renewcommand{\thechaptercount}{\Roman{chaptercount}}
\newcounter{testcounter}
%%%\RequirePackage{bigfoot}
\let\ORIG@footnote\footnote
\renewcommand{\footnote}[2][]{%
   \ifnum\value{footnote}=0%
      \global\stepcounter{chaptercount}%
      \@ifundefined{c@changeToTen\thechaptercount}%
         {\expandafter\newcounter{changeToTen%
          \csname thechaptercount\endcsname}}%
         {}%
      \protected@write\@auxout{}%
         {%
            \string\@ifundefined{c@changeToTen\thechaptercount}%
            {\string\newcounter{\expandafter changeToTen%
             \csname thechaptercount\endcsname}%
            }%
            {}%
         }%  
      \@ifundefined{c@changeToHundred\thechaptercount}%
         {\expandafter\newcounter{changeToHundred%
          \csname thechaptercount\endcsname}%
         }%
         {}%
      \protected@write\@auxout{}%
         {%
            \string\@ifundefined{c@changeToHundred\thechaptercount}%
            {\string\newcounter{\expandafter changeToHundred%
             \csname thechaptercount\endcsname}%
            }%
            {}%
         }%
      \gdef\actcounterT{changeToTen\thechaptercount}%
      \gdef\actcounterH{changeToHundred\thechaptercount}%
   \fi%
   \setcounter{testcounter}{\value{footnote}}%
   \stepcounter{testcounter}%
   \ifnum\value{footnote}=99%
      \protected@write\@auxout{}%
         {\string\global\string\setcounter{\actcounterH}%
            {\zref@extract{footnote\thechaptercount\thetestcounter}{abspage}}%
         }%
   \fi% 
   \ifnum\value{footnote}=9%
      \protected@write\@auxout{}%
      {\string\global\string\setcounter{\actcounterT}%
         {\zref@extract{footnote\thechaptercount\thetestcounter}{abspage}}%
      }%
   \fi%
   \ifnum\value{footnote}<99%
      \ifnum\value{footnote}<9%
         \ifnumequal%
            {\zref@extract{footnote\thechaptercount\thetestcounter}{abspage}}%
            {\value{\actcounterT}}%
               {\setlength{\fnlabelsep}{2\normalparindent}}%
               {\setlength{\fnlabelsep}{\normalparindent}}%
      \else%10-98
         \ifnumequal%
            {\zref@extract{footnote\thechaptercount\thetestcounter}{abspage}}%
            {\value{\actcounterH}}%
               {\setlength{\fnlabelsep}{3\normalparindent}}%
               {\setlength{\fnlabelsep}{2\normalparindent}}%
      \fi%
   \else%>=99
      \setlength{\fnlabelsep}{3\normalparindent}%
   \fi%
   %%\deffootnote{\fnlabelsep}{\fnlabelsep}{\makebox[\fnlabelsep][l]{\thefootnotemark}}%
   \protect\ORIG@footnote{\zlabel{footnote\thechaptercount\thefootnote}#2}%
}%

\renewcommand*{\partheadstartvskip}{\null\vfill}
\renewcommand*{\partheadmidvskip}{%
   \par\nobreak\vskip\baselineskip%0pt%
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
   innerskip=0bp,%
   font={\LARGE\bfseries\upshape\itshape},%
   prefixfont={\LARGE\bfseries\scshape},%
   tocnumwidth=0bp,%
   tocindent=0bp%
]{part}

\renewcommand{\partlineswithprefixformat}[3]{%
   #2\enspace#3%
}
\renewcommand*{\thepart}{\arabic{part}}
\renewcommand*{\partformat}{\partname\enskip\thepart\autodot}
\renewcommand*{\addparttocentry}[2]{%
   \addtocentrydefault{part}{}{%
      \hspace*{12mm}%
      \large\bfseries%
      \scshape\partformat%
      \newline%
      \upshape\itshape #2%
   }%
}
%\newlength{\@chapterheight}
%\patchcmd[]{\scr@@makechapterhead}{\chapterheadendvskip}{%
%%   \settoheight{\@chapterheight}{%
%%      \parbox[b]{\textwidth}{%
%%         \normalfont\usekomafont{disposition}{%
%%            \usekomafont{chapter}{%
%%               #2%
%%            }%
%%         }%
%%      }%
%%   }%
%%   \ifdimless{\@chapterheight}{15pt}{%
%%      \setlength{\@addchapterheight}{0bp}%
%%   }{%
%%      \setlength{\@addchapterheight}{6.4bp}%
%%   }%
%   \par\kern-\prevdepth\vspace{0pt}%
%   \chapterheadendvskip%
%}{}{}%

\newlength{\@addchaptertocskip}
%\newlength{\@addchapterheight}
%\setlength{\@addchapterheight}{0pt}
\RedeclareSectionCommand[%
   beforeskip    = -1sp,%
%   afterskip={\dimexpr 2\baselineskip+\@addchapterheight\relax},%
   afterskip     = 2\baselineskip,%
   innerskip     = 0.5\baselineskip,%
   font          = \LARGE\bfseries,%
   prefixfont    = \normalfont\normalsize\mdseries%
                     \addfontfeatures{Numbers=Lining}\scshape,%
   tocnumwidth   = \dimexpr\@tocstartindent\relax,%
   tocindent     = 0bp,%
   tocbeforeskip = \dimexpr\@addchaptertocskip\relax,%
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
   {#2}#3%
}%
%TODO: \introduction should have an optional argument, p. 19
\newcommand{\introduction}[1]{%
   {%
    \renewcommand*{\chapterformat}{\hspace*{3\normalparindent}\introductionname}%
    \ifnum\value{chapter}=0
      \renewcommand*{\scr@chapter@innerskip}{6.4bp}%
    \fi%
    \addchap{#1}%
   }%
}%   

% We use different set-ups for headings depending on PhD or not
\ifbrill@PhD
   \RedeclareSectionCommand[%
      beforeskip=-2\baselineskip,%
      afterskip=1\baselineskip,%
      font={\normalsize\bfseries},%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent\relax%
   ]{section}
   \renewcommand*{\thesection}{\arabic{section}}

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\normalsize\bfseries},%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent+8mm\relax%
   ]{subsection}
   
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\normalsize\bfseries},%
      tocnumwidth=12mm,%
      tocindent=\dimexpr\@tocstartindent+16mm\relax%
   ]{subsubsection}
   
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\normalsize\bfseries},%
      indent=0bp,%
      level=4,%
      tocnumwidth=12mm,%
      tocindent=\dimexpr\@tocstartindent+28mm\relax,%
      tocstyle=section,%
      counterwithin=subsubsection%
   ]{subthreesection}
   \renewcommand*{\thesubthreesection}{\thesubsubsection.\arabic{subthreesection}}
   \@namedef{subthreesectiontocdepth}{4}
   
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\small\bfseries},%
      indent=0bp,%
      level=5,%
      tocindent=\dimexpr\@tocstartindent+40mm\relax,%
      tocnumwidth=16mm,%
      tocstyle=section,%
      counterwithin=subthreesection%
   ]{subfoursection}
   \renewcommand*{\thesubfoursection}{\thesubthreesection.\arabic{subfoursection}}
   \@namedef{subfoursectiontocdepth}{5}

   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\small\bfseries},%
      indent=0bp,%
      level=6,%
      tocindent=\dimexpr\@tocstartindent+56mm\relax,%
      tocnumwidth=16mm,%
      tocstyle=tocline,%
      counterwithin=subfoursection%
   ]{subfivesection}
   \renewcommand*{\thesubfivesection}{\thesubfoursection.\arabic{subfivesection}}
   \@namedef{subfivesectiontocdepth}{6}
   
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\small\bfseries},%
      indent=0bp,%
      level=7,%
      tocindent=0bp,%%%TODO
%      tocnumwidth=8mm,%
      counterwithin=subfivesection%
   ]{paragraph}
   \renewcommand*{\theparagraph}{\thesubfivesection.\arabic{paragraph}}
   \@namedef{paragraphtocdepth}{7}   

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\small\bfseries},%
      indent=0bp,%
      level=8,%
      tocindent=0bp,%%%TODO
%      tocnumwidth=10\parindent%
   ]{subparagraph}
   \@namedef{subparagraphsectiontocdepth}{8}
%
%   \RedeclareSectionCommands[tocdynnumwidth]{%
%      section,subsection,subsubsection,subthreesection,%
%      subfoursection,subfivesection,paragraph,subparagraph%
%   }   
\else%
   \RedeclareSectionCommand[%
      beforeskip=-2\baselineskip,%
      afterskip=1\baselineskip,%
      font={\normalsize\bfseries},%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent\relax,%
   ]{section}
   \renewcommand*{\thesection}{\arabic{section}}
   %
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize\bfseries\itshape},%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent+8mm\relax,%
      tocentryformat=\itshape,%
      tocentrynumberformat=\@tocentrynumberfont%
   ]{subsection}
   %
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize\bfseries\itshape},%
      indent=0bp,%
      level=2,%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent+8mm\relax,%
      tocentryformat=\itshape,%
      tocentrynumberformat=\@tocentrynumberfont%
   ]{subsectionnumeral}
   \@namedef{subsectionnumeraltocdepth}{2}
   %
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize},%
      tocnumwidth=12mm,%
      tocindent=\dimexpr\@tocstartindent+16mm\relax,%
   ]{subsubsection}
   %
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize\itshape},%
      indent=0bp,%
      level=4,%
      tocindent=0bp,%%%TODO
      tocnumwidth=6\parindent,%
      tocstyle=section,%
      counterwithin=subsubsection,%
   ]{subthreesection}
   \renewcommand*{\thesubthreesection}{\thesubsubsection.\arabic{subthreesection}}
   \@namedef{subthreesectiontocdepth}{4}

   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small},%
      indent=0bp,%
      level=5,%
      tocindent=0bp,%%%TODO
      tocnumwidth=7\parindent,%
      tocstyle=section,%
      counterwithin=subthreesection,%
   ]{subfoursection}
   \renewcommand*{\thesubfoursection}{\thesubthreesection.\arabic{subfoursection}}
   \@namedef{subfoursectiontocdepth}{5}
   
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small\itshape},%
      indent=0bp,%
      level=6,%
      tocindent=0bp,%%%TODO
      tocnumwidth=8\parindent,%
      tocstyle=section,%
      counterwithin=subfoursection,%
   ]{subfivesection}
   \renewcommand*{\thesubfivesection}{\thesubfoursection.\arabic{subfivesection}}
   \@namedef{subfivesectiontocdepth}{6}

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small},%
      indent=0bp,%
      level=7,%
      tocindent=0bp,%%%TODO
      tocnumwidth=9\parindent,%
      counterwithin=subfivesection,%
   ]{paragraph}
   \renewcommand*{\theparagraph}{\thesubfivesection.\arabic{paragraph}}
   \@namedef{paragraphsectiontocdepth}{7}

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small\itshape},%
      indent=0bp,%
      level=8,%
      tocindent=0bp,%%%TODO
      tocnumwidth=10\parindent,%
   ]{subparagraph}
   \@namedef{subparagraphsectiontocdepth}{8}
\fi%
\@namedef{maxtocdepth}{8}
\ifbrill@PhD
   \renewcommand{\sectionlinesformat}[4]{%
      \Ifnumbered{#1}
      {%
         \Ifstr{#1}{section}{%
            {\makebox[12mm][l]{\upshape #3}}%
         }{%
            \Ifstr{#1}{subsection}{%
               \makebox[12mm][l]{\upshape #3}%
            }{%
               \Ifstr{#1}{subsubsection}{%
                  \makebox[16mm][l]{\upshape #3}%
               }{%
                  \Ifstr{#1}{subthreesection}{%
                     \makebox[16mm][l]{\upshape #3}%
                  }{%
                     \Ifstr{#1}{subfoursection}{%
                        \makebox[20mm][l]{\upshape #3}%   
                     }{%
                        \Ifstr{#1}{subfivesection}{%
                           \makebox[20mm][l]{\upshape #3}%
                        }{%
                           \Ifstr{#1}{paragraph}{%
                              \makebox[24mm][l]{\upshape #3}%
                           }{%
                              \Ifstr{#1}{subparagraph}{%
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
      {\@hangfrom{\hskip #2#3}{#4}}%
   }%
\else% for Brill book
   \renewcommand{\sectionlinesformat}[4]{%
      \Ifstr{#1}{section}{%
         \@hangfrom{\makebox[12mm][l]{\upshape #3}}%
      }{%
         \Ifstr{#1}{subsection}{%
            \@hangfrom{\makebox[12mm][l]{\upshape #3}}%
         }{%
            \Ifstr{#1}{subsubsection}{%
               \@hangfrom{\makebox[16mm][l]{\upshape #3}}%
            }{%
               \Ifstr{#1}{subthreesection}{%
                  \@hangfrom{\makebox[16mm][l]{\upshape #3}}%
               }{%
                  \Ifstr{#1}{subfoursection}{%
                     \@hangfrom{\makebox[20mm][l]{\upshape #3}}%
                  }{%
                     \Ifstr{#1}{subfivesection}{%
                        \@hangfrom{\makebox[20mm][l]{\upshape #3}}%
                     }{%
                        \Ifstr{#1}{paragraph}{%
                           \@hangfrom{\makebox[24mm][l]{\upshape #3}}%
                        }{%
                           \Ifstr{#1}{subparagraph}{%
                              \@hangfrom{\makebox[24mm][l]{\upshape #3}}%
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
\fi%
\newcommand*{\@tocentrynumberfont}[1]{%
   {\normalfont\addfontfeature{Numbers=Tabular}#1}}
\newcommand*{\tocpageseparator}{\unskip\hspace{2em}}
\newcommand*{\tocpagenumberbox}[1]{\mbox{#1}}%
\RedeclareSectionCommands[%
   tocraggedpagenumber,%
   toclinefill=\tocpageseparator,%
   tocpagenumberbox=\tocpagenumberbox,%
   tocentrynumberformat=\@tocentrynumberfont,%
   ]{part,chapter,section,subsection,subsubsection}
\RedeclareSectionCommands[%
   tocpagenumberbox={\@gobble}%
   ]{part}

\renewcommand*{\@saddsec}[1]{%
   \edef\reserved@a{%
      \unexpanded{%
         \section*{#1}%
         \c@secnumdepth=
      }\the\c@secnumdepth\relax
   }%
   \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
   \reserved@a
   \addsecmark{}%
}

\newcommand{\addsubsec}{\secdef\@addsubsec\@saddsubsec}
\newcommand*{\@addsubsec}{}
\def\@addsubsec[#1]#2{%
  \edef\reserved@a{%
    \unexpanded{%
      \subsection[{#1}]{#2}%
      \c@secnumdepth=
    }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
  \reserved@a
}
\newcommand*{\@saddsubsec}[1]{%
  \edef\reserved@a{%
     \unexpanded{%
        \subsection*{#1}%
        \c@secnumdepth=
     }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
  \reserved@a
  \addsecmark{}%
}
%
\newcommand{\addsubsecnum}{\secdef\@addsubsecnum\@saddsubsecnum}
\newcommand*{\@addsubsecnum}{}
\def\@addsubsecnum[#1]#2{%
   \edef\reserved@a{%
      \unexpanded{%
         \subsectionnumeral[{#1}]{#2}%
         \c@secnumdepth=
      }\the\c@secnumdepth\relax
   }%
   \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
   \reserved@a
}
\newcommand*{\@saddsubsecnum}[1]{%
   \edef\reserved@a{%
      \unexpanded{%
         \subsectionnumeral*{#1}%
         \c@secnumdepth=
      }\the\c@secnumdepth\relax
   }%
   \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
   \reserved@a
   \addsecmark{}%
}
%
\newcommand{\addsubsubsec}{\secdef\@addsubsubsec\@saddsubsubsec}
\newcommand*{\@addsubsubsec}{}
\def\@addsubsubsec[#1]#2{%
  \edef\reserved@a{%
    \unexpanded{%
      \subsubsection[{#1}]{#2}%
      \c@secnumdepth=
    }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
  \reserved@a
}
\newcommand*{\@saddsubsubsec}[1]{%
   \edef\reserved@a{%
      \unexpanded{%
         \subsubsection*{#1}%
         \c@secnumdepth=
      }\the\c@secnumdepth\relax
   }%
   \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
   \reserved@a
   \addsecmark{}%
}
%
\newcommand*{\pagenumbertocfont}[1]{%
   \Ifisinteger{#1}{#1}{\scshape #1}}
\setcounter{secnumdepth}{8}
\Ifisinteger{\brill@tocdepth}
   {%
      \setcounter{tocdepth}{\brill@tocdepth}%
      \ClassInfoNoLine{brill}{Setting tocdepth to `\brill@tocdepth}%   
   }%
   {%
      \expandafter\ifcsdef{\brill@tocdepth tocdepth}%
         {%
            \setcounter{tocdepth}{\expandafter\csname\brill@tocdepth tocdepth\endcsname}%
            \ClassInfoNoLine{brill}{Setting tocdepth to `\expandafter\csname\brill@tocdepth tocdepth\endcsname`}%   
         }%
         {%
            \ClassWarningNoLine{brill}{Value `\brill@tocdepth` unknown for option tocdepth!}%
            \setcounter{tocdepth}{3}%
            \ClassInfoNoLine{brill}{Setting tocdepth to standard value 3}%
         }%
   }%  

\newcommand*{\@floattocentryfont}{\small}
\newcommand*{\@floattocentrynumberfont}[1]{%
   {\@floattocentryfont\addfontfeature{Numbers=Tabular}#1}}
\DeclareTOCStyleEntry[%
   indent=0bp,%
   numwidth=8mm,%
   raggedpagenumber,%
   linefill=\tocpageseparator,%
   pagenumberbox=\tocpagenumberbox,%
   entryformat=\@floattocentryfont,%
   entrynumberformat=\@floattocentrynumberfont,%
   pagenumberformat=\@floattocentryfont,%
]{default}{figure}

\DeclareTOCStyleEntry[%
   indent=0bp,%
   numwidth=8mm,%
   raggedpagenumber,%
   linefill=\tocpageseparator,%
   pagenumberbox=\tocpagenumberbox,%
   entryformat=\@floattocentryfont,%
   entrynumberformat=\@floattocentrynumberfont,%
   pagenumberformat=\@floattocentryfont,%
]{default}{table}

\AfterTOCHead[toc]{\zlabel{tocstart}}
\appto\tableofcontents{\zlabel{tocend}\@checktocextent}
\newcommand*{\@checktocextent}{\ifnumgreater{\zref@extract{tocend}{abspage}-\zref@extract{tocstart}{abspage}}{4}%
   {\ClassWarningNoLine{brill}{The TOC consists of more than four pages.\MessageBreak%
         Unless this is confirmed by Brill, you should try\MessageBreak%
         to reduze the extent by setting the tocdepth option}}%
   {\ClassInfoNoLine{brill}{The TOC consists of four pages or less. That's fine.}}%
}
 
\setkomafont{title}{\normalfont\normalcolor\bfseries\hyphenpenalty=\@M}
\setkomafont{subtitle}{\normalfont\normalcolor\itshape\hyphenpenalty=\@M}
\setkomafont{dedication}{\normalfont\normalcolor\itshape\hyphenpenalty=\@M}
\setkomafont{disposition}{\normalcolor\normalfont}
\setkomafont{pagehead}{\normalfont\small\scshape}
\setkomafont{pagenumber}{\normalfont\normalsize\addfontfeatures{Numbers=Lining}\scshape}
\addtokomafont{chapterentry}{\bfseries}
\addtokomafont{chapterentrypagenumber}{\mdseries\pagenumbertocfont}
\addtokomafont{footnotelabel}{\addfontfeatures{Numbers={Tabular}}}%
\addtokomafont{minisec}{\bfseries}%
\addtokomafont{footnotereference}{\upshape}%
\setfootnoterule[.25bp]{16mm}
\deffootnote[\fnlabelsep]{\fnlabelsep}{\normalparindent}{\makebox[\fnlabelsep][l]{\thefootnotemark}}%
\RequirePackage{enumitem}
\setlist{labelsep=*,align=left,nosep}
\setlist[itemize]{leftmargin=\normalparindent,label=\textendash}
\setlist[enumerate,1]{%
   left=0pt .. 2\normalparindent,%
   labelsep=0pt,%
   %font=\normalfont\addfontfeature{Numbers=Tabular}%
}
\IfStrEqCase{\brill@enumsep}{%
   {dot}{}%
   {.}{}%
   {space}{\setlist[enumerate]{label=\arabic*}}%
   {paren}{\setlist[enumerate]{label=\arabic*)}}%
   {)}{\setlist[enumerate]{label=\arabic*)}}%
   {enclparen}{\setlist[enumerate]{label=(\arabic*)}}
   {()}{\setlist[enumerate]{label=(\arabic*)}}%
   }[\ClassWarning{brill}{Value `\brill@enumsep` is unknown for option enumsep!}]%
%%%
\newlist{alphenumerate}{enumerate}{2}
\setlist[alphenumerate,1]{leftmargin=2\parindent,label=\alph*.}
\IfStrEqCase{\brill@alphenumsep}{%
   {dot}{}%
   {.}{}%
   {space}{\setlist[enumerate]{label=\alph*}}%
   {paren}{\setlist[enumerate]{label=\alph*)}}%
   {)}{\setlist[enumerate]{label=\alph*)}}%
   {enclparen}{\setlist[enumerate]{label=(\alph*)}}
   {()}{\setlist[enumerate]{label=(\alph*)}}%
}[\ClassWarning{brill}{Value `\brill@alphenumsep` is unknown for option alphenumsep!}]%
%%\setlist[itemize,2]{leftmargin=\parindent,label=\textendash}
\newlist{enuminline}{enumerate*}{1}
\setlist[enuminline]{label=(\alph*),font=\upshape\bfseries,mode=unboxed}
\newlist{enuminlinesplitA}{enumerate*}{1}
\setlist[enuminlinesplitA]{%
   label=(\alph*),%
   font=\upshape\bfseries,%
   mode=unboxed,%
   resume%
}
\newlist{enuminlinesplitB}{enumerate*}{1}
\setlist[enuminlinesplitB]{%
   label=(\alph*),%
   font=\upshape\bfseries,%
   mode=unboxed,%
   resume%
}
\RequirePackage[marginpar]{todo}
\RequirePackage[cmyk,x11names,table,hyperref]{xcolor}
\RequirePackage[newcommands]{ragged2e}
\RequirePackage{array}
\newcolumntype{L}{>{\strut\raggedright\arraybackslash}X<{\strut}}
\newcolumntype{C}{>{\strut\centering\arraybackslash}X<{\strut}}
\newcolumntype{R}{>{\strut\raggedleft\arraybackslash}X<{\strut}}
\newcolumntype{M}[1]{>{\strut}p{\dimexpr#1\tabucolX+#1\tabcolsep+\arrayrulewidth\relax}<{\strut}}
\newcolumntype{x}[1]{>{\strut\hsize=#1\hsize}X<{\strut}}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabu}
%\patchcmd{\LT@start}%
%   {\advance\vsize-\ht\LT@foot}%
%   {\global\advance\vsize-\ht\LT@foot}%
%   {\ClassInfo{brill}{\string\LT@start\space successfully patched!}}%
%   {\ClassInfo{brill}{\string\LT@start\space could not be patched!}}%
%%
%\patchcmd{\endlongtable}%
%   {\endgraf\penalty -\LT@end@pen
%   \endgroup
%   \global\@mparbottom\z@
%   \pagegoal\vsize}%
%   {\endgraf\penalty -\LT@end@pen
%    \ifvoid\LT@foot\else
%      \global\advance\vsize\ht\LT@foot
%      \global\advance\@colroom\ht\LT@foot
%      \dimen@\pagegoal\advance\dimen@\ht\LT@foot\pagegoal\dimen@
%   \fi
%   \endgroup
%   \global\@mparbottom\z@}%
%   {\ClassInfo{brill}{\string\endlongtable\space successfully patched!}}%
%   {\ClassInfo{brill}{\string\endlongtable\space could not be patched!}}%
%%
%\patchcmd{\LT@output}%
%   {%
%         \advance\dimen@-\ht\LT@lastfoot
%         \ifdim\dimen@<\ht\z@
%            \setbox\@cclv\vbox{\unvbox\z@\copy\LT@foot\vss}%
%            \@makecol
%            \@outputpage
%            \setbox\z@\vbox{\box\LT@head}%
%         \fi
%      \fi
%      \global\@colroom\@colht
%      \global\vsize\@colht
%      \vbox
%        {\unvbox\z@\box\ifvoid\LT@lastfoot\LT@foot\else\LT@lastfoot\fi}%
%   }%
%   {%
%         \advance\dimen@\ht\LT@foot
%         \advance\dimen@-\ht\LT@lastfoot%
%         \ifdim\dimen@<\ht\z@
%            \setbox\@cclv\vbox{\unvbox\z@\copy\LT@foot\vss}%
%            \@makecol
%            \@outputpage
%            \global\vsize\@colroom
%            \setbox\z@\vbox{\box\LT@head}%
%         \fi
%      \fi
%      \unvbox\z@\ifvoid\LT@lastfoot\copy\LT@foot\else\box\LT@lastfoot\fi
%   }%
%   {\ClassInfo{brill}{\string\LT@output\space successfully patched!}}%
%   {\ClassInfo{brill}{\string\LT@output\space could not be patched!}}%

\setlength{\LTpre}{\normalbaselineskip}
\setlength{\LTpost}{\normalbaselineskip}
%\setlength{\LTcapwidth}{\linewidth}
\patchcmd{\bottomrule}{\heavyrulewidth}{\lightrulewidth}%
   {\ClassInfo{brill}{\string\bottomrule\space successfully patched!}}%
   {\ClassInfo{brill}{\string\bottomrule\space could not be patched!}}%
\setlength{\heavyrulewidth}{0.6bp}%
\setlength{\lightrulewidth}{0.3bp}%
% For \toprule, midrule and bottomrule, but _not_ specialrule
\setlength{\aboverulesep}{%
   \dimexpr -\dp\strutbox-\lightrulewidth+\normalbaselineskip-1mm\relax}%
\setlength{\belowrulesep}{\dimexpr1mm +\normalbaselineskip-\ht\strutbox\relax}%
% \abovecaptionskip -> below; \belowcaptionskip -> above
\setlength{\belowcaptionskip}{\dp\strutbox}%
%   \dimexpr \normalbaselineskip-\dp\strutbox\relax}%
\setlength{\abovecaptionskip}{\normalbaselineskip}%
\let\origtable\table
\let\endorigtable\endtable
\renewenvironment{table}[1][tbp]{%
   \expandafter\origtable\expandafter[#1]%
}{%
   \endorigtable
}
%\chardef\TPT@@@asteriskcatcode=\catcode`*
%\catcode`*=11
%\expandafter\patchcmd\csname\string\threeparttable\endcsname
%  {\TPT@hookin{tabular}}
%  {\TPT@hookin{tabular}\TPT@hookin{tabu}}
%  {}{}
%\catcode`*=\TPT@@@asteriskcatcode
\RequirePackage{graphicx}
%%%\RequirePackage{grffile}
\RequirePackage{rotating}
\RequirePackage{pdflscape}
\RequirePackage{environ}
% We define the `H` option as in the float.sty package
\let\@float@Hx\@xfloat
\def\@xfloat#1[{\@ifnextchar{H}{\@float@HH{#1}[}{\@float@Hx{#1}[}}
\newsavebox\float@box
\newif\if@flstyle
\def\@float@HH#1[H]{%
   \expandafter\let\csname end#1\endcsname\float@endH
   \let\@currbox\float@box
   \def\@captype{#1}\setbox\@floatcapt=\vbox{}%
   \expandafter\ifx\csname fst@#1\endcsname\relax
   \@flstylefalse\else\@flstyletrue\fi
   \setbox\@currbox\color@vbox\normalcolor
   \vbox\bgroup \hsize\columnwidth \@parboxrestore
   \@floatboxreset \@setnobreak
   \ignorespaces}
\newtoks\@float@everytoks
\let\@float@boxreset=\@floatboxreset
\def\@floatboxreset{\@float@boxreset\the\@float@everytoks}
\def\@float@setevery#1{\@float@everytoks=\@nameuse{@float@every@#1}}
\newcommand\float@makebox[1]{%
   \vbox{\hsize=#1 \@parboxrestore
      \@fs@pre\@fs@iftopcapt
      \ifvoid\@floatcapt\else\unvbox\@floatcapt\par\@fs@mid\fi
      \unvbox\@currbox
      \else\unvbox\@currbox
      \ifvoid\@floatcapt\else\par\@fs@mid\unvbox\@floatcapt\fi
      \fi\par\@fs@post\vskip\z@}}
\newcommand\float@end{\@endfloatbox
   \global\setbox\@currbox\float@makebox\columnwidth
   \let\@endfloatbox\relax\end@float}
\newcommand\float@endH{\@endfloatbox\vskip\intextsep
   \if@flstyle\setbox\@currbox\float@makebox\columnwidth\fi
   \box\@currbox\vskip\intextsep\relax}
\newcommand\float@dblend{\@endfloatbox
   \global\setbox\@currbox\float@makebox\textwidth
   \let\@endfloatbox\relax\end@dblfloat}
\newsavebox\@floatcapt
%
\newtoggle{@tablebgscreen}
\newtoggle{@tablelong}
\newtoggle{@tablebooktabs}
\newtoggle{@tablebfheaders}
\newtoggle{@tablelandscape}
\newtoggle{@figurelandscape}
\define@key{brill}{caption}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figurecaption{#1}}%
      {\def\@tablecaption{#1}}%
}%
\define@key{brill}{fontsize}{\def\@tablefontsize{#1}}%
\define@key{brill}{headerfontsize}{\def\@tableheaderfontsize{#1}}%
\define@key{brill}{headers}{\def\@tableheaders{#1}}%
\define@key{brill}{numberstyle}{\def\@tablenumberstyle{#1}}%
\define@key{brill}{label}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figurelabel{#1}}%
      {\def\@tablelabel{#1}}%
}%
\define@key{brill}{orientation}{%
   \Ifstr{\@currenvir}{brillfigure}
   	  {\def\@figureorientation{#1}}%
   	  {\def\@tableorientation{#1}}%
}%
\define@key{brill}{placement}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figureplacement{#1}}%
      {\def\@tableplacement{#1}}%
}%
\define@key{brill}{shortcaption}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figureshortcaption{#1}}%
      {\def\@tableshortcaption{#1}}%
}%
\define@key{brill}{width}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figurewidth{#1}}%
      {\def\@tablewidth{#1}}%
}%
\define@key{brill}{landscape}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\settoggle{@figurelandscape}{#1}}%
      {\settoggle{@tablelandscape}{#1}}%
}%
\define@key{brill}{source}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figuresource{#1}}%
      {\def\@tablesource{#1}}%
}
\define@key{brill}{longsource}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figurelongsource{#1}}%
      {\def\@tablelongsource{#1}}%
}
\define@key{brill}{bgscreen}[true]{\settoggle{@tablebgscreen}{#1}}%
\define@key{brill}{long}[true]{\settoggle{@tablelong}{#1}}%
\define@key{brill}{booktabsstyle}[true]{\settoggle{@tablebooktabs}{#1}}%
\define@key{brill}{bfheaders}[true]{\settoggle{@tablebfheaders}{#1}}%

\newcommand*{\@brilltoprule}{%
   \specialrule{\heavyrulewidth}%
      {\dimexpr -\dp\strutbox-1mm\relax}%
      {\dimexpr \normalbaselineskip-0.5\heavyrulewidth-\ht\strutbox+1mm+1bp\relax}%
}
\newcommand*{\@brillmidrule}{%
   \specialrule{\lightrulewidth}%
      {\dimexpr \normalbaselineskip-\dp\strutbox-\lightrulewidth-1mm\relax}%
      {\dimexpr \normalbaselineskip-\ht\strutbox+1mm\relax}%
}
\newcommand*{\@brillbottomrule}{%
   \specialrule{\lightrulewidth}%
      {\dimexpr \normalbaselineskip-\dp\strutbox-\lightrulewidth-1mm\relax}%
      {\dimexpr 0.5\normalbaselineskip-0.5\ht\strutbox%
         +\lightrulewidth+1mm\relax}%
}
\newif\if@userbottomrule
\newcommand*{\brillbuttomrule}{%
   \@brillbottomrule%
   \global\@userbottomruletrue%
}
\newlength{\@firstlastcolindent}
\newif\if@firstitem
\NewEnviron{brilltable}[2][]{%
   \setkeys{brill}{%
      fontsize=\normalsize,%
      orientation=portrait,%
      placement={tbp},%
      width=full,%
      bfheaders,%
      booktabsstyle,%
      numberstyle={Monospaced},%
      #1}% Set default and updated keys
   %%\renewcommand{\thefootnote}{\alph{footnote}}
   \setlength{\lineskip}{0bp}%
   \setlength{\@firstlastcolindent}{0bp}%
   \ifundef{\@tableheaderfontsize}{\let\@tableheaderfontsize\@tablefontsize}{}%
   \Ifstr{\@tableorientation}{landscape}
      {\settoggle{@tablelandscape}{true}}%
      {}%
   \iftoggle{@tablelong}{%
      \iftoggle{@tablelandscape}{\landscape}{}%
      \begingroup%
         \Ifstr{\@tablenumberstyle}{Proportional}%
            {\addfontfeatures{RawFeature={-tnum}}}%
            {\addfontfeatures{Numbers=Monospaced}}%
         \@tablefontsize%
         \iftoggle{@tablebgscreen}
            {\taburowcolors[1] 2{white .. black!10}}%
            {}%
         \ifdefvoid{\@tablecaption}%
            {\setlength{\@firstlastcolindent}{\normalparindent}}%
            {}%
         \IfStrEqCase{\@tablewidth}{%
            {dynamic}{\begin{longtabu}%
               {@{\hspace*{\@firstlastcolindent}}#2%
                @{\hspace*{\@firstlastcolindent}}}%
            }%
            {full}{\begin{longtabu} to \linewidth%
               {@{\hspace*{\@firstlastcolindent}}#2%
                @{\hspace*{\@firstlastcolindent}}}%
            }%
            {wide}{\begin{longtabu} to 130mm%
               {@{\hspace*{\@firstlastcolindent}}#2%
                @{\hspace*{\@firstlastcolindent}}}%
            }%
            {narrow}{\ClassWarning{brill}{Option narrow not implemented yet!}}%
         }[]%
         \ifdefvoid{\@tablecaption}%
            {\addlinespace[2bp]}%
            {%
               \addlinespace[-2.6bp]%11-13.6?
               \ifdefvoid{\@tableshortcaption}%
                  {\caption{\@tablecaption}}%
                  {\caption[\@tableshortcaption]{\@tablecaption}}%
               \ifdefvoid{\@tablelabel}{}{\label{\@tablelabel}}%
               \\%
            }%
         %\hiderowcolors
         \ifdefvoid{\@tableheaders}%
            {%
               \addlinespace[1bp]%
               \iftoggle{@tablebooktabs}%
                  {%
                     \ifdefvoid{\@tablecaption}%
                        {}%
                        {%
                           \endfirsthead%
                           \addlinespace[\dimexpr -\dp\strutbox+1.7bp\relax]%
                           %TODO: More elegant way needed.
                           \caption*{%
                              \makebox[16mm][l]{\usekomafont{captionlabel}%
                              \tableformat}%
                              \usekomafont{caption}%
                              \@tablecaption~(\textit{cont.})%
                           }\\[1.4bp]
                           \endhead
                           \endlastfoot
                        }%
                  }%
                  {%
                     %TODO: Add missing
                  }%
            }%
            {%
               \iftoggle{@tablebooktabs}%
                  {%
                     \@brilltoprule%
                     \iftoggle{@tablebfheaders}%
                        {%
                           \rowfont{\bfseries\@tableheaderfontsize}%
                           \@tableheaders%
                        }%
                        {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                     \@brillmidrule%
                     \endfirsthead%
                     \ifdefvoid{\@tablecaption}%
                        {}%
                        {%
                           \addlinespace[\dimexpr -\dp\strutbox+1.7bp\relax]%
                           %TODO: More elegant way needed.
                           \caption*{%
                              \makebox[16mm][l]{%
                                 \usekomafont{captionlabel}\tableformat}%
                              \usekomafont{caption}%
                              \@tablecaption~(\textit{cont.})%
                           }\\%
                        }%
                     \@brilltoprule%
                     \iftoggle{@tablebfheaders}%
                        {%
                           \rowfont{\bfseries\@tableheaderfontsize}%
                           \@tableheaders%
                        }%
                        {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                     \@brillmidrule%
                     \endhead%
                     \if@userbottomrule
                     \else
                        \@brillbottomrule%
                     \fi%
                     \endlastfoot%
                     \global\@userbottomrulefalse%
                  }{%
                     \firsthline
                     \iftoggle{@tablebfheaders}%
                        {%
                           \rowfont{\bfseries\@tableheaderfontsize}%
                           \@tableheaders%
                        }%
                        {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                     \hline
                     \endfirsthead
                     \caption*{%
                        \makebox[16mm][l]{%
                           \usekomafont{captionlabel}\tableformat}%
                        \usekomafont{caption}%
                        \@tablecaption~(\textit{cont.})%
                     }\\
                     \firsthline
                     \iftoggle{@tablebfheaders}%
                        {%
                           \rowfont{\bfseries\@tableheaderfontsize}%
                           \@tableheaders%
                        }%
                        {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                     \hline
                     \endhead
                     \lasthline
                     \endlastfoot
                  }%
            }%
         %\showrowcolors
         \BODY%
      \end{longtabu}
      \endgroup
      \ifdefvoid{\@tablecaption}{\addtocounter{table}{-1}}{}%
      \iftoggle{@tablelandscape}{\endlandscape}{}%
   }{%
      \iftoggle{@tablelandscape}
         {\begin{sidewaystable}[\@tableplacement]}%
         {\begin{table}[\@tableplacement]}%
         \Ifstr{\@tablenumberstyle}{Proportional}%
            {\addfontfeatures{RawFeature={-tnum}}}%
            {\addfontfeatures{Numbers=Monospaced}}%
         \@tablefontsize
         \ifdefvoid{\@tablecaption}%
            {\setlength{\@firstlastcolindent}{\normalparindent}}%
            {%
               \vspace{-0.6bp}%TODO: Still don't know why
               \ifdefvoid{\@tableshortcaption}%
                  {\caption{\@tablecaption}}%
                  {\caption[\@tableshortcaption]{\@tablecaption}}%
               \ifdefvoid{\@tablelabel}{}{\label{\@tablelabel}}%
            }%
         \iftoggle{@tablebgscreen}
            {\taburowcolors[1] 2{white .. black!10}}%
            {}%
         \IfStrEqCase{\@tablewidth}{%
            {dynamic}{\begin{tabu}%
               {@{\hspace*{\@firstlastcolindent}}%
                  #2@{\hspace*{\@firstlastcolindent}}}}%
            {full}{\begin{tabu} to \textwidth%
               {@{\hspace*{\@firstlastcolindent}}%
                  #2@{\hspace*{\@firstlastcolindent}}}}%
            {wide}{\begin{tabu} to 130mm%
               {@{\hspace*{\@firstlastcolindent}}%
                  #2@{\hspace*{\@firstlastcolindent}}}}%
            {narrow}{\ClassWarning{brill}{Option narrow not implemented yet!}}%
         }[]%       
            %\hiderowcolors%
            \ifdefvoid{\@tableheaders}%
               {}%
               {%
                  \iftoggle{@tablebooktabs}%
                     {%
                        \@brilltoprule%
                        \addlinespace[-1bp]%TODO: Why that value?
                        \iftoggle{@tablebfheaders}%
                           {%
                              \rowfont{\bfseries\@tableheaderfontsize}%
                              \@tableheaders%
                           }%
                           {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                        \@brillmidrule%
                        \addlinespace[0.25bp]%TODO: Why that value?
                     }{%
                        \firsthline
                        \begingroup%
                        \iftoggle{@tablebfheaders}%
                           {%
                              \rowfont{\bfseries\@tableheaderfontsize}%
                              \@tableheaders%
                           }%
                           {\rowfont{\@tableheaderfontsize}\@tableheaders}%
                        \endgroup%
                        \hline%
                     }%
               }%
            %\showrowcolors
            \BODY%
            \iftoggle{@tablebooktabs}%
               {\@brillbottomrule}{\lasthline}%
         \end{tabu}%
      \iftoggle{@tablelandscape}
        {\end{sidewaystable}}%
        {\end{table}}%
   }%
}%
\newenvironment{brillfigure}[1][]{%
   \setkeys{brill}{%
      orientation=portrait,%
      placement={tp},%
      width=dynamic,%
      #1}% Set default and updated keys
   \ifdefvoid{\@figurecaption}%
      {\par\vspace{\baselineskip}\noindent\ignorespaces}%
      {%
         \IfStrEqCase{\@figurewidth}{%
            {dynamic}{%
               \edef\efigure{\noexpand\begin{figure}[\@figureplacement]}%
               \efigure%
               \setkeys{Gin}{width=\Gin@nat@width}%
            }%
            {full}{%
               \begin{figure}[tp]%
               \setkeys{Gin}{width=\textwidth}%
            }%
            {wide}{%
               \begin{figure}[tp]%
               \begin{addmargin}[-4mm]{11mm}%
               \setkeys{Gin}{width=130mm}%
            }%
            {narrow}{%
               \begin{figure}[tp]%
               \setcapindent*{0bp}%
               \setkeys{Gin}{width=\Gin@nat@width}%
               \ifdefvoid{\@figurecaption}
                  {}%
                  {%
                     \ifdefvoid{\@figureshortcaption}%
                        {%
                           \ifdefvoid{\@figuresource}%
                              {\begin{captionbeside}{\@figurecaption}}%
                              {\begin{captionbeside}{\@figurecaption\\*\textsc{\@figuresource}}}%
                        }%
                        {%
                           \ifdefvoid{\@figuresource}%
                              {\begin{captionbeside}[\@figureshortcaption]{\@figurecaption}}%
                              {\ifdefvoid{\@figurelongsource}%
                                 {%
                                    \begin{captionbeside}%
                                    [\@figureshortcaption\\*\textsc{\@figuresource}]%
                                    {\@figurecaption\\*\textsc{\@figuresource}}%
                                 }%
                                 {%
                                    \begin{captionbeside}%
                                    [\@figureshortcaption\\*\textsc{\@figurelongsource}]%
                                    {\@figurecaption\\*\textsc{\@figuresource}}%
                                 }%
                              }%                  
                        }%
                  }%
            }%
         }[%
            \edef\efigure{\noexpand\begin{figure}[\@figureplacement]}%
            \efigure%
            \setkeys{Gin}{width=\@figurewidth}%
          ]%
      }%
   }{%\end{brillfigure}
      \ifdefvoid{\@figurecaption}%
         {\par\vspace{\baselineskip}}%
         {%
            \Ifstr{\@figurewidth}{narrow}
               {%
                  \ifdefvoid{\@figurecaption}
                     {}%
                     {%
                        \end{captionbeside}
                        \ifdefvoid{\@figurelabel}{}{\label{\@figurelabel}}%
                     }%
               }%   
               {%
                  \ifdefvoid{\@figurecaption}%
                     {}%
                     {%
                        \vspace{-\normalbaselineskip}%
                        \ifdefvoid{\@figureshortcaption}%
                           {%
                              \ifdefvoid{\@figuresource}%
                                 {\caption{\@figurecaption}}%
                                 {\caption{\@figurecaption\\*\textsc{\@figuresource}}}%
                           }%
                           {%
                              \ifdefvoid{\@figuresource}%
                                 {\caption[\@figureshortcaption]{\@figurecaption}}%
                                 {%
                                    \ifdefvoid{\@figurelongsource}%
                                       {%
                                          \caption%
                                          [\@figureshortcaption\\*\textsc{\@figuresource}]%
                                          {\@figurecaption\\*\textsc{\@figuresource}}%
                                       }%
                                       {%
                                          \caption%
                                          [\@figureshortcaption\\*\textsc{\@figurelongsource}]%
                                          {\@figurecaption\\*\textsc{\@figuresource}}%
                                       }%
                                 }%
                           }%
                     }%
                     \ifdefvoid{\@figurelabel}{}{\label{\@figurelabel}}%
               }%
            \Ifstr{\@figurewidth}{wide}%
               {\end{addmargin}\end{figure}}%
               {\end{figure}}%
         }%
   }%
\BeforeBeginEnvironment{brilltable}{%
   \setlength{\textfloatsep}{\normalbaselineskip}%
   % distance between floats on the top or the bottom and the text;
   \setlength{\intextsep}{\normalbaselineskip}% 
   % distance between floats inserted inside the page text (using h) and the text proper.
   \setlength{\floatsep}{\normalbaselineskip}%
}
\BeforeBeginEnvironment{brillfigure}{%
   \setlength{\textfloatsep}{\normalbaselineskip}%
   \setlength{\intextsep}{\dimexpr\normalbaselineskip-1.5mm\relax}%
   \setlength{\floatsep}{0bp}%
}
\setlength{\@fptop}{0pt}% default is 0\p@ \@plus 1fil
\setlength{\@fpsep}{\floatsep}% default is 8\p@ \@plus 2fil
\setlength{\@fpbot}{0pt plus 1fil}% default is 0\p@ \@plus 1fil
\setkomafont{captionlabel}{\scshape}
\setkomafont{caption}{\normalfont\footnotesize}
\setcaphanging
\setcapindent{16mm}
\setcaptionalignment{J}
\newlength{\@currentcaplabelwidth}
\AtBeginDocument{
   \renewcommand*{\captionformat}{%
      \Ifstr{\@captype}{figure}
         {\settowidth{\@currentcaplabelwidth}{\figureformat}}%
         {\settowidth{\@currentcaplabelwidth}{\tableformat}}%
      \hspace{\dimexpr 16mm-\@currentcaplabelwidth\relax}}
}%TODO: 20mm for figures?
\renewcommand*{\figureformat}{\figurename~\thefigure}
\renewcommand*{\tableformat}{\tablename~\thetable}
\renewcaptionname{british}{\listtablename}{Tables}
\renewcaptionname{british}{\listfigurename}{Figures}
\providecaptionname{british}{\listfiguretablename}{List of Figures and Tables}
\providecaptionname{british}{\introductionname}{Introduction}
\newcommand{\listoffigurestables}{%
   \addchap[tocentry={\listfiguretablename}]{Figures and Tables}
   \listoffigures
   \listoftables
}
%TODO: This should probably go into the config file. Take care of loading order.
\ifbrill@printversion
   \RequirePackage[status=final,layout={margin},author={!!!}]{fixme}
\else
   \RequirePackage[status=draft,layout={margin},author={!!!}]{fixme}
\fi%
\RequirePackage[imakeidx]{xindex}
\indexsetup{%
   headers={\MakeMarkcase{\indexname}}{\MakeMarkcase{\indexname}},%
   level=\addchap,%
   %toclevel=chapter,%
   othercode={\setlength{\parskip}{0pt}\RaggedRight\footnotesize}}%
\renewcommand*{\@idxitem}{\par\hangindent 2\normalparindent}%
\renewcommand*{\subitem}{%
   \par\hangindent 2\normalparindent\hspace*{\normalparindent}}%
\renewcommand*{\subsubitem}{%
   \par\hangindent 2\normalparindent\hspace*{\normalparindent}}%
\let\indexspace\relax%\par\addvspace{\normalbaselineskip}\relax}%

\ifboolexpr{ bool {brill@showgrid} and not bool {brill@printversion} }%
{%
   \RequirePackage{atbegshi,picture,xcolor}
   \AtBeginShipout{%
     \AtBeginShipoutUpperLeft{%
       \color{red}%
       \put(\dimexpr 1in+\oddsidemargin,
            -\dimexpr 1in+\topmargin+\headheight+\headsep+\topskip)%
         {%
          \vtop to\dimexpr\vsize+\baselineskip{
            \hrule
            \leaders\vbox to 13.2bp{\hrule width\hsize\vfill}\vfill
          }%
         }%
     }%
}
}{}%

\RequirePackage{shellesc} %TODO: Check whether still needed
\RequirePackage{url}
\urlstyle{same}
\ifbrill@colorlinks
   \RequirePackage[unicode,colorlinks=true,allcolors=blue]{hyperref}
\else
   \RequirePackage[unicode,colorlinks=true,allcolors=black]{hyperref}
\fi%   
\RequirePackage{bookmark}
\pdfstringdefDisableCommands{%
   \let\newline\space%
   \let\\\space
   \def\textsuperscript#1{\textasciicircum(#1)}%
}%
\RequirePackage{ellipsis}
\ifboolexpr{ not bool {brill@printversion} and bool {brill@gitver} }%
   {%
      \RequirePackage[noheader]{gitver}%
      \cfoot*{\versionBox{}}%
   }%
   {}%
\ifboolexpr{ not bool {brill@PhD} and bool {brill@printversion} }%
   {\RequirePackage[x-1a1]{pdfx}}%
   {}%
\RequirePackage[%
   nomain,%
   abbreviations,%
   toc,%
   numberline,%
   nonumberlist,%
   nosuper,%
   automake=immediate,
   xindy={glsnumbers=false,language=english,codepage=utf8}]{glossaries-extra}
%
\newdimen\widestabbreviation
\setlength{\widestabbreviation}{0bp}

\newlength{\currentwidth}
\newcommand*{\@checkforwidestabbreviation}[1]{%
   \settowidth{\currentwidth}{#1}%
   \ifdimgreater{\currentwidth}{\widestabbreviation}%
      {\global\setlength{\widestabbreviation}{\the\currentwidth}}%
      {}%
}

\AtEndDocument{%
   \ifdimless{\widestabbreviation}{\normalparindent}%
      {\immediate\write\@auxout%
         {\noexpand\setlength{\widestabbreviation}{\normalparindent}}%
      }{\ifdimless{\widestabbreviation}{2\normalparindent}%
         {\immediate\write\@auxout%
            {\noexpand\setlength{\widestabbreviation}{2\normalparindent}}%
         }{\ifdimless{\widestabbreviation}{3\normalparindent}%
            {\immediate\write\@auxout%
               {\noexpand\setlength{\widestabbreviation}{3\normalparindent}}%
            }{\ifdimless{\widestabbreviation}{4\normalparindent}%
               {\immediate\write\@auxout%
                  {\noexpand\setlength{\widestabbreviation}{4\normalparindent}}%
               }{\ifdimless{\widestabbreviation}{5\normalparindent}%
                  {\immediate\write\@auxout%
                     {\noexpand\setlength{\widestabbreviation}{5\normalparindent}}%
                  }{\ifdimless{\widestabbreviation}{6\normalparindent}%
                     {\immediate\write\@auxout%
                        {\noexpand\setlength{\widestabbreviation}{6\normalparindent}}%
                     }{\immediate\write\@auxout%
                           {\noexpand\setlength{\widestabbreviation}{7\normalparindent}}%
                     }%
                  }%
               }%
            }%
         }%
      }%
}%
\newlength{\@pdepth}
\settodepth{\@pdepth}{\usekomafont{chapter}p}
\newglossarystyle{brill}{%
   \renewenvironment{theglossary}%
      {%
         \setlength{\LTpre}{0bp}%
         \setlength{\LTpost}{0bp}%
         \begin{longtabu} to%
            \textwidth{@{}p{\widestabbreviation}@{\hspace*{\normalparindent}}>{\raggedright}X@{}}%
      }%
      {\end{longtabu}}%
   \renewcommand*{\glossaryheader}{}%
   \renewcommand*{\glsgroupheading}[1]{}%
   \renewcommand{\glossentry}[2]{%
      \@checkforwidestabbreviation{##1}%
      \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}}\strut &
      \glossentrydesc{##1}\glspostdescription\space ##2\strut%
      \tabularnewline%
   }%
   \renewcommand{\subglossentry}[3]{%
      &
      \glssubentryitem{##2}%
      \glstarget{##2}{\strut}\glossentrydesc{##2}%
      \glspostdescription\space ##3%
      \tabularnewline%
   }%
   \ifglsnogroupskip
      \renewcommand*{\glsgroupskip}{}%
   \else
      \renewcommand*{\glsgroupskip}{ & \tabularnewline}%
   \fi%
}
\setglossarystyle{brill}
\renewcommand{\glossarypreamble}{\kern-\prevdepth\vskip\@pdepth\small}%

\setabbreviationstyle{short-nolong}
\renewcommand{\glsnamefont}[1]{\normalfont\mdseries #1}

\RequirePackage{cleveref}
\crefname{subthreesection}{section}{sections}
\crefname{subfoursection}{section}{sections}
\crefname{subfivesection}{section}{sections}

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
% See https://tex.stackexchange.com/questions/514127/incompatibility-between-noindentafter-and-etoolbox-v2-5f
\newcommand*{\@NoIndentAfter}{%
   \@ifnextchar\par{%
      \def\par{%
         \everypar{\setbox\z@\lastbox\everypar{}}%
         \@restorepar%
      }%
   }{}%
}
\newrobustcmd*{\NoIndentAfterThis}{\@NoIndentAfter\par\par}
\newcommand*{\NoIndentAfterEnv}[1]{%
   \AfterEndEnvironment{#1}{\NoIndentAfterThis}%
}

\renewenvironment{quote}%
   {%
    \par\addvspace{\baselineskip}%
    \addmargin[2\parindent]{0bp}%
    \ignorespaces%
    \aftergroup\useignorespacesandallpars%
   }%
   {%
    \endaddmargin%
    \par\addvspace{\baselineskip}\noindent\ignorespaces%
   }%

\newenvironment{@btquote}%
   {%
      \if@btquotetitle
         \par\nopagebreak\vspace{\@btvspace}%
         \@beginparpenalty=\@M%
      \else
         \par\addvspace{\@btvspace}%
      \fi%
      \ifcsdef{specialnewline\@currvalspecialnewline}%
         {%
            \addmargin[\dimexpr 2\parindent+\normalparindent\relax]{0bp}%
            \setlength{\parindent}{-\normalparindent}%
            \hspace*{-\normalparindent}%
         }%
         {\addmargin[2\parindent]{0bp}}%
      \ignorespaces%
      \aftergroup\useignorespacesandallpars%
   }%
   {%
      \endaddmargin%
      \par\addvspace{\@btvspace}%\noindent\ignorespaces%
   }%

\NoIndentAfterEnv{quote}
\NoIndentAfterEnv{@btquote}

\newcommand{\beforeblocktranslation}[1]{%
   \begin{addmargin}[2\parindent]{0bp}%
      #1%
   \end{addmargin}%
   \par\nopagebreak\addvspace{1\baselineskip}%
}

\newcounter{specialnewline}
\newcommand{\@linebreakwithindent}{%
   \par\hangindent\normalparindent\hangafter=1\relax}
\newcommand{\@specialnewline}{%
   \immediate\write\@auxout{%
      \csgdef{specialnewline\@currvalspecialnewline}{}}%
   \@linebreakwithindent%
}

\newlength{\@btvspace}
\setlength{\@btvspace}{\baselineskip}
\newcommand*{\Setbtvspace}[1]{\setlength{\@btvspace}{#1}}
\newcommand{\blocktranslation}{\@ifstar\@blocktranslation\@@blocktranslation}%
% Starred version
\newcommand{\@blocktranslation}[4][]{%
   \par\noindent%
   \if@splitsplittranslation%
      \ifstrempty{#2}%
         {\begin{enuminlinesplitA}#3\end{enuminlinesplitA}\par\nopagebreak}%
         {%
            \hyphenpenalty=\@M%
            \exhyphenpenalty=\@M%
            \begin{enuminlinesplitA}%
               \ItalicsOrNot{#2}#3%
            \end{enuminlinesplitA}\par\nopagebreak%
         }%
      \if@splittranslation%
         \addvspace{\@btvspace}\noindent%
      \else%
         \noindent%
      \fi%
      \ifstrempty{#4}{}{%
         \begin{enuminlinesplitB}%
         #4%
         \end{enuminlinesplitB}%
      }%
      \ifstrempty{#1}%
         {}%
         {%
            \par\nopagebreak\noindent%
            \begin{addmargin}[2\parindent]{0bp}%
               #1%
            \end{addmargin}%
         }%
   \else%
      {\ifstrempty{#2}{#3}{{\ItalicsOrNot{#2}#3}}}%
      \par\addvspace{\@btvspace}\noindent%
      \ifstrempty{#4}{}{#4}%
      \ifstrempty{#1}%
         {}%
         {%
            \par\nopagebreak\noindent%
            \begin{addmargin}[2\parindent]{0bp}%
               #1%
            \end{addmargin}%
         }%
   \fi%
   \par\addvspace{\@btvspace}\NoIndentAfterThis%
}%
\def\@tabarray@array@new{%
   \@ifnextchar[{\@@array}{\expandafter\@@array\expandafter[\array@default]}%
}%
\def\array@default{c}
\let\@tabarray\@tabarray@array@new

% Normal version: \blocktranslation[title]{language}{origtext}{translation}
\newif\if@btquotetitle
\newcommand{\@@blocktranslation}[4][]{%
% set vertical position of table cells   
   \def\array@default{b}%
% As we do not know at the beginning, whether the text contains any newline 
% elements at all we increase a counter and store a unique macros in the 
% aux file, which we can then evaluate. It needs at least two runs to work.
   \refstepcounter{specialnewline}%
   \xdef\@currvalspecialnewline{\thespecialnewline}%
% If there is no title argument we don't want any extra spacing   
   \ifstrempty{#1}%
      {\@btquotetitlefalse}%
      {%
         \@btquotetitletrue%
         \par\addvspace{\@btvspace}\noindent #1\par\nopagebreak%
      }%
% We start the output using a custom variant of the quote environment   
   \begin{@btquote}%
% Define \newline and \\ to use a hanging indent _and_ to set a macro to 
% remember, that a newline element was used.      
      \@inblocktranslationtrue%
      \let\newline\@specialnewline%
      \let\\\@specialnewline%
% Test for the language argument      
      \ifstrempty{#2}%
         {\ifstrempty{#3}%
            {\noindent #4}%
            {%
               #3%
               \ifstrempty{#4}{}{%
                  \ifcsdef{specialnewline\@currvalspecialnewline}%
                     {\par\nopagebreak\vspace{\@btvspace}}%
                     {\par\nopagebreak\vspace{\@btvspace}\noindent}%
                  #4%
               }%
            }%
         }%
         {%
            \ifstrempty{#3}%
               {\ifstrempty{#4}{}{\noindent #4}}%
               {%
                  {\ItalicsOrNot{#2}#3}%TODO: Could be \begin{nohypens}...\end{nohyphens}
                  \ifstrempty{#4}%
                     {}%
                     {%
% If argument #3 contains newline elements, the macro exists and we know, that 
% we need to use hanging indentation for the translation as well. Otherwise we 
% use a standard \par to end the text.
                        \ifcsdef{specialnewline\@currvalspecialnewline}%
                           {\par\nopagebreak\vspace{\@btvspace}}%
                           {\par\nopagebreak\vspace{\@btvspace}\noindent}%
% Output translation argument                        
                        #4%
                     }%
               }%
         }%
   \end{@btquote}%
   \NoIndentAfterThis%
}%

\newif\if@splittranslation
\newif\if@splitsplittranslation
\newenvironment{splittranslation}%
   {\global\@splitsplittranslationtrue%
    \restartlist{enuminlinesplitA}%
    \restartlist{enuminlinesplitB}}%
   {\global\@splitsplittranslationfalse}%

\newenvironment{splittranslation*}%
   {\global\@splittranslationtrue%
    \global\@splitsplittranslationtrue%
    \restartlist{enuminlinesplitA}%
    \restartlist{enuminlinesplitB}}%
   {\global\@splittranslationfalse%
    \global\@splitsplittranslationfalse}%   

\NoIndentAfterEnv{splittranslation}
\NoIndentAfterEnv{splittranslation*}

\let\@RIGminisec\minisec
\renewcommand{\minisec}[1]{%
   \addvspace{1\baselineskip}%
   \@RIGminisec{#1}%
   \addvspace{\baselineskip}%
}

\appto{\tableofcontents}{\cleardoubleoddemptypage}
\appto{\frontmatter}{\setcounter{page}{5}} 
\appto{\mainmatter}{%
   \begingroup%
      \let\origwrite\write
      \def\write{\immediate\origwrite}%
      \addtocontents{toc}{\protect\addvspace{2\baselineskip}}%
      \addtocontents{toc}{%
         \protect\setlength{\@addchaptertocskip}{1\baselineskip}}%
   \endgroup%
}

\newif\if@totalchapterwritten
\appto{\backmatter}{%
   \cleardoubleoddemptypage
   \KOMAoptions{open=any}%
   \begingroup%
      \let\origwrite\write
      \def\write{\immediate\origwrite}%
      \addtocontents{toc}{\protect\addvspace{2\baselineskip}}%
      \addtocontents{toc}{\protect\setlength{\@addchaptertocskip}{0bp}}%
   \endgroup%
   \if@totalchapterwritten\else
      \immediate\write\@auxout%
         {\string\numgdef{\string\totalchapters}{\thechapter}}%
         \@totalchapterwrittentrue%
   \fi%
}
\preto{\appendix}{%
   \if@totalchapterwritten\else
      \immediate\write\@auxout%
         {\string\numgdef{\string\totalchapters}{\thechapter}}%
      \@totalchapterwrittentrue%
   \fi%
}
\appto{\appendix}{%
   \@mainmattertrue
   \ifbrill@PhD
   \else
      \renewcommand*{\thechapter}{\arabic{chapter}}%
      \small%
   \fi%
   \cleardoubleoddemptypage
}
\newcommand*{\appendixstart}{\appendix}
\newcommand*{\appendixend}{\@mainmatterfalse\normalsize}

\setlength{\parindent}{4mm}

\AtEndDocument{%
   \if@totalchapterwritten\else
      \immediate\write\@auxout%
         {\string\numgdef{\string\totalchapters}{\thechapter}}%
   \fi%
}%
\setlength{\fboxsep}{0bp}
\setlength{\fboxrule}{0.3bp}
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
\brokenpenalty=5000
\vfuzz \hfuzz
\raggedbottom
\endinput
