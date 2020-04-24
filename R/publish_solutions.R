#' Writes table of solutions to storage
#'
#' This function saves a data table of solutions
#' to be stored online and accessed by students privately
#' @param path Export file path
#' @param file Export file name
#' @return .Rdata of solutions table
#' @export
publish_solutions <- function(path = getwd(),
                              file = "solution.RData"){
  save(check_table, file = paste(path,file,sep=""))
}
