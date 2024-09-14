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
\usepackage{tikz} % For drawing the colored rectangle
\usepackage{parskip} % For spacing between paragraphs
\usepackage{setspace} % For line spacing
\geometry{
    top=1.5in,
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
\let \@street \relax
\let \@city \relax
\let \@telephonenumber \relax
\let \@emaiaddress \relax

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Define name variable
\newcommand{\address}[4]{
    \def \@street {#1 #2}
    \def \@city {#3 #4}
}
\newcommand{\contact}[2]{
    \def \@telephonenumber {#1}
    \def \@emaiaddress {#2}
} % Define name variable

\newcommand{\userinfos}{
    \name \\
    \@street \\
    \@city \\
    \@telephonenumber \\
    \@emaiaddress
}


\let \@companystreet \relax
\let \@companycity \relax
\newcommand{\companycontactperson}[1]{\renewcommand{\companycontactperson}{#1}} % Define name variable
\newcommand{\companyname}[1]{\renewcommand{\companyname}{#1}} % Define name variable
\newcommand{\companyaddress}[4]{
    \def \@companystreet {#1 #2}
    \def \@companycity {#3 #4}
} % Define address variable

\newcommand{\companyinfos}{
    \textbf{\companyname} \\
    \companycontactperson \\
    \@companystreet \\
    \@companycity
}


\renewcommand{\maketitle}{ % redefine maketitle

    \begin{tikzpicture}[remember picture, overlay]
        % Adjust the coordinates to position the rectangle
        \node[anchor=north west, fill=maincolor, text=white, minimum width=3cm, minimum height=3cm, text height=2cm] 
        at ([xshift=0.75in]current page.north west) 
        {BEWERBUNG};
    \end{tikzpicture}

    \noindent
    \begin{minipage}[t]{0.5\textwidth}
        \vspace{0.7cm}
        \companyinfos
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{0.4\textwidth}
        \raggedleft
        \userinfos
    \end{minipage}
    \vspace{2cm}

    % Date
    \noindent
    \hspace*{\fill} \today \\
    \raggedright
    { \maincolor\titlerule \vspace{-5pt} }

    \vspace{2em} % Space before the salutation

    {\large \bf \@title }
    \vspace{2em} % Space before the salutation
}

\setcounter{secnumdepth}{0} % remove sections numbering
\pagenumbering{gobble} % remove page numbering
\pdfgentounicode=1 % ensure text is correctly interpreted as unicode



