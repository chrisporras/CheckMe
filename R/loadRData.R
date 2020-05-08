#' @export
loadRData <- function(file,url=FALSE){
  #loads an RData file, and returns it
  if(url){
    load(url(file))
  }else{
    load(file)
  }
  get(ls()[ls() != "file"])
}