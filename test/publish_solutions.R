publish_solutions <- function(path = getwd(), 
                              file = "solution_table.RData"){
  save(check_table, file = file)
}