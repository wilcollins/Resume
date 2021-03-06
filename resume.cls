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
\usepackage[hmargin=1.1cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}

% Cite publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Scale=0.8]{Helvetica Neue Light}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue UltraLight}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth

\newcommand{\lastupdated}{
	\begin{textblock}{60}(155,0)
	\color{date}
	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{9pt}
	\selectfont 
Last Updated on
	\today
	\end{textblock}
}


% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
		\fontspec{Helvetica Neue UltraLight}
		\fontsize{32pt}{10cm}
		\selectfont #1 
		\fontspec{Helvetica Neue Light}
		\selectfont #2
	} \\
	\vspace{5pt}
	\centering{ 
		\color{headings}
		\fontspec{Helvetica Neue Light}
		\fontsize{10pt}{10pt}
		\selectfont #3
	}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-15pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{
	\color{headings}
	\scshape
	\fontspec{Helvetica Light}
	\fontsize{12pt}{18pt}
	\selectfont 
	\raggedright
	\uppercase
}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
	\color{subheadings}
	\fontspec{Helvetica Neue Bold}
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
	\vspace{4 pt}
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
	\fontsize{9pt}{9pt}
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
	\vspace{-\topsep}
	\begin{itemize}
	\fontspec{Helvetica Neue Light}
	\fontsize{8pt}{8pt}
	\itemsep3pt 
	\parskip0pt 
	\parsep0pt
}{
	\end{itemize}
	\vspace{
		-\topsep
	}
}
