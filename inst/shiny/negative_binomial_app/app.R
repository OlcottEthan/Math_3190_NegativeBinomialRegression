#ui fluid page
ui <- fluidPage(
  titlePanel("Negative Binomial Regression Fun"),
  sidebarLayout(
    sidebarPanel(
      numericInput("size", "Number of Successes:", 5),
      selectInput("dataset", "Choose a dataset",
                  choices = c("Bridges",
                              "Rentals",
                              "Droughts",
                              "Restaurants",
                              "Ships")),
      uiOutput("dependentSelect"),
      uiOutput("independentSelect")
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
  
  
  #selecing the dataset
  selectedDataset <- reactive({
    switch (input$dataset,
      "Bridges" = list(dependent = c("Total", "Brooklyn", "Manhattan", "Williamsburg", "Queensboro"), 
                       independent = c("Day", "High Temp", "Low Temp", "Precipitation")),
      "Rentals" = list(dependent = c("Total", "Casual", "Registered"),
                       independent = c("Season", "Year", "Month", "Hour", "Holliday", "Weekday", "Workday", "Weather", "Temp", "Atemp", "Windspeed")),
      "Droughts" = list(dependent = c("Length"), 
                        independent = c("Year")), 
      "Restaurants" = list(dependent = c("Score"),
                           independent = c("Year", "Locations", "Weekend")),
      "Ships" = list(dependent = c("Incidents"), 
                     independent = c("Type", "Construction", "Operation", "Service"))
    )
  })
  
  output$dependentSelect <- renderUI({
    # Get the list of dependent variables based on the selected dataset
    dep_vars <- selectedDataset()$dependent
    
    selectInput("dependentVar", "Choose dependent variable:", choices = dep_vars)
  })
  
  output$independentSelect <- renderUI({
    # Get the list of independent variables based on the selected dataset
    ind_vars <- selectedDataset()$independent
    
    checkboxGroupInput("independentVars", "Choose independent variables:", choices = ind_vars)
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
                      "\nProbability of success:", .4443),
         xlab = "Number of Failures", ylab = "Probability", col = "blue")
  })
}

# Run the application
shinyApp(ui = ui, server = server)