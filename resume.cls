%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2014/08/16 Example class]

%%Preliminary definitions, needed by the options


%%This parts handles the options passed to the class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

% Packages
\usepackage{titlesec} % Needed to adjust section title
\usepackage{xcolor} % Adds colors
\usepackage{ifthen} % Adds if else statements
\usepackage{etoolbox} % Adds better if else statements? Todo
\usepackage[hidelinks]{hyperref} % Add hyperlinks without changing text or box color
% \usepackage{tabularx}
\usepackage{geometry} % Adjust page margins
\geometry{
	top=0.6in,
	bottom=0.6in,
	left=0.75in,
	right=0.75in,
}


% define constants
\definecolor{headline}{HTML}{4481be}
\newcommand{\headlinecolor}{\color{headline}}
\newcommand{\separator}{$|$ }

% Change section title appearance TODO
\titleformat{\section}{
  \headlinecolor\vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\headlinecolor\titlerule \vspace{-5pt}]


% Make Title
\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Define name variable
\newcommand{\address}[4]{\renewcommand{\address}{#1 #2 \separator #3 #4}} % Define address variable
\newcommand{\contact}[2]{\renewcommand{\contact}{#1 \separator #2}} % Define name variable

\let \@linkone \relax % Define Variables for links (can't create list)
\let \@linktwo \relax
\let \@linkthree \relax
\newcommand{\link}[2]{ % Set a new variable each time link gets called, until it reaches the 3rd one
	\@ifundefined{@linkone}{
		\def \@linkone {\href{#2}{#1}}
	}{
		\@ifundefined{@linktwo}{
			\def \@linktwo {\href{#2}{#1}}
		}{
			\def \@linkthree {\href{#2}{#1}}
		}
	}
}

\newcommand{\printlinks}{ % prints all link variables, that were set
    \@ifundefined{@linkone}{}{\@linkone}
	\@ifundefined{@linktwo}{}{ \separator \@linktwo}
	\@ifundefined{@linkthree}{}{ \separator \@linkthree}
}

\renewcommand{\maketitle}{ % redfine maketitle
    \begin{center}
        \textcolor{headline}{\textbf{\Huge \scshape \name}} \\ \vspace{1pt}
        \small 
        \address \\
        \contact \\
        \printlinks \\

    \end{center}
}

% New sections
\newenvironment{cvsection}[1]
{
    \section{#1}
    % \begin{itemize}[leftmargin=0.15in, label={}]
    \begin{list}{}{
        \setlength{\leftmargin}{1.5em}
    }
    \item[]
}
{ 
    % \end{itemize}
    \end{list}
}

\newenvironment{cvsubsection}[3]{ % 4 parameters: company name, year(s) employed, job title and location
    % \vspace{-2pt}
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
	\textbf{#1} & #2 \\
	\ifstrempty{#3}{}{ % ToDO fix empty line, when #3 empty
	    \textit{\small#3} & \\
	}%
    \end{tabular*}\vspace{-0.5em}
    % \smallskip % Vertical whitespace
    \begin{list}{$\cdot$}{} % \cdot used for bullets, no indentation
	\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
    \item[]
}{
	\end{list}
}

\newenvironment{cvproject}[3]{
    % \vspace{-2pt}
    % \smallskip % Vertical whitespace
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \small \textbf{#1} $|$ \emph{#2} & #3 \\
    \end{tabular*}\vspace{-0.5em}

    \begin{list}{$\cdot$}{} % \cdot used for bullets, no indentation
	\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
    \item[]
}{
    \end{list}
}

\newenvironment{cvskills}{
    % \vspace{-2pt}
    % \smallskip % Vertical whitespace
    \begin{tabular*}{0.97\textwidth}{l@{\hskip 1cm}l}
}{
    \end{tabular*}
}

\newcommand{\cvskill}[2]{
    \textbf{#1} & #2 \\
}


%\setlength{\textwidth}{17.5cm}
%\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0} % remove sections numbering
\pagenumbering{gobble} % remove page numbering
\pdfgentounicode=1

