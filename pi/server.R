library(shiny)
library(dplyr)
library(plotrix)

shinyServer(function(input, output) {
    createdf <- reactive({
        #set.seed(2021-08-19)
        number_of_points <- input$num
        dataX <- runif(number_of_points,0,1)
        dataY <- runif(number_of_points,0,1)
        df <- data.frame("X" = dataX, "Y" = dataY)
        df <- df %>% 
            mutate(Color = if_else(sqrt(X**2+Y**2) <= 1,
                                   "Red", "Blue"))
        df
    })
    output$plot <- renderPlot({
        df <- createdf()
        plot(df$X, df$Y, asp = 1, 
             xlim = c(0, 1), ylim = c(0, 1),
             col = df$Color, xlab = "", ylab = "" )
        draw.circle(0, 0, 1, border = "red")
        calc <- 4*sum(df$Color=="Red")/input$num
        output$ppi <- renderText({
            paste("Calculated value for pi is: ",calc)
        })
    })


})
