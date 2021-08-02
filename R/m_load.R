#' @title Carregar pacotes
#' 
#' @name m_load
#'
#' @description Carregar, instalar e atualizar pacotes
#'
#' @param pkg o nome de um pacote ou um vetor de string com o nome de varios pacotes.
#'
#' @details A funcao verifica se o pacote esta instalado e atualizado. Caso negativo, instalara a versao mais atualizada do pacote.
#' Em seguida, carrega todos os pacotes nomeados.
#' 
#' @return Pacotes anexados
#'
#' @author Mourao
#'
#' @examples
#' 
#' # Caregando apenas um pacote
#' 
#' m_load("beepr")
#' 
#' # Vetor contento varios pacotes 
#' 
#' pkg <- c("beepr", "magrittr")
#' m_load(pkg)
#' 
#' # Ocultar mensagens desnecessarias 
#' 
#' pkg <- c("beepr", "magrittr")
#' invisible(m_load(pkg))
#' 
#' @export
#'
m_load <- function(pkg) {
  
  github <- grep("^.*?/.*?$", pkg, value = TRUE)
  
  githubNames <- sub("^.*?/", "", github)
  
  cran <- pkg[!(pkg %in% github)]
  
  pkg <- c(githubNames, cran)
  
  ipkg <-
    c(pkg[!pkg %in% installed.packages()], pkg[pkg %in% rownames(old.packages())])
  
  cranIns  <- cran[which(cran %in% ipkg)]
  
  githubIns <- github[which(githubNames %in% ipkg)]
  
  if (length(cranIns) > 0) {
    install.packages(cranIns)
  }
  
  if (length(githubIns) > 0) {
    if ("remotes" %in% installed.packages() == FALSE) {
      install.packages("remotes")
    }
    
    remotes::install_github(githubIns)
  }
  
  lapply(pkg, library, character = TRUE)
  
}
