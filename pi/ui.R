library(shiny)
shinyUI(fluidPage(
    titlePanel("Calculate π"),
    sidebarLayout(
        sidebarPanel(
            numericInput("num",
                        "Number of points:",
                        min = 1,
                        max = 100000,
                        value = 1000),
            submitButton("Calculate"),
            HTML("<br><p> Author: <a href='https://github.com/dmarquinez' target='_blank'>
                 David Marquinez</a></p>")
            
        ),
        
        mainPanel(
            h1("Pi"),
            textOutput("ppi"),
            plotOutput("plot", height = "400px", width = "400px"),
            HTML("<br><p>Small app inspired by <a href='https://youtu.be/pvimAM_SLic' target='_blank'> this video</a>
                 of <a href='https://twitter.com/jomaoppa'>Joma Tech</a> and the lectures of <a href='http://www.bcaffo.com/' target='_blank'> 
                 Brian Caffo</a> in the <a href='https://www.coursera.org/learn/data-products'
                 target='_blank'>Developing Data Products</a> course, part of 
                 <a href='https://www.coursera.org/specializations/jhu-data-science' target='_blank'>Data Science Specialization</a></p>")
            
        )
    )
))
