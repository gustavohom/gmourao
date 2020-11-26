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
#' m_load("beepr")
#' 
#' pkg <- c("beepr", "magrittr")
#' m_load(pkg)
#' @export
#' 
m_load <-function(pkg) {
  
  ipkg <- c(pkg[!pkg %in% installed.packages()], 
            pkg[pkg %in% rownames(old.packages())])
  
  install.packages(ipkg)
  
  lapply(pkg, library, character = TRUE)
}