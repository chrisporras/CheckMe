initialize_solution <- function(solutions_path = ""){
  check_table <<- data.table::data.table(
    question = character(),
    answer = list(),
    fun = character(),
    
    stringsAsFactors = FALSE
  )
  if(file.exists(solutions_path)){
    solutions_table <<- loadRData(solutions_path)
  } else {
    print("Solutions table not found.")
  }
  
  
}



