#ui fluid page
library(MASS)
library(NegativeBinomialRegression)

ui <- fluidPage(
  titlePanel("Negative Binomial Regression Fun"),
  sidebarLayout(
    sidebarPanel(
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
      plotOutput("plots")
    )
  )
)


# Define server logic
server <- function(input, output) {
  
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
    default_checked <- ind_vars[1]
    checkboxGroupInput("independentVars", "Choose independent variables:", 
                       choices = ind_vars, selected = default_checked)
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
    
    model <- glm(data[[dep_var]] ~ ., data = data[c(ind_vars)], family = "poisson")
    
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
  
  
  
  output$poissonSummary <- renderPrint({
    summary(poissonmodel())
  })
  
  output$negbinSummary <- renderPrint({
    summary(negbinmodel())
  })
  
  
  
  output$plots <- renderPlot({
    combined_df <- rbind(data.frame(lin_preds = predict(poissonmodel(), type = 'link'),
                     pearson = residuals(poissonmodel(), type = 'pearson'),
                     model = "Poisson"),
          data.frame(lin_preds = predict(negbinmodel(), type = 'link'),
                     pearson = residuals(negbinmodel(), type = 'pearson'),
                     model = "Negative Binomial"))
    
    
    dep_var <- input$dependentVar
    poisson_predictions <- exp(predict(poissonmodel(), type = 'link'))
    negbin_predictions <- exp(predict(negbinmodel(), type = 'link'))
    n <- length(poisson_predictions)
    index <- 1:n
    
    df1 <- data.frame(
      index = rep(index, 3),
      value = c(poissonmodel()$y,
                poisson_predictions,
                negbin_predictions),
      model = c(rep("Actual", n),
                rep("Poisson Predictions", n),
                rep("Negative Binomial Predictions", n)))
    
    
    
    distribution_plot <- ggplot(data.frame(value = poissonmodel()$y), aes(x = value)) +
      geom_density(color = 'black') +
      labs(x = 'Index', y = 'dependent variable', title = 'Distribution of Dependent Variable')
    
    resid_plot <- ggplot(combined_df, aes(x = lin_preds, y = pearson, color = model)) +
      geom_point() +
      geom_hline(yintercept = 0) +
      labs(x = 'Linear Predictors', y = 'Pearson Residuals', title = "Residual Plot")
    
    qq_plot <- ggplot(combined_df, aes(sample = pearson, color = model)) +
      stat_qq() +
      stat_qq_line() +
      labs(x = "Theoretical Quantiles",
           y = "Sample Quantiles",
           title = "QQ Plot: Pearson Residuals")
    
    dependent_plot <- ggplot(df1, aes(x = index, y = value, color = model)) +
      geom_line() +
      labs(x = "Index", y = "value", color = "Model", title = "Predictions") +
      scale_color_manual(values = c('black', '#F8766D', '#00BFC4'))
    
    gridExtra::grid.arrange(distribution_plot, resid_plot, qq_plot, dependent_plot, ncol = 2)
  })
}

# Run the application
shinyApp(ui = ui, server = server)