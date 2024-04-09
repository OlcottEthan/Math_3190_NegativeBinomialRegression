#' Negative Binomial App
#' 
#' This function allows the Negative Binomial shiny app to run. The app gives demonstrations
#' of Negative Binomial distributions as well as some interactivity with different regression
#' that the model can predict. It shows also provides differences between the Negative
#' Binomial regression and other common regressive techniques.
#' 
#' @export

runNegBin <- function() {
  appDir <- system.file("shiny", "negative_binomial_app", package = "NegativeBinomialRegression")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `NegativeBinomialRegression`.", 
         call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}