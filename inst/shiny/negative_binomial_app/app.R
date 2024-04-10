ui <- fluidPage(
  withMathJax(),
  titlePanel("Negative Binomial Distribution"),
  
  fluidRow(
    column(4,
           # Content for the first column
           h3("Distribution Details"),
           p("The negative binomial distribution models the number of Bernoulli 
             trials needed for a certain number of successes to occur. A sequence 
             of independent Bernoulli trials are conducted, each with the same 
             probability \\(p\\) of success. The trial at which the \\(r\\)th 
             success occurs is a negative binomial \\(r,p\\) random variable \\(X\\).")
    ),
    column(4,
           # Content for the second column
           h3("Distribution"),
           p("This is the content of the second column.")
    ),
    column(4,
           # Content for the third column
           h3("Column 3"),
           p("This is the content of the third column.")
    )
  )
)

server <- function (input,output){
  library(shiny)
  library(kableExtra)
  
  
}

shinyApp(ui,server)