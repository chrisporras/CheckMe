#' Stores variable calls in a data table of answers
#'
#' This function stores an arbitrary number of variables
#' and function calls to be stored in a data table for check()
#'
#' @param ... Arbitrary sequence of variables or function calls to be stored
#' @param label String to label values of answers for later checking
#' @return A data table of answers to be checked against solutions
#' @export
answer <- function(...,label=""){
  ## TODO: Write validations to prevent copying rows.
  # FIX: answer() funcs can't be added or removed
  # will break check()


  ## If label is undefined and solutions are loaded
  if (exists("solutions_table")){
  ## Grab label from solutions table
    label_list = solutions_table$question
    # use index of question
    current_question = length(check_table$question)+1
    label = label_list[current_question]

  }

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
