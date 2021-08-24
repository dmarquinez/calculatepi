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
    output$plot2 <- renderPlot({
        plot(0,0, asp=1,
             xlim = c(-1, 1), ylim = c(-1, 1),
             xlab = "", ylab = "",
             yaxt='n', xaxt='n', ann=FALSE, bty='n')
        draw.circle(0, 0, 1, border = "red")
        mult_seg <- data.frame(x0=c(-1,-1,-1,1,0,0),
                               y0=c(-1,-1,1,-1,0,0),
                               x1=c(1,-1,1,1,1,0),
                               y1=c(-1,1,1,1,0,1))
        segments(x0 = mult_seg$x0,y0 = mult_seg$y0,
                 x1 = mult_seg$x1,y1 = mult_seg$y1)
        text(0.5, -0.1, "r", cex = 3)
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
        output$ppi2 <- renderText({
            paste("Absolute error is: "
                  ,abs(pi-calc))
                  })
        output$ppi3 <- renderText({
            paste("Percentage error is: ",
                  round(100*abs(pi-calc)/calc,2),"%")
        })
    })


})
