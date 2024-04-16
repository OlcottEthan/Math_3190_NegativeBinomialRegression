#ui fluid page
library(MASS)

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
      plotOutput("distPlot"),
      verbatimTextOutput("poissonSummary"),
      verbatimTextOutput("negbinSummary")
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
      "Bridges" = list(dependent = c("total", "Brooklyn_bridge", "Manhattan_bridge", "Williamsburg_bridge", "Queensboro_bridge"), 
                       independent = c("day", "temp_high", "temp_low", "precipitation")),
      "Rentals" = list(dependent = c("cnt", "casual", "registered"),
                       independent = c("season", "yr", "mnth", "hr", "holiday", "weekday", "workingday", "weathersit", "temp", "atemp", "hum", "windspeed")),
      "Droughts" = list(dependent = c("length"), 
                        independent = c("year")), 
      "Restaurants" = list(dependent = c("inspection_score"),
                           independent = c("Year", "NumberofLocations", "Weekend")),
      "Ships" = list(dependent = c("incidents"), 
                     independent = c("type", "construction", "operation", "service"))
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
  
  poissonmodel <- reactive({
    dep_var <- input$dependentVar
    ind_vars <- input$independentVars
    data <- switch(input$dataset,
                   "Bridges" = bikes_bridges,
                   "Rentals" = bike_rentals,
                   "Droughts" = droughts,
                   "Restaurants" = restaurant_inspections,
                   "Ships" = ship_accidents)
    
    model <- glm(data[[dep_var]] ~ ., data = data[c(ind_vars)], family = poisson)
    
    return(model)
  })
  
  negbinmodel <- reactive({
    dep_var <- input$dependentVar
    ind_vars <- input$independentVars
    data <- switch(input$dataset,
                   "Bridges" = bikes_bridges,
                   "Rentals" = bike_rentals,
                   "Droughts" = droughts,
                   "Restaurants" = restaurant_inspections,
                   "Ships" = ship_accidents)
    
    model <- glm.nb(data[[dep_var]] ~ ., data = data[c(ind_vars)])
    
    return(model)
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
  
  
  output$poissonSummary <- renderPrint({
    summary(poissonmodel())
  })
  
  output$negbinSummary <- renderPrint({
    summary(negbinmodel())
  })
}

# Run the application
shinyApp(ui = ui, server = server)