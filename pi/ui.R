library(shiny)
shinyUI(fluidPage(
    titlePanel("Calculate π"),
    sidebarLayout(
        sidebarPanel(
            numericInput("num",
                        "Choose the number of points to generate:",
                        min = 1,
                        max = 100000,
                        value = 1000),
            submitButton("Calculate"),
            HTML("<br><p> Author: <a href='https://github.com/dmarquinez' target='_blank'>
                 David Marquinez</a></p>")
            
        ),
        
        mainPanel(
            h1("Given a function that generates random numbers between 0 and 1 calculate pi"),
            hr(),
            textOutput("ppi"),
            textOutput("ppi2"),
            textOutput("ppi3"),
            plotOutput("plot", height = "400px", width = "400px"),
            h1("The maths behind"),
            hr(),
            p("We need to refresh some basic formulas of geometrics before moving on"),
            p("Area of Square = side^2"),
            p("Area of Circle = π*r^2"),
            plotOutput("plot2",height = "400px", width = "400px"),
            p("If we start generating points the number of points inside the circle
              divided by the total number of points is going to be equal to
              one-quarter of the area of the circle divided by the area of the square:"),
            br(),
            img(src="img1.gif"),
            br(),
            br(),
            p("If we simplify:"),
            img(src="img2.gif"),
            br(),
            hr(),
            HTML("<br><p>Small app inspired by <a href='https://youtu.be/pvimAM_SLic' target='_blank'> this video</a>
                 of <a href='https://twitter.com/jomaoppa'>Joma Tech</a> and the lectures of <a href='http://www.bcaffo.com/' target='_blank'> 
                 Brian Caffo</a> in the <a href='https://www.coursera.org/learn/data-products'
                 target='_blank'>Developing Data Products</a> course, part of 
                 <a href='https://www.coursera.org/specializations/jhu-data-science' target='_blank'>Data Science Specialization</a></p>")
            
        )
    )
))
