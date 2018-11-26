\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}
\ProcessOptions
\LoadClass[11pt]{article}
\RequirePackage{array}
\RequirePackage{bibunits}
\RequirePackage{calc}

%\pagestyle{myheadings}

\setlength{\oddsidemargin}{0pt}
\setlength{\textwidth}{6.5in}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}
\setlength{\topmargin}{-0.5in}
\setlength{\headheight}{0.25in}
\setlength{\headsep}{0.25in}
\setlength{\footskip}{0.5in}
\setlength{\textheight}{9in}

\date{\relax}
\renewcommand{\today}{\number\day\space\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\year}
\newcommand{\name}[1]{%
  \renewcommand{\@author}{#1}%
  %\markright{\protect\small\@author}%
}
\def\address#1{\gdef\@address{\uppercase{#1}}}
\def\contact#1{\gdef\@contact{\uppercase{#1}}}
\def\personal#1{\gdef\@personal{#1}}
\let\@address\@empty
\let\@contact\@empty
\let\@personal\@empty

\renewcommand{\maketitle}{\newpage
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \begin{center}

    {\LARGE \@author}

    \ifx\@personal\@empty\else\smallskip{\scriptsize\scshape\@personal}\fi

  \end{center}

  \smallskip

  %\thispagestyle{plain}

  \gdef\@author{}
}

\AtBeginDocument{%

  \maketitle

  \noindent
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr@{}}
    \scriptsize
    \begin{tabular}[t]{@{}l@{}}
    \@address
    \end{tabular}
  &
    \scriptsize
    \begin{tabular}[t]{@{}r@{}}
    \@contact
    \end{tabular}
  \end{tabular*}

  \medskip

  %\thispagestyle{empty}%

}

%\AtEndDocument{\begin{flushright}\footnotesize\today\end{flushright}}

\setcounter{secnumdepth}{0}

\renewcommand{\section}{\@startsection
  {section}%
  {1}%
  {0pt}%
  {-\bigskipamount}%
  {\medskipamount}%
  {\normalfont\normalsize\scshape}}

\renewcommand{\subsection}{\@startsection
  {subsection}%
  {2}%
  {0pt}%
  {-\medskipamount}%
  {\smallskipamount}%
  {\normalfont\normalsize\itshape}}

\newlength{\@refwidth}
\newlength{\@refcolwidth}
\newlength{\LabelWidth}
\newlength{\LabelWideWidth}
\setlength{\LabelWidth}{1.5in}
\setlength{\LabelWideWidth}{1.75in}
\setlength{\smallskipamount}{1.5ex plus 0.2ex minus 0.1ex}
\setlength{\medskipamount}{3ex plus 0.5ex minus 0.2ex}
\setlength{\bigskipamount}{6ex plus 1ex minus 0.5ex}

\newcommand{\entrylabel}[1]{%
  \raisebox{0pt}[1ex][0pt]{%
    \makebox[\labelwidth][l]{%
      \parbox[t]{\labelwidth}{\hspace{0pt}#1}%
    }%
  }%
}

\newenvironment{entry}%
  {\begin{list}{}%
    {\renewcommand{\makelabel}{\entrylabel}%
     \setlength{\labelwidth}{\LabelWidth}%
     \setlength{\leftmargin}{\labelwidth+\labelsep}%
    }%
  }%
  {\end{list}}

\newenvironment{wideentry}%
  {\begin{list}{}%
    {\renewcommand{\makelabel}{\entrylabel}%
     \setlength{\labelwidth}{\LabelWideWidth}%
     \setlength{\leftmargin}{\labelwidth+\labelsep}%
    }%
  }%
  {\end{list}}

\newcommand{\reference}[3]{%\medskip
  \setlength{\@refwidth}{\textwidth-\leftmargin}%
  \setlength{\@refcolwidth}{\@refwidth/2-\tabcolsep*2}%
  \hspace*{\fill}%
  \begin{tabular*}{\@refwidth}[t]{@{}l@{\hfill}}
    #1 \\[\smallskipamount]%
    \small
    \parbox[t]{\@refcolwidth}{\raggedright #2}%
    \hspace{2\tabcolsep}%
    \parbox[t]{\@refcolwidth}{\raggedright
    \begin{tabular}[t]{ll}#3\end{tabular}}%
  \end{tabular*}\\*[\medskipamount]
}

\let\oldthebibliography\thebibliography
\let\oldbibitem\bibitem
% \renewenvironment{thebibliography}[1]{\begin{itemize}}{\end{itemize}}
\renewenvironment{thebibliography}[1]%
  {\begin{list}{\labelenumi\hss}%
     {\usecounter{enumi}\setlength{\labelwidth}{3em}%
      \setlength{\leftmargin}{\labelwidth+\labelsep}}}%
  {\end{list}}
\renewcommand{\bibitem}[1]{\item\label{#1}\relax}

\renewenvironment{quotation}%
  {\begin{list}{}{%
    \setlength{\listparindent}{1.5em}%
    \setlength{\itemindent}{\listparindent}%
    \setlength{\leftmargin}{0pt}%
    \setlength{\rightmargin}{0pt}%
    \setlength{\parsep}{0pt plus 1pt}%
    \item\relax}\footnotesize\noindent\relax}
  {\end{list}}

\newcommand{\upcase}[1]{\uppercase{#1}}

\newcommand{\publications}[2][cv]{%
  \renewcommand{\theenumi}{\arabic{enumi}}%
  \begin{bibunit}[#1]
    \nocite{*}
    \putbib[papers.#2]
  \end{bibunit}
}

\newcommand{\pubs}[2][cv-cond]{%
  \renewcommand{\labelenumi}{}%
  \begin{bibunit}[#1]
    \nocite{*}
    \putbib[papers.#2]
  \end{bibunit}
}

\newenvironment{indented}%
  {\begin{list}{}{%
    \renewcommand{\makelabel}{}%
    \setlength{\parskip}{\smallskipamount}%
    \setlength{\listparindent}{0em}%
    \setlength{\itemindent}{0pt}%
    \setlength{\labelwidth}{0pt}%
    \setlength{\labelsep}{0pt}%
    \item}\relax}%
  {\end{list}}
