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
\usepackage[export]{adjustbox}
\usepackage{graphicx} % For adding images
\usepackage{geometry} % Adjust page margins
\geometry{
    top=0.6in,
    bottom=0.6in,
    left=0.75in,
    right=0.75in,
}

% Import Variables and Colors
\usepackage{sharedvariables}

% Change section title appearance
\titleformat{\section}{
  \maincolor\vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\maincolor\titlerule \vspace{-5pt}]


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

\renewcommand{\maketitle}{ % redefine maketitle
    \begin{center}
        \textcolor{maincolor}{\textbf{\Huge \scshape \name}} \\ \vspace{1pt}
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
    \begin{list}{}{
        \setlength{\leftmargin}{1.5em}
    }
        \item[]
}
{ 
    \end{list}
}

\newenvironment{cvsubsection}[3]{
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} & #2 \\
        \textit{\small#3} & \\
    \end{tabular*}\vspace{-0.5em}
    \begin{list}{\bulletpoint}{}
        \setlength{\itemsep}{-4pt} \vspace{-0.5em} % Reduce vertical spacing between items
        \item[]
}{
    \end{list}
}

\newenvironment{cvproject}[3]{
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
        \small \textbf{#1} $|$ \emph{#2} & #3 \\
    \end{tabular*}\vspace{-14pt}

    \begin{list}{\bulletpoint}{}
        \setlength{\itemsep}{-4pt} \vspace{-0.5em} % Reduce vertical spacing between items
        \item[]
}{
    \end{list}
}

\newenvironment{cvskills}{
    \begin{tabular*}{0.97\textwidth}{l@{\hskip 1cm}l}
}{
    \end{tabular*}
}

\newcommand{\cvskill}[2]{
    \textbf{#1} & #2 \\
}

\setcounter{secnumdepth}{0} % remove sections numbering
\pagenumbering{gobble} % remove page numbering
\pdfgentounicode=1 % ensure text is correctly interpreted as unicode

