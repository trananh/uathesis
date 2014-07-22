%% This LaTeX 2e Class file is the culmination of a large amount of
%% work over more than a decade by graduate students in the Department
%% of Planetary Sciences at The University of Arizona.
%%
%%
%% Peter Halverson	1989 (non-LPL)
%% William D. Sears	1994
%% Rov Vervack		1996
%% Andrew Rivkin	1997
%% Joe Spitale		2001
%% Dave O'Brien		2003
%% Ross A. Beyer	2004
%% Jim Richardson	2005
%% Terry Hurford	2005
%% Curtis S. Cooper	2007
%% David A. Minton  2009
%% Anh X. Tran		2013 (CS)
%%
%%
%% Todo:
%% Currently footskip is zero.  This should be looked into.
%%
%% This class file now spans two minor revs of the book.cls file:
%% 2001/04/21 v1.4e  and  2004/02/16 v1.4f  we should probably go
%% in and make everything consistent with the most recent rev, but
%% since they aren't too different, I'm guessing things will work
%% for a while.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uathesis}[2013/07/03 University of Arizona Thesis Class]

\RequirePackage{ifthen}
\RequirePackage{cclicenses} % This is used to generate the Creative Commons
									 % icons.  cclicenses.sty should be present along
									 % with this file.  If you don't plan on using a
									 % CC license, you can remove this.


%% This class file will be based off of the book class, no need to
%% reinvent the wheel.  However, we need to set up some options that
%% are specific to the various kinds of theses.

% Set a default for ThesisType, just in case
\newcommand{\ThesisType}{\emph{(please specify thesis, dissertation, or document as an option in the uathesis documentclass statement at the top of your file)}}

\DeclareOption{thesis}{%
	\renewcommand{\ThesisType}{Thesis}
}

\DeclareOption{dissertation}{%
	\renewcommand{\ThesisType}{Dissertation}
}

\DeclareOption{document}{%
	\renewcommand{\ThesisType}{Document}
}

\newboolean{Proposal}
\setboolean{Proposal}{false}
\DeclareOption{proposal}{%
	\renewcommand{\ThesisType}{Proposal}
	\setboolean{Proposal}{true}
}

\DeclareOption{dissertation-proposal}{%
	\renewcommand{\ThesisType}{Dissertation Proposal}
	\setboolean{Proposal}{true}
}

\DeclareOption{thesis-proposal}{%
	\renewcommand{\ThesisType}{Thesis Proposal}
	\setboolean{Proposal}{true}
}

\newboolean{Copyright}
\setboolean{Copyright}{false}
\DeclareOption{copyright}{%
	\setboolean{Copyright}{true}
}

% This next bit could probably be made more elegant
% Code for including Creative Commons licenses
\newboolean{CCBY}
\setboolean{CCBY}{false}
\newboolean{CCBYSA}
\setboolean{CCBYSA}{false}
\newboolean{CCBYND}
\setboolean{CCBYND}{false}
% as of Januare 2009, the UA license grants the University the 
% non-exclusive right to display and distribute your dissertation 
% as an open access work and include it in the Networked
% Digital Library of Theses and Dissertations (http://www.ndltd.org/).
% UMI/ProQuest includes it in Dissertations Abstracts and makes copies
% available for sale.  Therefore the NC licences are not compatible and
% are not included here. (from a correspondence with Dan Lee
% Interim Team Leader for Undergraduate Services and Copyright Librarian 
% University of Arizona Libraries leed@u.library.arizona.edu) 
\DeclareOption{CC-BY}{%
	\setboolean{CCBY}{true}
}
\DeclareOption{CC-BY-SA}{%
	\setboolean{CCBYSA}{true}
}
\DeclareOption{CC-BY-ND}{%
	\setboolean{CCBYND}{true}
}

\newboolean{GeneratedOn}
\setboolean{GeneratedOn}{false}
\DeclareOption{generatedon}{%
	\setboolean{GeneratedOn}{true}
} % This option puts the generation date on the titlepage.


%% These next four options are for passing through to the book class.
\DeclareOption{oneside}{%
	\PassOptionsToClass{\CurrentOption}{book}%
}

\DeclareOption{twoside}{%
	\PassOptionsToClass{\CurrentOption}{book}%
} 

\DeclareOption{openright}{%
	\PassOptionsToClass{\CurrentOption}{book}%
}

\DeclareOption{openany}{%
	\PassOptionsToClass{\CurrentOption}{book}%
}

\DeclareOption*{%
	\ClassWarning{uathesis}{Unknown option `\CurrentOption'}%
} % A general warning for unknown options.


\ExecuteOptions{oneside,openright} % this provides a default option list

\ProcessOptions\relax
\LoadClass[12pt]{book}

%% Okay, now that the options are set and the book class is loaded in,
%% we now need to start detailing how we want this to be different than
%% the book class.

% We use \sloppy to suppress word division and permit larger interword
% spacing so that lines are broken between words.
\sloppy

%%---------------------------- Global Settings ------------------------

%% Page Style to put numbers at the top.
\pagestyle{myheadings}

%% Double spaced 
%% (in order to conserve paper, we'll actually make this less than 2)
\renewcommand{\baselinestretch}{1.4}


%% Set margins for the bulk of the dissertation (referred to as Body of Paper).
%% There are only two pages that have different margins: the Title Page, 
%% and the Statement by Author page.  Fortunately, their left and right
%% margins are identical, and the top and bottom margins are greater, so
%% we'll just throw in some extra vspace in those places.
\setlength{\topmargin}{0in}			% = 1in because LaTeX adds 1in
\setlength{\headheight}{12pt}		% Height of page numbers
\setlength{\headsep}{0.5in}			% Distance from top of pagenum to text.
\addtolength{\headsep}{-\headheight}% Adjustment for height of pagenumber.
\setlength{\topskip}{12pt}			% This is the height of the text.
\setlength{\footskip}{0in}			% ???
\setlength{\oddsidemargin}{0.5in}	% = 1.5in because LaTeX adds 1in
\setlength{\evensidemargin}{0in}	% = 1in because LaTeX adds 1in

\setlength{\textheight}{8.4in}		% should be 8.5in, see below
\setlength{\textwidth}{5.9in}		% should be 6in  but we're being 
									% conservative, just to be safe.
			

% Make sure that various key names are in all caps.
\renewcommand{\partname}{PART}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{REFERENCES}

% Proposals don't use chapters
\ifthenelse{\boolean{Proposal}}{\renewcommand{\chaptername}{}}{}

%%---------------------------- General Renewed Commands----------------
%% 
%% There are several key and subtle LaTeX commands that need to be
%% altered in minor ways from the way they are defined in book.cls.
%% This section 'renew's or redefines them for our use.  In all other
%% sections of this class file, we have strived to use the abstract
%% generic LaTeX commands rather than the more direct (and potentially
%% dangerous) TeX commands.  Since this section renews commands taken
%% from the LaTeX book class file, we follow the (less strict) conventions
%% in that file, so that we are making the minimal changes to these
%% commands to make them work for us.

% We are renewing the following two commands so that there are
% appropriate dot leaders between the TOC item and that TOC item's
% page number.  We replaced the \hfil line with a sequence of commands 
% taken from the latex.ltx file for \@dottedtocline (instead of just
% using \dotfill which gave dots with a slightly different spacing).
% Similarly, we left the page numbers bold, rather than making them
% normalfont.
% 
% The lines that were altered are still present below, but commented out.
% Hopefully this will make it easier to integrate with future versions
% of these commands in LaTeX.
%
% It appears that the formatters no longer want to allow any boldfacing
% in TOC-related items, so \bfseries items have been commented out 
% below.
%
% Otherwise these two commands are identical to those in the 
% 2001/04/21 v1.4e book.cls.
%
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       %\large \bfseries %#1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
	   {#1}\nobreak \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
       %\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}%
       \hb@xt@\@pnumwidth{\hfil \normalcolor #2}%
       \par}
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
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      %#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      {#1}\nobreak \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
      %\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}%
      \hb@xt@\@pnumwidth{\hfil \normalcolor #2}%
      \par
      \penalty\@highpenalty
    \endgroup
  \fi}

% We renewed the following command so that the chapter level items in
% the TOC have the correct word (nothing|Chapter|Appendix) in front of
% them.
%
% Otherwise this command is identical to \def\@chapter in the 
% 2001/04/21 v1.4e book.cls.
\renewcommand\@chapter[2][\#2]{\ifnum \c@secnumdepth >\m@ne
	   \if@mainmatter
	     \refstepcounter{chapter}%
	     \typeout{\@chapapp\space\thechapter.}%
	     \addcontentsline{toc}{chapter}%
	               %{\protect\numberline{\thechapter}#1}%
	               {\@chapapp\space\protect\numberline{\thechapter}#1}%
	   \else
	     \addcontentsline{toc}{chapter}{#1}%
	   \fi
	\else
	  \addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\if@twocolumn
	  \@topnewpage[\@makechapterhead{#2}]%
	\else
	  \@makechapterhead{#2}%
	  \@afterheading
	\fi}

% In the same vein as above, the following was renewed so that part
% level items in the TOC will have the correct word.  Similarly, font
% size and bolding are removed to stay consistent with TOC.
%
% Otherwise this command is identical to \def\@part in the 
% 2004/02/16 v1.4f book.cls
\renewcommand\@part[2][\#2]{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}%{\thepart\hspace{1em}#1}%
		{\partname\space\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       %\huge\bfseries \partname\nobreakspace\thepart
       \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     %\Huge \bfseries #2\par}%
     #2\par}%
    \@endpart}


% We renewed the following commands so that when the chapter headings are
% printed out on the first page of the chapter, they are the same font
% size as in the TOC, as per the requirements.  Additionally, the text
% starts right at the top of the page, and the headings are centered.
% These two aren't required, but help set these items off.
%
% It appears that the formatters no longer want to allow any boldfacing
% in TOC-related items, to eh \bfseries items have been commented out 
% below.
%
% Otherwise this command is identical to \def\@makechapterhead and
% \def\@makeschapterhead in the 2001/04/21 v1.4e book.cls.
\renewcommand{\@makechapterhead}[1]{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
  	\begin{center}
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        %\huge\bfseries \@chapapp\space \thechapter
        %\bfseries \@chapapp\space \thechapter
        \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    %\Huge \bfseries #1\par\nobreak
    %\bfseries #1\par\nobreak
    #1\par\nobreak
	\end{center}
    \vskip 40\p@
  }}

\renewcommand{\@makeschapterhead}[1]{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright
  	\begin{center}
    \normalfont
    \interlinepenalty\@M
    %\Huge \bfseries  #1\par\nobreak
    %\bfseries  #1\par\nobreak
    #1\par\nobreak
	\end{center}
    \vskip 40\p@
  }}


% Proposals don't use chapters so we'll treat similarly to sections.
% We'll redefine the makechapterhead and makeschapterhead commands
% again to put the chapter number and heading on the same line.
%
% Otherwise this command is identical to \def\@makechapterhead and
% in the 2001/04/21 v1.4e book.cls.
\ifthenelse{\boolean{Proposal}}{
  \renewcommand{\@makechapterhead}[1]{%
    %\vspace*{50\p@}%
    {\parindent \z@ \raggedright \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          %\huge\bfseries \@chapapp\space \thechapter.\space
          %\bfseries \@chapapp\space \thechapter.\space
          \@chapapp\space \thechapter~~%
        \fi
      \fi
      \interlinepenalty\@M
      %\Huge \bfseries #1\par\nobreak
      %\bfseries #1\par\nobreak
      #1\par\nobreak
      \vskip 20\p@
    }}
  \renewcommand{\@makeschapterhead}[1]{%
    %\vspace*{50\p@}%
    {\parindent \z@ \raggedright
      \normalfont
      \interlinepenalty\@M
      %\Huge \bfseries  #1\par\nobreak
      %\bfseries  #1\par\nobreak
      #1\par\nobreak
      \vskip 20\p@
    }}
  }{}


% We renewed the chapter command simply so that we could comment out the
% pagestyle and put in the empty \markboth.  We want the page numbers (even 
% on the first page of a chapter) to be in the header.  Similarly, in the
% TOC, LOT, and LOF (the only sections with page headers) we don't want
% headers on the first page.
%
% Otherwise this command is identical to \newcommand\chapter
% in the 2004/02/16 v1.4f book.cls

\renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    %\thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
					\markboth{}{}					% <--added
                    \secdef\@chapter\@schapter}


% Same as above, but for the part command, otherwise identical to 
% \newcommand\part in the 2004/02/16 v1.4f book.cls
\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  %\thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \markboth{}{}					% <--added
  \null\vfil
  \secdef\@part\@spart}

% The following two commands were renewed so that these items don't 
% have a larger font size than everything else.  Not required, but it
% makes things fit in since the chapter title can't be big.
%
% A note on bold sections: The default below is how Grad College wants
% it.  This way sections are in the same font and face as they appear
% in the TOC (we could have done it the other way around and made the
% sections in the TOC bold, but then every entry in the TOC would be
% boldface, and that would look dumb, too).  This class file forces
% compliant behavior.  However, I think that it significantly improves
% the readability of the document if the section titles within the
% text are in boldface.  So in the following two commands, you'll see
% a commented out line that says "<-- makes section bold".  Uncomment
% that, and comment out the line below it to get boldface sections,
% if you want.
% 
% Otherwise this command is identical to the \section and \subsection
% newcommands in the 2001/04/21 v1.4e book.cls.
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
							{-3.5ex \@plus -1ex \@minus -.2ex}%
							{2.3ex \@plus.2ex}%
							%{\normalsize\bfseries}} %<-- makes section bold
							{\normalsize}}
							%{\normalfont\Large\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
							{-3.25ex\@plus -1ex \@minus -.2ex}%
							{1.5ex \@plus .2ex}%
							%{\normalsize\bfseries}} %<-- makes subsection bold
							{\normalsize}}
							%{\normalfont\large\bfseries}}

% The following four commands were renewed so that text in the body
% and captions of figures and tables will be single spaced and not
% get the document's default spacing.
%
% Otherwise this command is identical to the \figure and \table
% newenvironments in the 2001/04/21 v1.4e book.cls.

\renewenvironment{figure}
	{
	\renewcommand{\baselinestretch}{1}	% single spaced here
	\small\normalsize					% size switch to make the spacing behave
	\@float{figure}}
	{\end@float}


\renewenvironment{figure*}
	{
	\renewcommand{\baselinestretch}{1}	% single spaced here
	\small\normalsize					% size switch to make the spacing behave
	\@dblfloat{figure}}
	{\end@dblfloat}

\renewenvironment{table}
	{
	\renewcommand{\baselinestretch}{1}	% single spaced here
	\small\normalsize					% size switch to make the spacing behave
	\@float{table}}
	{\end@float}

\renewenvironment{table*}
	{
	\renewcommand{\baselinestretch}{1}	% single spaced here
	\small\normalsize					% size switch to make the spacing behave
	\@dblfloat{table}}
	{\end@dblfloat}


%% These commands give us values for strings that we will use 
%% more than once in the commands below.

\newcommand{\completetitle}[1]{%
\newcommand{\CompleteTitle}{#1}
}

\newcommand{\fullname}[1]{%
\newcommand{\FullName}{#1}
}

\newcommand{\degreename}[1]{%
\newcommand{\DegreeName}{#1}
}


%%---------------------------- Title Page -----------------------------
%%
%% \maketitlepage{Title}{Author}{degree title}{Department}{y e a r}
%%
%% options are	#1 = Title
%%				#2 = Author
%%				#3 = degree title
%%				#4 = Department
%%				#5 = year

\newcommand{\maketitlepage}[2]{%

% This bracket begins an unnamed environment in which we will temporarily
% override the document's page style.
{
\thispagestyle{empty}				% no page number on title page
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

\vspace*{0.25in}	% This accounts for the larger top margin.  You'd think
\begin{center}		%	this would be 1in, but that pushes it down too far?
{\large\MakeUppercase{\CompleteTitle}}	% Title text

\bigskip

\bigskip

by

\bigskip

\FullName							% Author
\vspace{.75in}

\rule{2.25in}{1pt}\\

% This puts in the Copyright statement
\ifthenelse{\boolean{Copyright}}{\footnotesize~~~Copyright \copyright\ \FullName\ #2}{}	
% Creative Commons licenses	
\ifthenelse{\boolean{CCBY}}{\footnotesize\cc \by Creative Commons Attribution 3.0 License}{}		
\ifthenelse{\boolean{CCBYSA}}{\footnotesize\cc \bysa Creative Commons Attribution-Share Alike 3.0 License}{}		
\ifthenelse{\boolean{CCBYND}}{\footnotesize\cc \bynd Creative Commons Attribution-No 
Derivative Works 3.0 License}{}
\small\normalsize					% size switch to make the spacing behave

\vspace{0.5in}

A \ThesisType\ Submitted to the Faculty of the

\bigskip
\bigskip

\MakeUppercase{#1}					% Department

\bigskip
\bigskip

In Partial Fulfillment of the Requirements\\
\bigskip
For the Degree of

\bigskip
\bigskip

\MakeUppercase{\DegreeName}					% Degree Title

\bigskip
\bigskip

In the Graduate College

\bigskip
\bigskip

THE UNIVERSITY OF ARIZONA

\vfill
\ifthenelse{ \boolean{GeneratedOn} }
{This draft was generated on \today.}
{#2}								% Year
\vspace{0.5in} % This accounts for the 0.5in larger bottom margin on this page.
\end{center}
}

}


%%---------------------------- Approval Form --------------------------
%% 
%% This creates the Committee Approval form, the arguments are as
%% follows:	#1	defense date
%%			#2	Dissertation Director's name
%%			#3	1st committee member's name
%%			#4	2nd committee member's name
%%			#5	3rd committee member's name
%%			#6	4th committee member's name
%%			#7	5th committee member's name

\newcommand{\approval}[7]{%

{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize	

\ifthenelse{\boolean{Proposal}}{%
  % Proposal's headings aren't centered by default and have smaller spacing
  \chapter*{\center THE UNIVERSITY OF ARIZONA\\GRADUATE COLLEGE}\vskip 30\p@
}{%
  \chapter*{THE UNIVERSITY OF ARIZONA\\GRADUATE COLLEGE}
}


As members of the Dissertation Committee, we certify that we have
read the \MakeLowercase{\ThesisType} prepared by \FullName,
titled \CompleteTitle~and recommend that it be accepted as fulfilling the
\MakeLowercase{\ThesisType} requirement for the Degree of \DegreeName.

% Before the final oral defense you must obtain the Approval Pages
% from the Degree Certification Office. Original signatures are
% required on both final copies.  That means print out the Approval
% Forms (one for each copy of the \ThesisType) on the nice acid-free
% paper and get original signatures on each one.  Do this at your
% defense to keep from having to do another signature round-up later
% on.

\vfill

\bigskip
\begin{flushleft}
\begin{tabular*}{\textwidth}{p{4in}@{\extracolsep{\fill}}l}
	& Date: #1	\\
\cline{1-1}
#3	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#4	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#5	& 			\\
	& 			\\
	& 			\\
	& Date: #1	\\
\cline{1-1}
#6	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#7	& 			\\
\end{tabular*}
\end{flushleft}

\ifthenelse{\boolean{Proposal}}{}{
\vfill

\noindent Final approval and acceptance of this \MakeLowercase{\ThesisType} is
contingent upon the candidate's submission of the final copies of the
\MakeLowercase{\ThesisType} to the Graduate College.

\bigskip
}

\noindent I hereby certify that I have read this \MakeLowercase{\ThesisType} prepared
under my direction and recommend that it be accepted as fulfilling the 
\MakeLowercase{\ThesisType} requirement.

\vfill

\bigskip
\begin{flushleft}
\begin{tabular*}{\textwidth}{p{4in}@{\extracolsep{\fill}}l}
							& Date: #1	\\
\cline{1-1}
Dissertation Director: #2	&			\\
\end{tabular*}
\end{flushleft}
\vspace{0.5in} % This accounts for the 0.5in larger bottom margin on this page.
}

}


%%---------------------------- Statement by Author --------------------
%% \statementbyauthor
%%

\newcommand{\statementbyauthor}[1][\emph{Put your Thesis Director's name and title into square brackets, [], after the statementbyauthor command}]{

%% This bracket begins an unnamed environment in which we will temporarily
%% override the document's page style.
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

% The vspace in the chapter command below accounts for the extra 1in of 
% margin at the top needed for this page (total should be 2.5in).
\ifthenelse{\boolean{Proposal}}{%
  % Proposal's headings aren't centered by default and have smaller spacing
  \chapter*{\center\vspace*{1in}STATEMENT BY AUTHOR}\vskip 30\p@
}{%
  \chapter*{\vspace*{1in}STATEMENT BY AUTHOR}
}


This \MakeLowercase{\ThesisType} has been submitted in partial
fulfillment of requirements for an advanced degree at the University
of Arizona and is deposited in the University Library to be made
available to borrowers under rules of the Library.

\bigskip

\noindent Brief quotations from this \MakeLowercase{\ThesisType} are allowable
without special permission, provided that accurate acknowledgment
of the source is made.  
\ifthenelse{ \boolean{Copyright} }
{Requests for permission for extended quotation 
from or reproduction of this manuscript in whole or in part may be 
granted by the copyright holder.}
{\ifthenelse{ \boolean{CCBY} }
{This work is licensed under the Creative Commons Attribution 3.0 
United States License. To view a copy of this license, visit 
\href{http://creativecommons.org/licenses/by/3.0/us/}
{http://creativecommons.org/licenses/by/3.0/us/} or send a letter to 
Creative Commons, 171 Second Street, Suite 300, San Francisco, 
California, 94105, USA.} 
{\ifthenelse{ \boolean{CCBYSA} }
{This work is licensed under the Creative Commons Attribution-Share 
Alike 3.0 United States License. To view a copy of this license, visit
\href{http://creativecommons.org/licenses/by-sa/3.0/us/}
{http://creativecommons.org/licenses/by-sa/3.0/us/} or send a letter to 
Creative Commons, 171 Second Street, Suite 300, San Francisco, 
California, 94105, USA.}
{\ifthenelse{ \boolean{CCBYND} }
{This work is licensed under the Creative Commons Attribution-No 
Derivative Works 3.0 United States License. To view a copy of this 
license, visit \href{http://creativecommons.org/licenses/by-nd/3.0/us/}
{http://creativecommons.org/licenses/by-nd/3.0/us/} or send a letter to 
Creative Commons, 171 Second Street, Suite 300, San Francisco, 
California, 94105, USA.}
	{Requests for permission for extended quotation from or reproduction 
	of this manuscript in whole or in part may be granted by the head of 
	the major department or the Dean of the Graduate 
	College when in his or her judgment the proposed use of the 
	material is in the interests of scholarship.  In all other 
	instances, however, permission must be obtained from the author.}
}}}

\vspace{1in}

\begin{flushleft}
\begin{tabular*}{\textwidth}{p{2.5in}@{\extracolsep{\fill}}rp{2.5in}}
\ifthenelse{ \equal{\ThesisType}{Thesis} }
{
							& SIGNED:	& 	\\
\cline{3-3}
							&			& \hfill \FullName	\\
} {
							& SIGNED:	& \FullName	\\
}
\end{tabular*}
\end{flushleft}

% If this is a Thesis, we need a permission and date statement.
\ifthenelse{ \equal{\ThesisType}{Thesis} }
{
\vfill
\begin{center}
APPROVAL BY THESIS DIRECTOR

\bigskip

This thesis has been approved on the date shown below:

\vspace{0.75in}

\begin{minipage}[t]{4in}
\begin{center}
\hrulefill

#1
%Jane M. Doe\\
%Professor of Chemistry
\end{center}
\end{minipage}
\hfill
\begin{minipage}[t]{1.75in}
\begin{center}
\hrulefill

Date
\end{center}
\end{minipage}


\end{center}
}

}

}


%%---------------------------- Acknowledgements -----------------------
%%
%% This command includes the file that contains the acknowledgements.
%% 
%% \incacknowledgements
%% Option is #1 = acknowledgements file name
%%

\newcommand{\incacknowledgements}[1]{

% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style.
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

\chapter*{ACKNOWLEDGEMENTS}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the acknowledgements.}}
	{Couldn't find #1.tex to include as your acknowledgements.}

}
}


%%---------------------------- Dedication -----------------------------
%%
%% This command includes the file that contains the dedication.
%%
%% \incdedication
%% Option is #1 = dedication file name
%%

\newcommand{\incdedication}[1]{

\chapter*{DEDICATION}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the dedication.}}
	{Couldn't find #1.tex to include as your dedication.}

}


%%---------------------------- Abstract -------------------------------
%%
%% This command includes the file that contains the abstract.
%%
%% \incabstract
%% Option is #1 = abstract file name
%%

\newcommand{\incabstract}[1]{

\chapter*{ABSTRACT}
\addcontentsline{toc}{chapter}{ABSTRACT}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the abstract.}}
	{Couldn't find #1.tex to include as your abstract.}

}


%%---------------------------- Special Abstract -----------------------
%%
%% This command includes the file that contains the abstract, but it
%% also allows for extra information to be placed in the header for
%% the special abstract.
%%
%% \incspecialabstract
%% Options are	#1 = abstract file name
%% 				#2 = Title
%%				#3 = Author, Ph.D.
%%				#4 = year
%%				#5 = Thesis Director (needed for everything or just Masters?)
\newcommand{\incspecialabstract}[5]{

\thispagestyle{empty}				% no page number on these pages

\begin{center}
{\large\MakeUppercase{#2}}

\bigskip

\renewcommand{\baselinestretch}{1}	% single spaced to end of paragraph.
\small\normalsize					% size switch to make the spacing behave
#3\\
The University of Arizona, #4

\end{center}

\noindent Director: #5

\bigskip

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the special abstract.}}
	{Couldn't find #1.tex to include as your special abstract.}
}


%%---------------------------- Table of Contents ----------------------
%% 
%% The table of contents that the UofA wants is subtley different in a
%% number of ways such that we need to redefine the \tableofcontents
%% command provided by the basic LaTeX classes.  Many of the commands
%% here are confusing, but were taken from the LaTeX book.cls class
%% file with the following date and version stamp: 2001/04/21 v1.4e
%%
\renewcommand{\tableofcontents}{

\addtolength{\headsep}{0.5in}		% These adjust things for the running
\addtolength{\textheight}{-0.5in}	% headers for TOC, LOF, LOT.

% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

\if@twocolumn					% \
	\@restonecoltrue\onecolumn	%  \
\else							% 	> Taken from book.cls
	\@restonecolfalse			%  /
\fi								% /

% vspace added to account for the TOC, LOF, & LOT running header business.
\chapter*{\vspace*{-0.5in}\contentsname}

% \markboth{	\protect\raisebox{-0.5in}{\textbf{\emph{\contentsname} -- Continued}\hspace{1.5in}} }{
% 			\protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\contentsname} -- Continued}} }
\markboth{	\protect\raisebox{-0.5in}{{\emph{\contentsname} -- Continued}\hspace{1.5in}} }{
			\protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\contentsname} -- Continued}} }

\@starttoc{toc}%
\if@restonecol\twocolumn\fi		% Taken from book.cls
}
}



%%---------------------------- List of Figures ------------------------
%% 
%% The U of A List of Figures requires a running header on subsequent
%% pages that we must define here.  We also add this section to the TOC.
%% This was modified from the definition for listoffigures from 
%% 2001/04/21 v1.4e book.cls.
%%
\renewcommand{\listoffigures}{%
% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
	% vspace added to account for the TOC, LOF, & LOT running header business.
    \chapter*{\vspace*{-0.5in}\listfigurename}%

	% \markboth{\protect\raisebox{-0.5in}{\textbf{\emph{\listfigurename} -- Continued}\hspace{1.5in}} }{
	% 		  \protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\listfigurename} -- Continued}} }
	\markboth{\protect\raisebox{-0.5in}{{\emph{\listfigurename} -- Continued}\hspace{1.5in}} }{
			  \protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\listfigurename} -- Continued}} }

	\addcontentsline{toc}{chapter}{\listfigurename}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
}
}

%%---------------------------- List of Tables -------------------------
%% 
%% The U of A List of Tables requires a running header on subsequent
%% pages that we must define here.  We also add this section to the TOC.
%% This was modified from the definition for listoffigures from 
%% 2001/04/21 v1.4e book.cls.
%%
\renewcommand{\listoftables}{%
% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
	% vspace added to account for the TOC, LOF, & LOT running header business.
    \chapter*{\vspace*{-0.5in}\listtablename}%

	% \markboth{\protect\raisebox{-0.5in}{\textbf{\emph{\listtablename} -- Continued}\hspace{1.5in}} }{
	% 		  \protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\listtablename} -- Continued}} }
	\markboth{\protect\raisebox{-0.5in}{{\emph{\listtablename} -- Continued}\hspace{1.5in}} }{
			  \protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\listtablename} -- Continued}} }

	\addcontentsline{toc}{chapter}{\listtablename}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
}

\clearpage
\addtolength{\headsep}{-0.5in}		% Un-adjust things for the running
\addtolength{\textheight}{0.5in}	% headers for TOC, LOF, LOT.
}
