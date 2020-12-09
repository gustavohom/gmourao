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
#' Caregando apenas um pacote
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
m_load <-function(pkg) {
  
  ipkg <- c(pkg[!pkg %in% installed.packages()], 
            pkg[pkg %in% rownames(old.packages())])
  
  install.packages(ipkg)
  
  lapply(pkg, library, character = TRUE)
}