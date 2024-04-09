ui <- fluidPage(
  shinyjs::useShinyjs(),
  textInput("cor_guess", "Guess the correlation!"),
  actionButton(
    inputId = "submit_guess",
    label = "Submit Guess"
  ),
  plotly::plotlyOutput("graph"),
  textOutput("message"),
  actionButton("reset_input", "Press to Play Again!")
)

server <- function(input, output, session) {
  guess <- reactive(as.numeric(input$cor_guess))
  num_rand <- reactive(rchisq(input$num, 10))
  x <- rnorm(100, rnorm(1, 100, 50), rchisq(1, 10, 5))
  y <- sign(runif(1, -1, 1))*x + rnorm(100, 0, 10)
  true_cor <- cor(x, y)
  
  output$graph <- plotly::renderPlotly({
    p <- ggraph(x, y, point_size = 2)
    plotly::ggplotly(p)
  })
  
  observeEvent(
    eventExpr = input[["submit_guess"]],
    handlerExpr = {
      output$message <- renderText(
        paste0("Your guess was ",guess(),".\n\n
             The true value was ", round(true_cor,3),".\n
             That is a difference of ", abs(guess() - round(true_cor,3))
               ,".")
      )
    }
  )
  
  observeEvent(input$reset_input, {
    #shinyjs::reset()
    session$reload() # Works, but won't store guesses.
  })
}


shinyApp(ui = ui, server = server)