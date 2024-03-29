% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/m_clear.R
\name{m_clear}
\alias{m_clear}
\title{Limpar ambiente}
\usage{
m_clear(manter = NULL, console = TRUE)
}
\arguments{
\item{manter}{Lista contendo o nome das variaveis, funcoes e objetos a serem mantidos}

\item{console}{Limpar o console (TRUE) ou nao (FALSE). Funciona apenas no RStudio do Windows, assim
deve-se usar console == FALSE em outros sistemas.}
}
\value{
ambiente limpo
}
\description{
Limpa o ambiente global (Global Environment)
}
\details{
A funcao retorna o ambiente mais limpo, podendo assim evitar erros no processamento dos dados.
}
\examples{

# Exemplo 1 

a <- 1
b <- "teste"
c <-  c(1,2,3)
d <- 456L

m_clear(manter = c("a", "b"))

# Exemplo 2

a <- 1
b <- "teste"
c <-  c(1,2,3)
d <- 456L

m_clear(manter = c("a", "b"), console = FALSE)

}
\author{
Mourao
}
