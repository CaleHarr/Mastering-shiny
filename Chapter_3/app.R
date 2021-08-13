#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    #ex 3.3.6 1
    textInput("name", "What's your name?"),
    textOutput("greeting")
)

server <- function(input, output, session) {
    # ex 3.3.6 1 output$greeting <- renderText(paste0("Hello ", input$name))
    # for this section needed to use reactive to create a function out of it, otherwise seems to not update correctly
    # greeting <- reactive(paste0("Hello ", input$name))
    # output$greeting <- renderText(greeting())
    # ex 3.3.6 3 Fail due to name clash, don't use variable names which are function names elsewhere
    
        
    }
# Run the application 
shinyApp(ui = ui, server = server)
