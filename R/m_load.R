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
#' Veja todas as maneiras que pode ser usado
#'
#' # 1 Nome de um pacote em character
#' 
#' m_load("beepr")
#' 
#' #2 uma variavel com nome de um pacote
#' 
#' pkg <- "beepr"
#' 
#' m_load(pkg)
#' 
#' #3 nome de dois pacotes em character
#' 
#' m_load(c("beepr", "rlang"))
#' 
#' #4 vetor com nome de dois pacotes
#' 
#' pkg <- c("beepr", "rlang")
#' 
#' m_load(pkg)
#' 
#' #5 todas a maneiras anteriores podem ser usadas com instalacao para 
#' # github, para isso use: userName/package
#' 
#' pkg <- c("beepr", "gustavohom/gmourao")
#' 
#' m_load(pkg)
#' 
#' # 6 é possivel carregar o nome dos pacotes sem a necessidade de aspas,
#' # porem apenas um por vez
#' 
#' @export
#'
m_load <- function(pkg, ...) {
        if (exists(deparse(substitute(pkg)), where = .GlobalEnv)) {
                pkg <- pkg
        }
        
        else {
                if (try(is.character(pkg), silent = TRUE)
                    == TRUE) {
                        pkg <- pkg
                        list_pkg = list(...)
                        for (i in unique(list_pkg)) {
                                pkg <- append(pkg, i)
                        }
                        
                } else{
                        pkg <- deparse(substitute(pkg))
                        
                        list_pkg <-
                                as.character(match.call(expand.dots = FALSE)[[3]])
                        
                        for (i in unique(list_pkg)) {
                                pkg <- append(pkg, i)
                        }
                        
                }
        }
        
        github <- grep("^.*?/.*?$", pkg, value = TRUE)
        
        githubNames <- sub("^.*?/", "", github)
        
        cran <- pkg[!(pkg %in% github)]
        
        pkg <- sub("^.*?/", "", pkg)
        
        ipkg <-
                c(pkg[!pkg %in% installed.packages()], pkg[pkg %in% rownames(old.packages())])
        
        cranIns <- cran[which(cran %in% ipkg)]
        
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
