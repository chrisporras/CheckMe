publish_solutions <- function(path = getwd(), 
                              file = "solution_table.RData"){
  save(solution_table, file = file)
}