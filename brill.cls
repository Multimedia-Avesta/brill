\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brill}[2020/06/04 v0.40.0 A template for Brill publications]
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
\fi%   
\RequireLuaTeX
\LoadClass[%
   parskip=never,%
   captions=nooneline,%
   captions=tableabove,%
   captions=bottombeside,%
   captions=rightbeside,%
   chapterprefix,%
   listof=leveldown,%
   open=any,%
   toc=bibliography,%
   toc=numberline,%
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
\RequirePackage[french,ngerman,italian,spanish,main=british]{babel}
%\directlua{
%   fonts.handlers.otf.addfeature {
%      name = "thetasubst",
%      type = "substitution",
%      data = {
%         theta = "uni03d1",
%      },
%   }
%}
%\directlua
%{
%   fonts.handlers.otf.addfeature 
%   {
%      name = "ktest",
%      type = "kern",
%      data = 
%      {
%         ["5"] = { [","] =  1000 },
%      },
%   }
%}
%\patchcmd{\realsuperscript}{\addfontfeature{VerticalPosition=Superior}}%
%   {\addfontfeature{VerticalPosition=Superior,RawFeature={+moresups}}}%
%   {}%
%   {\ClassWarning{brill}{Patch of realsuperscript failed}}
\defaultfontfeatures{Ligatures={TeX,Common,NoRare}}
% Uses proportional oldstyle numbers by default
%\setmainfont{Brill}[RawFeature={+ktest+thetasubst},SmallCapsFeatures = {RawFeature=+c2sc}]
\setmainfont{Brill}[SmallCapsFeatures = {RawFeature=+c2sc}]
\newfontfamily{\trackingfont}{Brill}
[%
   Ligatures      = {NoCommon},%
   WordSpace      = {1.35,1.45,1.55},%
   LetterSpace    = 12.5,%
]%
\newfontfamily{\freeserif}{FreeSerif}%
[%
   Extension      = .otf,%
   UprightFont    = *,%
   BoldFont       = *Bold,%
   ItalicFont     = *Italic,%
   BoldItalicFont = *BoldItalic,%
   Scale          = MatchLowercase,% 
]% 
\newfontfamily{\freesans}{FreeSans}%
[%
   Extension      = .otf,%
   UprightFont    = *,%
   BoldFont       = *Bold,%
   ItalicFont     = *Oblique,%
   BoldItalicFont = *BoldOblique,%
   Scale          = MatchLowercase,% 
]% 
\newfontfamily{\avestanfont}{NotoSansAvestan}%
[%
   Extension      = .ttf,%
   UprightFont    = *-Regular,%
   Scale          = MatchLowercase,%
   Script         = Avestan,%
]%
\newfontfamily{\gujaratifont}{NotoSerifGujarati}%
[%
   Extension      = .ttf,%
   UprightFont    = *-Regular,%
   BoldFont       = *-Bold,%
   Scale          = MatchLowercase,%
   Script         = Gujarati,%
]%
\newfontfamily{\arabicfont}{NotoNaskhArabic}%
[%
   Extension      = .ttf,%
   UprightFont    = *-Regular,%
   BoldFont       = *-Bold,%
   Scale          = MatchLowercase,%
   Script         = Arabic,%
]%
\newfontfamily{\pahlavifont}{KHUSRO__}%
[%
   Extension      = .TTF,%
   UprightFont    = *,%
   Scale          = MatchLowercase,%
]%
%\newfontfamily{\syriacfont}{NotoSansSyriacEastern}%
%[%
%   Extension      = .ttf,%
%   UprightFont    = *-Regular,%
%   Scale          = MatchLowercase,%
%   Script         = Syriac,%
%]%
\newcommand{\textavestan}[1]{\bgroup\microtypesetup{activate=false}\textdir TRT\avestanfont #1\egroup}
\newcommand{\textgujarati}[1]{\bgroup\microtypesetup{activate=false}\gujaratifont #1\egroup}
\newcommand{\textarabic}[1]{\bgroup\microtypesetup{activate=false}\arabicfont #1\egroup}
\newcommand{\textpahlavi}[1]{\bgroup\microtypesetup{activate=false}\textdir TRT\pahlavifont #1\egroup}
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
      heightrounded%
   }
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
\RequirePackage[english]{selnolig}
\RequirePackage{etoolbox}
% In recent versions of KOMA-Script, macro \ifstr was renamed to \Ifstr
% We make sure, that this macro exists for older versions as well.
\ifundef{\Ifstr}{\let\Ifstr\ifstr}{}
\ifundef{\Ifisinteger}{\let\Ifisinteger\ifisinteger}{}
\RequirePackage[autostyle,english=british]{csquotes}
%%\SetBlockThreshold{3}
\renewcommand*{\mkcitation}[1]{\par\nopagebreak\hspace*{2\parindent}#1}
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
\RequirePackage{xstring}
\RequirePackage{multicol}
\AtBeginEnvironment{multicols}{\raggedright}
\setlength{\columnsep}{4mm}
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
   innerskip=0pt,%
   font={\LARGE\bfseries\itshape},%
   prefixfont={\LARGE\bfseries\scshape},%
   tocnumwidth=0pt,%
   tocindent=0pt%
]{part}

\renewcommand{\partlineswithprefixformat}[3]{%
   \MakeLowercase{#2}\enspace#3%
}
\renewcommand*{\thepart}{\arabic{part}}
\renewcommand*{\partformat}{\partname\enskip\thepart\autodot}
%\renewcommand*{\addparttocentry}[2]{%
%   \addtocentrydefault{part}{\hspace*{12mm}\partname~#1}{#2}}%
 
\renewcommand*{\addparttocentry}[2]{%
   \addtocentrydefault{part}{}{%
      \hspace*{12mm}%
      \large\bfseries%
      \scshape\partformat%
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

\newlength{\@addchaptertocskip}
\newlength{\@addchapterheight}
\RedeclareSectionCommand[%
   beforeskip=-1sp,%
   afterskip={\dimexpr 2\baselineskip+\@addchapterheight\relax},%
   innerskip=.5\baselineskip,%
   font={\LARGE\bfseries},%
   prefixfont={\normalfont\normalsize\mdseries\addfontfeatures{Numbers=Lining}\scshape},%
   tocnumwidth=\dimexpr\@tocstartindent\relax,%
   tocindent=0pt,%
   tocbeforeskip=\dimexpr\@addchaptertocskip\relax,%
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
      indent=0pt,%
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
      indent=0pt,%
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
      indent=0pt,%
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
      indent=0pt,%
      level=7,%
      tocindent=0pt,%%%TODO
%      tocnumwidth=8mm,%
      counterwithin=subfivesection%
   ]{paragraph}
   \renewcommand*{\theparagraph}{\thesubfivesection.\arabic{paragraph}}
   \@namedef{paragraphtocdepth}{7}   

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=.5\baselineskip,%
      font={\small\bfseries},%
      indent=0pt,%
      level=8,%
      tocindent=0pt,%%%TODO
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
      tocindent=\dimexpr\@tocstartindent\relax%
   ]{section}
   \renewcommand*{\thesection}{\arabic{section}}
   %
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize\bfseries\itshape},%
      tocnumwidth=8mm,%
      tocindent=\dimexpr\@tocstartindent+8mm\relax,%
      tocentrynumberformat=\upshape,%
      tocentryformat=\itshape%
   ]{subsection}
   %
   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize},%
      tocnumwidth=12mm,%
      tocindent=\dimexpr\@tocstartindent+16mm\relax%
   ]{subsubsection}
   %
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\normalsize\itshape},%
      indent=0pt,%
      level=4,%
      tocindent=0pt,%%%TODO
      tocnumwidth=6\parindent,%
      tocstyle=section,%
      counterwithin=subsubsection%
   ]{subthreesection}
   \renewcommand*{\thesubthreesection}{\thesubsubsection.\arabic{subthreesection}}
   \@namedef{subthreesectiontocdepth}{4}

   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small},%
      indent=0pt,%
      level=5,%
      tocindent=0pt,%%%TODO
      tocnumwidth=7\parindent,%
      tocstyle=section,%
      counterwithin=subthreesection%
   ]{subfoursection}
   \renewcommand*{\thesubfoursection}{\thesubthreesection.\arabic{subfoursection}}
   \@namedef{subfoursectiontocdepth}{5}
   
   \ProvideSectionCommand[%
      style=section,%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small\itshape},%
      indent=0pt,%
      level=6,%
      tocindent=0pt,%%%TODO
      tocnumwidth=8\parindent,%
      tocstyle=section,%
      counterwithin=subfoursection%
   ]{subfivesection}
   \renewcommand*{\thesubfivesection}{\thesubfoursection.\arabic{subfivesection}}
   \@namedef{subfivesectiontocdepth}{6}

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small},%
      indent=0pt,%
      level=7,%
      tocindent=0pt,%%%TODO
      tocnumwidth=9\parindent,%
      counterwithin=subfivesection%
   ]{paragraph}
   \renewcommand*{\theparagraph}{\thesubfivesection.\arabic{paragraph}}
   \@namedef{paragraphsectiontocdepth}{7}

   \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,%
      afterskip=1sp,%
      font={\small\itshape},%
      indent=0pt,%
      level=8,%
      tocindent=0pt,%%%TODO
      tocnumwidth=10\parindent%
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
\else
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
\newcommand\tocpageseparator{\unskip\hspace{2em}}
\newcommand\tocpagenumberbox[1]{\mbox{#1}}%
\RedeclareSectionCommands[%
   tocraggedpagenumber,%
   toclinefill=\tocpageseparator,%
   tocpagenumberbox=\tocpagenumberbox,%
   %%beforeskip=0pt
   ]{part,chapter,section,subsection,subsubsection}
\RedeclareSectionCommands[%
   tocpagenumberbox={\@gobble}%
   ]{part}
%   tocbreakafternumber=true,
%   tocentryformat=\large\bfseries\scshape
%   ]{part}
%%\RedeclareSectionCommands[
%%   toconstartsamelevel=\vspace{0pt},%
%%   toconstartlowerlevel=\vspace{\baselineskip}]{chapter}
%\RedeclareSectionCommands[tocentrynumberformat=\upshape,tocentryformat=\itshape]{subsection}

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
  \subsection*{#1}\addsecmark{}%
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
  \subsubsection*{#1}\addsecmark{}%
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
\AfterTOCHead[toc]{\zlabel{tocstart}}
\appto\tableofcontents{\zlabel{tocend}\@checktocextent}
\newcommand*{\@checktocextent}{\ifnumgreater{\zref@extract{tocend}{abspage}-\zref@extract{tocstart}{abspage}}{4}%
   {\ClassWarningNoLine{brill}{The TOC consists of more than four pages.\MessageBreak%
         Unless this is confirmed by Brill, you should try\MessageBreak%
         to reduze the extent by setting the tocdepth option}}%
   {\ClassInfoNoLine{brill}{The TOC consists of four pages or less. That's fine.}}%
}
 
\setkomafont{title}{\normalfont\normalcolor\bfseries\hyphenpenalty=10000}
\setkomafont{subtitle}{\normalfont\normalcolor\itshape\hyphenpenalty=10000}
\setkomafont{dedication}{\normalfont\normalcolor\itshape\hyphenpenalty=10000}
\setkomafont{disposition}{\normalcolor\normalfont}
\setkomafont{pagehead}{\normalfont\small\scshape}
\setkomafont{pagenumber}{\normalfont\normalsize\addfontfeatures{Numbers=Lining}\scshape}
\addtokomafont{chapterentry}{\bfseries}
\addtokomafont{chapterentrypagenumber}{\mdseries\pagenumbertocfont}
\addtokomafont{footnotelabel}{\addfontfeatures{Numbers={Tabular,Lining}}}%
\addtokomafont{minisec}{\bfseries}%
\addtokomafont{footnotereference}{\upshape}%\addfontfeatures{VerticalPosition=Superior}}
\setfootnoterule[.25pt]{16mm}
\deffootnote[\fnlabelsep]{\fnlabelsep}{\normalparindent}{\makebox[\fnlabelsep][l]{\thefootnotemark}}%
%%%\deffootnote[1.25em]{1.25em}{1.25em}{\makebox[1.25em][r]{\thefootnotemark}\
%% }
%%\deffootnotemark{\thefootnotemark}

%%%\recalctypearea

\RequirePackage{enumitem}
\setlist{labelsep=*,align=left,nosep}
\setlist[itemize]{leftmargin=\parindent,label=\textendash}
\setlist[enumerate,1]{leftmargin=2\parindent}
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
\setlist[enuminlinesplitA]{label=(\alph*),font=\upshape\bfseries,mode=unboxed,resume}
\newlist{enuminlinesplitB}{enumerate*}{1}
\setlist[enuminlinesplitB]{label=(\alph*),font=\upshape\bfseries,mode=unboxed,resume}
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
\RequirePackage{tabu}
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
\chardef\TPT@@@asteriskcatcode=\catcode`*
\catcode`*=11
\expandafter\patchcmd\csname\string\threeparttable\endcsname
  {\TPT@hookin{tabular}}
  {\TPT@hookin{tabular}\TPT@hookin{tabu}}
  {}{}
\catcode`*=\TPT@@@asteriskcatcode
\RequirePackage{graphicx}
%%%\RequirePackage{grffile}
\RequirePackage{rotating}
\RequirePackage{pdflscape}
\RequirePackage{environ}
\newtoggle{@tablebgscreen}
\newtoggle{@tablelong}
\newtoggle{@tablebooktabs}
\newtoggle{@tablelandscape}
\newtoggle{@figurelandscape}
\define@key{brill}{bgscreen}[false]{\settoggle{@tablebgscreen}{#1}}%
\define@key{brill}{caption}{%
   \Ifstr{\@currenvir}{brillfigure}
      {\def\@figurecaption{#1}}%
      {\def\@tablecaption{#1}}%
}%
\define@key{brill}{fontsize}{\def\@tablefontsize{#1}}%
\define@key{brill}{headers}{\def\@tableheaders{#1}}%
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
\define@key{brill}{long}{\settoggle{@tablelong}{#1}}%
\define@key{brill}{booktabsstyle}{\settoggle{@tablebooktabs}{#1}}%
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

\newif\if@firstitem
\NewEnviron{brilltable}[2][]{%
   \setkeys{brill}{%
      fontsize=\normalsize,%
      orientation=portrait,%
      placement={tbp},%
      width=full,%
      #1}% Set default and updated keys
   %%\renewcommand{\thefootnote}{\alph{footnote}}
   \Ifstr{\@tableorientation}{landscape}
      {\settoggle{@tablelandscape}{true}}
      {}
   \iftoggle{@tablelong}{%
      \iftoggle{@tablelandscape}{\landscape}{}
      \begingroup
      \addfontfeatures{Numbers={Tabular,Lining}}
      \@tablefontsize
      \iftoggle{@tablebgscreen}
         {\rowcolors{1}{white}{black!10}}%
         {}%
      \IfStrEqCase{\@tablewidth}{%
         {dynamic}{\begin{longtabu}{#2}}
         {full}{\begin{longtabu} to \linewidth{#2}}
         {wide}{\begin{longtabu} to 130mm{#2}}
         {narrow}{\ClassWarning{brill}{Option narrow not implemented yet!}}
      }[]
         \ifdefvoid{\@tablecaption}{}{%
            \ifdefvoid{\@tableshortcaption}%
               {\caption{\@tablecaption}}%
               {\caption[\@tableshortcaption]{\@tablecaption}}%
            \ifdefvoid{\@tablelabel}{}{\label{\@tablelabel}}%
            \\%
         }%
         \hiderowcolors
         \ifdefvoid{\@tableheaders}%
            {}%
            {%
               \iftoggle{@tablebooktabs}%
                  {%
                     \toprule
                     \@tableheaders%
                     \midrule
                     \endfirsthead
                     \caption*{%
                        \usekomafont{captionlabel}%
                        \MakeLowercase{\tablename}~\thetable:~%
                        \usekomafont{caption}%
                        \@tablecaption~(\textit{cont.})%
                     }\\
                     \toprule
                     \@tableheaders%
                     \midrule
                     \endhead
                     \bottomrule
                     \endlastfoot
                  }{%
                     \firsthline
                     \@tableheaders%
                     \hline
                     \endfirsthead
                     \caption*{%
                        \usekomafont{captionlabel}%
                        \MakeLowercase{\tablename}~\thetable:~%
                        \usekomafont{caption}%
                        \@tablecaption~(\textit{cont.})%
                     }\\
                     \firsthline
                     \@tableheaders%
                     \hline
                     \endhead
                     \lasthline
                     \endlastfoot
                  }%
            }%
         \showrowcolors
         \BODY%
      \end{longtabu}
      \endgroup
      \iftoggle{@tablelandscape}{\endlandscape}{}
   }{%
      \iftoggle{@tablelandscape}
         {\begin{sidewaystable}[\@tableplacement]}%
         {\begin{table}[\@tableplacement]}
         \addfontfeatures{Numbers={Tabular,Lining}}
         \@tablefontsize
         \ifdefvoid{\@tablecaption}{}{%
            \caption{\@tablecaption}%
            \ifdefvoid{\@tablelabel}{}{\label{\@tablelabel}}%
         }%
         \iftoggle{@tablebgscreen}
            {\rowcolors{1}{white}{black!10}}%
            {}%
         \IfStrEqCase{\@tablewidth}{%
            {dynamic}{\begin{tabu}{#2}}
            {full}{\begin{tabu} to \textwidth{#2}}
            {wide}{\begin{tabu} to 130mm{#2}}
            {narrow}{\ClassWarning{brill}{Option narrow not implemented yet!}}
         }[]         
            \hiderowcolors
            \ifdefvoid{\@tableheaders}%
               {}%
               {%
                  \iftoggle{@tablebooktabs}%
                     {%
                        \toprule
                        \@tableheaders%
                        \midrule%
                     }{%
                        \firsthline
                        \@tableheaders%
                        \hline%
                     }%
               }%
            \showrowcolors
            \BODY%
            \iftoggle{@tablebooktabs}%
               {\bottomrule}{\lasthline}%
         \end{tabu}
      \iftoggle{@tablelandscape}
        {\end{sidewaystable}}%
        {\end{table}}%
   }%
}%
\newcommand*{\tabhead}[2][\@tablefontsize]{\bfseries #1}

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
               \setcapindent*{0pt}%
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
\setkomafont{captionlabel}{\normalfont\footnotesize\scshape}
\setkomafont{caption}{\normalfont\footnotesize}
\setcapindent{16mm}
\newlength{\@currentcaplabelwidth}
\AtBeginDocument{
   \renewcommand*{\captionformat}{%
      \Ifstr{\@captype}{figure}
         {\settowidth{\@currentcaplabelwidth}{\figureformat}}%
         {\settowidth{\@currentcaplabelwidth}{\tableformat}}%
      \hspace{\dimexpr 16mm-\@currentcaplabelwidth\relax}}
}%
\renewcommand*{\figureformat}{\MakeLowercase{\figurename}~\thefigure}
\renewcommand*{\tableformat}{\MakeLowercase{\tablename}~\thetable}
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
%TODO: This should probably go into the config file. Take care of loading order.
\ifbrill@printversion
   \RequirePackage[status=final,layout={margin},author={!!!}]{fixme}
\else
   \RequirePackage[status=draft,layout={margin},author={!!!}]{fixme}
\fi%
\RequirePackage[imakeidx]{xindex}
\indexsetup{%
   headers={\MakeMarkcase{\indexname}}{\MakeMarkcase{\indexname}},
   level=\addchap,
   %toclevel=chapter,
   othercode={\RaggedRight\footnotesize}}%
\renewcommand*{\@idxitem}{\par\hangindent 2\normalparindent}%
\renewcommand*{\subitem}{%
   \par\hangindent 2\normalparindent\hspace*{\normalparindent}}%
\renewcommand*{\subsubitem}{%
   \par\hangindent 2\normalparindent\hspace*{\normalparindent}}%
\renewcommand*\indexspace{\par\vskip\baselineskip\relax}%

\ifbrill@showgrid
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
\fi%

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
%%\RequirePackage{glossary-longbooktabs}
\newdimen\widestabbreviation
\setlength{\widestabbreviation}{0pt}

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

\newglossarystyle{brill}{%
   \renewenvironment{theglossary}%
      {\begin{longtabu} to%
       \textwidth{@{}p{\widestabbreviation}@{\hspace*{\normalparindent}}>{\raggedright}X@{}}}%
      {\end{longtabu}}%
   \renewcommand*{\glossaryheader}{}%
   \renewcommand*{\glsgroupheading}[1]{}%
   \renewcommand{\glossentry}[2]{%
      \@checkforwidestabbreviation{##1}%
      \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
      \glossentrydesc{##1}\glspostdescription\space ##2%
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
\renewcommand{\glossarypreamble}{\small}

\setabbreviationstyle{short-nolong}
\renewcommand{\glsnamefont}[1]{\normalfont\mdseries #1}

\RequirePackage{cleveref}
\crefname{subthreesection}{section}{sections}
\crefname{subfoursection}{section}{sections}
\crefname{subfivesection}{section}{sections}

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

%\let\quote\@undefined
%\let\endquote\@undefined
\renewenvironment{quote}%
   {%
    \par\vspace{\baselineskip}%
    \addmargin[2\parindent]{0pt}%
    \ignorespaces%
    \aftergroup\useignorespacesandallpars%
%    \ifstrempty{#1}{}{\def\@source{#1}}
   }%
   {%
%    \ifdef{\@source}{\\*\hspace*{2\parindent}\@source}{}%
    \endaddmargin%
    \par\vspace{\baselineskip}\noindent\ignorespaces%
   }%

\newcommand{\beforeblocktranslation}[1]{%
   \begin{addmargin}[2\parindent]{0pt}%
      #1%
   \end{addmargin}%
   \par\nopagebreak\vspace{\baselineskip}%
}

\newcommand{\linebreakwithindent}{\par\hangindent=1em\hangafter=1\relax}
\newcommand{\blocktransnewline}{%
   \immediate\write\@auxout{%
      \csgdef{blocktrans\currvalblocktrans}{}}%
   \linebreakwithindent%
}

\newcounter{blocktrans}

\newcommand{\blocktranslation}{\@ifstar\@blocktranslation\@@blocktranslation}%
% Starred version
\newcommand{\@blocktranslation}[4][]{%
   \par\noindent%
   \if@splitsplittranslation%
      \ifstrempty{#2}%
         {\begin{enuminlinesplitA}#3\end{enuminlinesplitA}\par\nopagebreak}%
         {\hyphenpenalty=10000\begin{enuminlinesplitA}\ItalicsOrNot{#2}#3\end{enuminlinesplitA}\par\nopagebreak}%
      \if@splittranslation%
         \vspace{\baselineskip}\noindent%
      \else%
         \noindent%
      \fi%
      \ifstrempty{#4}{}{%
         \begin{enuminlinesplitB}
         #4%
         \end{enuminlinesplitB}
      }%
      \ifstrempty{#1}%
         {}%
         {%
            \par\nopagebreak\noindent%
            \begin{addmargin}[2\parindent]{0pt}%
               #1%
            \end{addmargin}%
         }%
   \else%
      {\ifstrempty{#2}{#3}{{\ItalicsOrNot{#2}#3}}}%
      \par\vspace{\baselineskip}\noindent%
      \ifstrempty{#4}{}{#4}%
      \ifstrempty{#1}%
         {}%
         {%
            \par\nopagebreak\noindent%
            \begin{addmargin}[2\parindent]{0pt}%
               #1%
            \end{addmargin}%
         }%
   \fi%
   \par\vspace{\baselineskip}%
}%
% Normal version
\newcommand{\@@blocktranslation}[3]{%
   \refstepcounter{blocktrans}%
   \xdef\currvalblocktrans{\theblocktrans}%
   \begin{displayquote}%
      \let\newline\blocktransnewline%
      \ifstrempty{#1}%
         {\ifstrempty{#2}%
            {\noindent #3}%
            {%
               #2%
               \ifstrempty{#3}{}{%
                  \par\vspace{\baselineskip}\noindent%
                  #3%
               }%
            }%
         }%
         {%
            \ifstrempty{#2}%
            {\ifstrempty{#3}{}{\noindent #3}}%
            {%
               {\ItalicsOrNot{#1}#2}%
               \ifstrempty{#3}%
                  {}%
                  {%
                     \ifcsdef{blocktrans\currvalblocktrans}%
                        {\linebreakwithindent\vspace{\baselineskip}}%
                        {\par\vspace{\baselineskip}\noindent}%
                     #3%
                  }%
            }%
         }%
   \end{displayquote}%
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

\let\@RIGminisec\minisec
\renewcommand{\minisec}[1]{\vspace{\baselineskip}\@RIGminisec{#1}\vspace{\baselineskip}}

\appto{\tableofcontents}{\cleardoubleoddemptypage}
\appto{\frontmatter}{\setcounter{page}{5}} 
\appto{\mainmatter}{%
   \begingroup%
      \let\origwrite\write
      \def\write{\immediate\origwrite}%
      \addtocontents{toc}{\protect\addvspace{2\baselineskip}}%
      \addtocontents{toc}{\protect\setlength{\@addchaptertocskip}{1\baselineskip}}%
   \endgroup%
}

\appto{\backmatter}{%
   \cleardoubleoddemptypage
   \begingroup%
      \let\origwrite\write
      \def\write{\immediate\origwrite}%
      \addtocontents{toc}{\protect\addvspace{2\baselineskip}}%
      \addtocontents{toc}{\protect\setlength{\@addchaptertocskip}{0pt}}%
   \endgroup%
}
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
\brokenpenalty=5000
\vfuzz \hfuzz
\endinput
