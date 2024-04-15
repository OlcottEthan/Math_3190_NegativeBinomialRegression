ui <- fluidPage(
  titlePanel("Negative Binomial Probability Function"),
  sidebarLayout(
    sidebarPanel(
      numericInput("size", "Number of Successes:", 5),
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  probability <- reactive({
    max(1 - exp(-((input$size)^2)/2042),0.995)
  })
  
  output$probValue <- renderText({
    paste(format(probability(), digits=4))
  })
  
  # Plot simulated negative binomial distribution based on input parameters
  output$distPlot <- renderPlot({
    # Define maximum x based on the range where probabilities are significant
    max_x <- qnbinom(probability(), size = input$size, prob = .44433)
    simulated_data <- dnbinom(0:max_x, size = input$size, prob = .44433)
    
    # Plot the data
    plot(0:max_x, simulated_data, type = "h", 
         main = paste("Simulated Negative Binomial Distribution\n",
                      "Number of successes:", input$size,
                      "\nProbability of success:", input$prob),
         xlab = "Number of Failures", ylab = "Probability", col = "blue")
  })
}

# Run the application
shinyApp(ui = ui, server = server)