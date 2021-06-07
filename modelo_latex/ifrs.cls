%==============================================================================
% Modelo de TCC do IFRS
% Baseado no iiufrgs.cls da UTUG
%==============================================================================

%==============================================================================
% Identificacao
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifrs}[2021/06/02 v4.3.1 Formatacao de documentos para o IFRS]

%==============================================================================
% Declaracao de opcoes
%==============================================================================
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%==============================================================================
% Heranca da classe `report' e inclusao de pacotes e arquivos necessarios
%==============================================================================
\LoadClass[12pt,a4paper,twoside]{report}
\RequirePackage[english,brazilian]{babel}
\input{ifrs.sty}
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{natbib}

%==============================================================================
% Margens do texto
%==============================================================================
\newlength{\ii@topmargin}\setlength{\ii@topmargin}{30mm}
\newlength{\ii@pagenummargin}\setlength{\ii@pagenummargin}{20mm}
\newlength{\ii@bottommargin}\setlength{\ii@bottommargin}{20mm}
\newlength{\ii@sidemargin}\setlength{\ii@sidemargin}{30mm}
\setlength{\marginparwidth}{25mm}

% ajuste das medidas verticais
\setlength{\topmargin}{\ii@pagenummargin}
	\addtolength{\topmargin}{-1em}
	\addtolength{\topmargin}{-1in}
\setlength{\headheight}{1em}
\setlength{\headsep}{\ii@topmargin}
	\addtolength{\headsep}{-\ii@pagenummargin}
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-\ii@topmargin}
	\addtolength{\textheight}{-\ii@bottommargin}
\setlength{\footskip}{\ii@bottommargin}

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{\ii@sidemargin}
	\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-2\ii@sidemargin}
\setlength{\marginparsep}{\ii@sidemargin}
	\addtolength{\marginparsep}{-\marginparwidth}
	\setlength{\marginparsep}{.5\marginparsep}

%==============================================================================
% Numeracao das paginas
%==============================================================================
\def\ps@iiufrgs{
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
	\def\@evenhead{{\small\thepage}}
	\def\@oddhead{\hspace*{\fill}{\small\thepage}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Definicao de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
	\addtocounter{ii@authorcount}{1}
	\expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
	\expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
	\expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}
\DeclareRobustCommand{\advisor}[3][]{
	\gdef\@advisorlast{#2}
	\gdef\@advisorfirst{#3}
	\gdef\@advisor{#1~#3 #2}
}
\DeclareRobustCommand{\coadvisor}[3][]{
	\gdef\@coadvisorlast{#2}
	\gdef\@coadvisorfirst{#3}
	\gdef\@coadvisor{#1~#3 #2}
}

%==============================================================================
% Definicao do Departamento relacionado ao documento
% deve ser definido como `ina' ou `int'
%==============================================================================
\newcommand{\dept}[1]{\gdef\@dept{#1}}

%==============================================================================
% Definicao das palavras-chave (max. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
	\addtocounter{kwcounter}{1}
	\expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
	\@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
	\@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
	\@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
	\@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
	\@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
	\@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
	\@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
	\@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
	\@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
	\@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
	\@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
	\@ifundefined{keywb}{}{. \keywb}%
	\@ifundefined{keywc}{}{. \keywc}%
	\@ifundefined{keywd}{}{. \keywd}%
	\@ifundefined{keywe}{}{. \keywe}%
	\@ifundefined{keywf}{}{. \keywf}%
	\@ifundefined{keywg}{}{. \keywg}%
	\@ifundefined{keywh}{}{. \keywh}%
	\@ifundefined{keywi}{}{. \keywi}%
	\@ifundefined{keywj}{}{. \keywj}%
}

%==============================================================================
% Redefinicao da data (para ter mes e ano separados)
%==============================================================================
\renewcommand{\date}[3]{
	\gdef\@publday{#1}
	\gdef\@publmonth{#2}
	\gdef\@publyear{#3}
}
\date{\monthname}{\number\year}

%==============================================================================
% Definicao padrao da folha de rosto.
% Os dados especificos do tipo de trabalho (dissertacao, tese, etc.) sao
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluidos com a classe.
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}
\newcommand{\location}[2]{
	\gdef\@city{#1}
	\gdef\@state{#2}
}
\location{Rio Grande}{RS}
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\thetitlepage
	\end{titlepage}%
	\clearpage
	\setcounter{page}{2}%
	\@ifundefined{@cipspecificinfo}{}{\@makecippage}
	\makeapprovalpage
}
\newcommand{\thetitlepage}{%
	\noindent\@topbox\\
	\vfill
	\@ifundefined{titlepagespecificinfo}{}{
		\hspace*{\fill}\makebox[.5\textwidth][l]{
		    \parbox[b]{8.5cm}{\raggedright\titlepagespecificinfo}
        }
        \vfill
	}
	\@ifundefined{@advisor}{}{
		\hspace*{\fill}\parbox[b]{.5\textwidth}{%
			{\titlepageadvisorinfo}
		}
		\vfill
	}
	\centerline{\@city, \ii@date}
}
\def\@topbox{
	\parbox[t]{\textwidth}{
		\centering
		\vbox to \titlepagewinvoffset{
			\titlepagetopinfo\vfill\@winbox
		}
	}
}
\def\@winbox{
	\parbox[b]{\titlepagewinwidth}{
		\centering\vbox to \titlepagewinheight{
			\vspace*{\fill}
			\MakeUppercase{\@authora}\\
			\@ifundefined{@authorb}{}{\MakeUppercase{\@authorb}\\}
			\@ifundefined{@authorc}{}{\MakeUppercase{\@authorc}\\}
			\@ifundefined{@authord}{}{\MakeUppercase{\@authord}\\}
			\vspace{\stretch{4}}
			{\large\textbf{\@title}\par}
			\vfill
		}
	}
}
\newcommand{\titlepagetopinfo}{
	\MakeUppercase{\instituicao}\\
	\MakeUppercase{\campus}\\
	\@ifundefined{@dept}{}{\MakeUppercase{\csname dept\@dept\endcsname}\\}
	\MakeUppercase{\course}\\
}
\newcommand{\titlepageadvisorinfo}{
	\@ifundefined{@advisor}{}{\vfill\@advisor\\\advisorname}
	\@ifundefined{@coadvisor}{}{\\[6ex]\@coadvisor\\\coadvisorname}
}

%==============================================================================
% Catalogacao na fonte (CIP) e nominata
%==============================================================================
\newcommand{\@makecippage}{
	\clearpage
	\begin{center}
		\textbf{\cipcaption}\\[2ex]
		\iiu@cipwindow
	\end{center}
	\vfill
	\MakeUppercase{\instituicao}\\
	Reitor: \reitor\\ 
	Pró-Reitor de Ensino: \proreitorgraduacao\\ 
	Diretor Geral do \campus: \diretor\\ 
	Coordenador do curso: \cordenador\\ 
}
\def\iiu@cipwindow{
	\framebox[120mm]{
	\begin{minipage}{110mm}
		\vspace*{0.2ex}
		\setlength{\parindent}{1.5em}
		\setlength{\parskip}{1.3ex}
		\noindent\@authoralast, \@authorafirst\par
		\@title\ / \@authora.\ -- \@city: \@cipcourse, \@publyear.\par
		\pageref{LastPage}~f.: il.\par
		\@cipspecificinfo\ -- \instituicao. \course, \@city, BR--\@state, \@publyear. \advisorname: \@advisorfirst\ \@advisorlast\@ifundefined{@coadvisor}{}{; \coadvisorname: \@coadvisorfirst\ \@coadvisorlast}.\par
		\@cipkw I.~\@advisorlast, \@advisorfirst. \@ifundefined{@coadvisorfirst}{II.~T\'{\i}tulo.}{II.~\@coadvisorlast, \@coadvisorfirst. III.~T\'{\i}tulo.}\\
		\vspace{0.2ex}
	\end{minipage}
	}
}

%==============================================================================
% Folha de aprovacao
%==============================================================================
\newcounter{@revisorcount}
\DeclareRobustCommand{\revisor}[4][]{
	\addtocounter{@revisorcount}{1}
	\expandafter\gdef\csname @revisor\alph{@revisorcount}last\endcsname{#2}
	\expandafter\gdef\csname @revisor\alph{@revisorcount}first\endcsname{#3}
	\expandafter\gdef\csname @revisor\alph{@revisorcount}institution\endcsname{#4}
	\expandafter\gdef\csname @revisor\alph{@revisorcount}\endcsname{#1~#3 #2}
}
\newlength{\ABNTsignwidth}\setlength{\ABNTsignwidth}{8cm}
\newlength{\ABNTsignskip}\setlength{\ABNTsignskip}{0.1cm}
\newlength{\ABNTsignthickness}\setlength{\ABNTsignthickness}{1pt}
\newcommand{\signature}{
	\vspace*{50pt}
	\ABNTcsign
}
\newcommand{\ABNTsign}[1]{
	\parbox[t]{\ABNTsignwidth}{}\vspace*{\ABNTsignskip}\centering
	\rule{\ABNTsignwidth}{\ABNTsignthickness}\\
	\nopagebreak #1\par
}
\newcommand{\ABNTcsign}[1]
{	\begingroup\par\centering\ABNTsign{#1}\par\endgroup
}
\newcommand{\makeapprovalpage}{
	\chapter*{\approvalname}
	Monografia sob o título \textit{"\@title"}, defendida por \@authora \@ifundefined{@authorb}{}{ e \@authorb}~e aprovada em \@publday ~de \ii@date, em \@city, \@state, pela banca examinadora constituída pelos professores: 
	\signature{\@advisor\\\advisorname}
	\@ifundefined{@coadvisor}{}{\signature{\@coadvisor\\\coadvisorname}}
	\@ifundefined{@revisora}{}{\signature{\@revisora\\\@revisorainstitution}}
	\@ifundefined{@revisorb}{}{\signature{\@revisorb\\\@revisorbinstitution}}
	\@ifundefined{@revisorc}{}{\signature{\@revisorc\\\@revisorcinstitution}}
	\@ifundefined{@revisord}{}{\signature{\@revisord\\\@revisordinstitution}}
}

%==============================================================================
% Ajuste do sumario (nada indentado) 
%==============================================================================
\newlength{\ii@chapnumindent}\setlength{\ii@chapnumindent}{1.8em}
\renewcommand*{\l@chapter}[2]{
	\addpenalty{-\@highpenalty}
	\vskip -1ex \@plus\p@
	\setlength\@tempdima{1.5em}
	\begingroup
	\parindent \z@ \rightskip \@pnumwidth
	\parfillskip -\@pnumwidth
	\leavevmode\bfseries\sffamily
	\advance\leftskip\@tempdima
	\hskip -\leftskip
	\@dottedtocline{0}{0em}{\ii@chapnumindent}{\uppercase{#1}}{#2}
	\penalty\@highpenalty
	\endgroup
}
\renewcommand*{\l@section}[2]{
	\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{\hss #2}
}
\renewcommand*{\l@subsection}{
	\@dottedtocline{2}{0em}{3.7em}
}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{
	\chapter*{\contentsname}
	\@starttoc{toc}\@aftertoctrue
}

%==============================================================================
% Definicao das listas de abreviaturas e siglas e de simbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
	\chapter*{\listabbrvname}
	\begin{list}{\textbf{??}}{
		\settowidth{\labelwidth}{#1}
		\setlength{\labelsep}{1em}
		\setlength{\itemindent}{0mm}
		\setlength{\leftmargin}{\labelwidth}
		\addtolength{\leftmargin}{\labelsep}
		\setlength{\rightmargin}{0mm}
		\setlength{\itemsep}{.1\baselineskip}
		\renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
	}
}
{	\end{list}
}

%==============================================================================
% Resumo (abstract)
%==============================================================================
\renewenvironment{abstract}{
	\chapter*{\abstractname}
}
{	\par\vfill
	\noindent\textbf{\keywordsname:} \@abstractkw.
}

%==============================================================================
% Formatacao dos capitulos.
% Os comandos \@chapter e \@schapter sao redefinidos para que a
% numeracao de paginas seja correta (deve aparecer somente a partir do
% primeiro capitulo do texto, mas nao nas paginas iniciais de capitulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatacao dos titulos propriamente ditos.
%==============================================================================
\newcommand{\ii@chapterfont}{
	\@setfontsize\Large{16}{20}
}
\def\@chapapp{}
\def\@chapter[#1]#2{
	\refstepcounter{chapter}
	\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\addtocontents{lot}{\protect\addvspace{10\p@}}
	\pagestyle{iiufrgs}\let\ps@plain\ps@iiufrgs
	\@makechapterhead{#2}\@afterheading
}
\def\@makechapterhead#1{
	\vspace*{90pt}
	\reset@font\noindent{\ii@chapterfont\sffamily\textbf{\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}}\par}
	\addvspace{42pt}
}
\def\@schapter#1{
	\if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\addtocontents{lot}{\protect\addvspace{10\p@}}
	\@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{
	\vspace*{90pt}
	\reset@font\centerline{\ii@chapterfont\sffamily\textbf{\MakeUppercase{#1}}}
	\addvspace{42pt}
}
\renewcommand{\appendix}[1][\appendixname]{
	\setcounter{chapter}{0}
	\renewcommand{\thechapter}{\Alph{chapter}}
	\setcounter{tocdepth}{0}
	\@captionlistingfalse
	\gdef\@chapapp{\MakeUppercase{#1}\space}
	\addtocontents{toc}{
		\settowidth{\ii@chapnumindent}{{\sffamily\textbf{\@chapapp}}}
		\addtolength{\ii@chapnumindent}{1.8em}
	}
}
\newcommand{\annex}{
	\appendix[\annexname]
}

%==============================================================================
% Formatacao das secoes
%==============================================================================
\setcounter{secnumdepth}{4}
\renewcommand{\section}{
	\@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\large\bfseries}
}
\renewcommand{\subsection}{
	\@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
}
\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\itshape}
}
\renewcommand{\paragraph}{%
	\@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font}
}
\renewcommand{\subparagraph}{%
	\@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Redefinicao do conteudo das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{
	\par
	\if@captionlisting
	\addcontentsline{\csname ext@#1\endcsname}{#1}
		{\protect\numberline{\csname fnum@#1\endcsname:}{\ignorespaces #2}}
	\fi
	\begingroup
		\@parboxrestore
		\if@minipage
			\@setminipage
		\fi
		\normalsize
		\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
	\endgroup
}
\renewcommand*{\l@figure}{
	\@dottedtocline{1}{0em}{5.5em}
}
\let\l@table\l@figure

%==============================================================================
% Redefinicao do formato de citacoes longas
%==============================================================================
\renewenvironment{quote}{
	\small
	\begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}
{	\\\end{list}
}

%==============================================================================
% Ajuste do formato das citacoes e referencias
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

%==============================================================================
% Epigrafe
%==============================================================================
\newcommand{\epigraph}[2]{
	\clearpage
	\begin{flushright}
		\mbox{}\vfill{\sffamily\itshape "#1"\\}
		--- \textsc{#2}
	\end{flushright}
}

