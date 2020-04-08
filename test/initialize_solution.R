initialize_solution <- function(){
  solution_table <<- data.table::data.table(
    question = character(),
    answer = list(),
    stringsAsFactors = FALSE
    )
}

