solution <- function(label="", ...){
  # Builds a data table from solutions
  # label gives check() target to compare with student answers
  answers <- list(...)
  for(response in answers){
    sol_df <<- rbind(sol_df, 
                       list(question = label, 
                            answer = response),
                       stringsAsFactors = FALSE)
  }
}