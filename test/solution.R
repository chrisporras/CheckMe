solution <- function(label="", ...){
  # Builds a data table from solutions
  # label gives check() target to compare 
  # with student answers
  answers <- list(...)
  for(i in answers){
    solution_table <<- rbind(solution_table,
      list(question = label,
           answer = list(i)
           ),
      stringsAsFactors = FALSE
      )
  }
}