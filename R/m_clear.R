#' @title Limpar ambiente
#' 
#' @name m_clear
#'
#' @description Limpa o ambiente global (Global Environment)
#'
#' @param  manter Lista contendo o nome das variaveis, funcoes e objetos a serem mantidos
#'
#' @param  console Limpar o console (TRUE) ou nao (FALSE). Funciona apenas no RStudio do Windows, assim 
#' deve-se usar console == FALSE em outros sistemas.
#'
#' @details A funcao retorna o ambiente mais limpo, podendo assim evitar erros no processamento dos dados.
#' 
#' @return ambiente limpo
#'
#' @author Mourao
#'
#' @examples
#' 
#' # Exemplo 1 
#' 
#' a <- 1
#' b <- "teste"
#' c <-  c(1,2,3)
#' d <- 456L
#' 
#' reset(manter = c("a", "b"))
#' 
#' # Exemplo 2
#' 
#' a <- 1
#' b <- "teste"
#' c <-  c(1,2,3)
#' d <- 456L
#' 
#' reset(manter = c("a", "b"), console = FALSE)
#' 
#' @export
#'

m_clear <- function(manter = NULL, console = TRUE) {
        rm(list = ls(envir = .GlobalEnv)[!ls(envir = .GlobalEnv) %in% manter],
           envir = .GlobalEnv)
        
        if(console == T) cat("\f")
}