answer <- function(label="", ...){
  args <- substitute(...)
  # if a plot() is called from inside
  # call looks like : answer(label="", plot(x, y))
  if (grepl("(", deparse(args), fixed = TRUE)){
    eval(...) # call plot() as normal
    # variable name plotted on x axis
    x <- deparse(args[[2]]) 
    # variable name plotted on y axis
    y <- deparse(args[[3]])
    # from variable names of plotted args,
    # pull values from env and assign to x,y
    if (as.character(x) %in% ls(envir = .GlobalEnv)) {
      x <- get(as.character(x), envir = .GlobalEnv)
    } else {
      print(paste("Unassigned variable",x))
    }
    if (as.character(y) %in% ls(envir = .GlobalEnv)) {
      y<- get(as.character(y), envir = .GlobalEnv)
    } else {
      print(paste("Unassigned variable",y))
    }
    ## store function call
    graphical_args <- deparse(args)
    
    # store values 
    check_table <<- rbind(check_table,
                          list(question = label,
                               answer = list(x,y),
                               fun = graphical_args
                          ),
                          stringsAsFactors = FALSE
    )
  } else { # if a plot() is not called
    # Builds a data table from solutions
    # fills in student answers
    # call looks like : answer(label="", a,b,c,...)
    answers <- list(...)
    
    #### TODO: prohobit copying rows and instead allow replacement ####
    
    check_table <<- rbind(check_table,
                             list(question = label,
                                  answer = answers,
                                  fun = NA
                             ),
                             stringsAsFactors = FALSE
    )
  }
}