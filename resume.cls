% Intro Options
\ProvidesClass{deedy-resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.1cm, vmargin=0.85cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage{enumitem}
\usepackage[framemethod=TikZ]{mdframed}
\usepackage{xcolor} % Make sure you have this package to use colors
\usepackage{hyperref}
\usepackage[none]{hyphenat} % Disable hyphenation
\usepackage{changepage}

% Cite publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

\nopagecolor

% Color definitions
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{lightestgray}{HTML}{f2f2f2}
\definecolor{deepgray}{HTML}{404040}
%\definecolor{deepgray}{HTML}{4a4a4a}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Scale=0.8]{Helvetica Neue Light}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue UltraLight}


% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth

\newcommand{\lastupdated}{
    \begin{textblock}{60}(145,267) % Adjust the second parameter (267) to suit the bottom margin of your page.
    \raggedleft % This right-aligns the text block.
    \color{date}
    \fontspec{Helvetica Neue Light}
    \fontsize{8pt}{9pt}
    \selectfont 
    Last Updated on
    \today
    \end{textblock}
}


% Name command
\newcommand{\namesection}[2]{
    \begin{minipage}[t]{1\textwidth} 
        \fontspec{Helvetica Neue Bold}\fontsize{28pt}{28pt}\selectfont #1 | 
        \fontspec{Helvetica Neue Light}\fontsize{12pt}{12pt}\selectfont #2 \\
    \end{minipage}%
      %  \noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
    \vspace{-10pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{
	\color{headings}
	\scshape
	\fontspec{Helvetica Neue}
	\fontsize{12pt}{18pt}
	\selectfont 
	\raggedright
	\uppercase
}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
	\color{subheadings}
	\fontspec{Helvetica Neue}
	\fontsize{10pt}{10pt}
	\selectfont
	\bfseries
	\uppercase
}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}

\newcommand{\runsubsection}[1]{
	\color{subheadings}
	\fontspec{Helvetica Neue}
	\fontsize{10pt}{10pt}
	\selectfont
	\bfseries
	\uppercase {#1} 
	\normalfont
}

% Descriptors command
\newcommand{\descript}[1]{
	\color{subheadings}
	\raggedright
	\scshape
	\fontspec{Helvetica Neue}
	\fontsize{10pt}{10pt}
	\selectfont {#1 \\} 
	\normalfont 
	\smallbreak
}

% Job Title command
\newcommand{\jobtitle}[1]{
	|
	\hspace{1 pt}
	\color{subheadings}
	\raggedright
	\scshape
	\fontspec{Helvetica Neue}
	\fontsize{10pt}{10pt}
	\selectfont {#1 \\} 
	\normalfont 
	\smallbreak
}

% Date command
\newcommand{\simpledate}[1]{
	\color{headings}
	\raggedright
	\scshape
	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{8pt}
	\selectfont {#1}
	\normalfont
	\newline
	\smallbreak
}

% Date+Location command
\newcommand{\datelocation}[2]{
	\color{headings}
	\raggedright
	\scshape
	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{8pt}
	\selectfont {#1} |
	\raggedright
	\selectfont {#2}
	\vspace{-2pt}
	\normalfont
}

% Skills command
\newcommand{\skills}[1]{
	\color{headings}
	\scshape
	\itemsep2pt 
	\parskip1pt
	\parsep1pt
	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{8pt}
	\selectfont {#1}
	\vspace{4 pt}
	\normalfont
}

% Section seperators command
\newcommand{\sectionsep}[0]{
	\vspace{8pt}
}


% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
	    \begin{itemize}[leftmargin=0pt, labelsep=2pt, align=left, labelwidth=4pt, label={+  }] % Adjust these values as needed

	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{9pt}
	\itemsep4pt 
	\parskip0pt 
	\parsep0pt
}{
	\end{itemize}
	\vspace{2pt}
}

% Define a full-width summary section
\newenvironment{fullwidthsummary}
  {%
    \begin{minipage}[t]{0.85\textwidth} 
    \fontspec{Helvetica Neue Light}
    \fontsize{8pt}{9pt}
    \selectfont
    \end{minipage}
  }
  {%
    \strut % Ensures there is space above and below the text inside the parbox
  }
  
% Define the gray highlight box environment
\newmdenv[
  leftmargin=0pt,
  rightmargin=0pt,
  innerleftmargin=10pt,
  innerrightmargin=10pt,
  innertopmargin=5pt,
  innerbottommargin=5pt,
  backgroundcolor=lightestgray, % Adjust the color as needed
  skipabove=\parskip,
  skipbelow=\parskip,
  linewidth=0pt
]{grayhighlight}
\BeforeBeginEnvironment{grayhighlight}{
\addfontfeature{Color=black}
\hypersetup{urlcolor=black}
}
\AfterEndEnvironment{grayhighlight}{
} % or whatever your default color is

% Store the original title format for section
\newcommand{\oldsectionformat}{}
\let\oldsectionformat=\section

% Define the gray highlight box environment
\newmdenv[
  leftmargin=0pt,
  rightmargin=0pt,
  innerleftmargin=10pt,
  innerrightmargin=10pt,
  innertopmargin=5pt,
  innerbottommargin=10pt,
  backgroundcolor=deepgray, % Adjust the color as needed
  fontcolor=white,
  skipabove=\parskip,
  skipbelow=\parskip,
  linewidth=0pt
]{blackhighlight}

\BeforeBeginEnvironment{blackhighlight}{
\addfontfeature{Color=white}
\hypersetup{urlcolor=white}
  % Redefine the section command for white color within blackhighlight
  \titleformat{\section}{
    \color{white} % Set color to white
    \scshape
    \fontspec{Helvetica Neue}
    \fontsize{12pt}{18pt}
    \selectfont 
    \raggedright
    \uppercase
  }{}{0em}{}
}

\AfterEndEnvironment{blackhighlight}{
  % Reset the section format to its original
  \titleformat{\section}{
    \color{headings} % Set back to the original color or whatever it was
    \scshape
    \fontspec{Helvetica Neue}
    \fontsize{12pt}{18pt}
    \selectfont 
    \raggedright
    \uppercase
  }{}{0em}{}
}

% Custom tabular environment for consistent font size
\newenvironment{customtabular}{
    \fontspec{Helvetica Neue Light}
    \fontsize{8pt}{10pt}
    \selectfont
    \noindent\begin{tabular}{@{}ll} % "ll" for two left-aligned columns, @{} removes padding
}{
    \end{tabular}
}

\newenvironment{unbreakable}
  {\begin{minipage}{\linewidth}}
  {\end{minipage}}


