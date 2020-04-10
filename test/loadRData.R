loadRData <- function(file){
  #loads an RData file, and returns it
  load(file)
  get(ls()[ls() != "file"])
}