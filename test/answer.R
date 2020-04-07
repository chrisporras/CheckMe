answer <- function(label="", ...){
  # Builds a data table from student answers 
  # label gives check() target to compare with solutions
  answers <- list(...)
  
  for(response in answers){
    check_df <<- rbind(check_df, 
                       list(question = label, 
                            answer = response),
                       stringsAsFactors = FALSE)
   }
}