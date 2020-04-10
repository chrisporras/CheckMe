check <- function(){
  questions <- solutions_table$question
  
  student <- check_table$answer
  solution <- solutions_table$answer
  
  grades <- student %in% solution
  
  result <- cbind(check_table, matches_solution = grades)
  result <- result[,fun:=NULL]
  
  if(mean(result$matches_solution)==1){
    print("All answers match solutions!")
  } else {
    print("Not all answers match solutions...")
    print("The answers to the following questions are incorrect:")
    print(result[matches_solution != TRUE]$question)
  }
  
  View(result)
}