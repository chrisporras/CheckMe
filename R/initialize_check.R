#' Initializes data table for student answers
#'
#' This function creates a blank data table for
#' answers to be filled into.
#'
#' @return Blank data table check_table
#' @export
initialize_check <- function(){
  check_table <<- data.table::data.table(
    question = character(),
    answer = list(),
    fun = character(),

    stringsAsFactors = FALSE
  )
}

