publish_solutions <- function(path = getwd(), 
                              file = "solution.RData"){
  save(check_table, file = paste(path,file,sep=""))
}