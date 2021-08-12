#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

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
library(shiny)
#install.packages("tidyverse")
library(tidyverse)
#library(dplyr)
#library(ggplot2)

#data <- read.csv("2021_test.csv")
#data[is.na(data)] <- 0
#data2<-data%>%dplyr::group_by(Country.Region,Scenario.number)%>%mutate(Market.share=Forecast.Supply/sum(Forecast.Supply))
#data2<-data2%>%mutate(Percentage.change=readr::parse_number(Percentage.change)/100,New.Forecast=(1+Percentage.change)*Forecast.Supply)
#data2[is.na(data2)] <- 0
#Which of textOutput() and verbatimTextOutput() should each of the following render functions be paired with?

#renderPrint(summary(mtcars))
#Use verbatimtextoutput as it's a small amount of data
#renderText("Good morning!")
#Use text output as it's just text
#renderPrint(t.test(1:5, 2:6))
#Verbatimoutput as you want to show that it is similar to console
#renderText(str(lm(mpg ~ wt, data = mtcars)))
#Verbatimoutput as it's console output

ui <- fluidPage(
    
    
    titlePanel("Scenarios calculator test"),
    
    selectInput("scenarioInput", "Choose scenario",
                choices = c("1", "2" )),
    # ex 2.2.8 1 textInput("textbox",NULL,placeholder  = "Your name"),
    # ex 2.2.8 2 sliderInput("sliderdate",label = 'When should we deliver?',min = as.Date('2020-06-19'),max = as.Date('2020-09-23'), value = as.Date('2020-09-17'),timeFormat = '%F'),
    # ex 2.2.8 3 sliderInput('test',label = 'Get a load of this', min = 0,max = 100,step = 5, value = 5, animate = animationOptions(loop = TRUE, playButton = "play")),
    # ex 2.2.8 4 To get a grouped list, put in the values as a list, with subheadings, rather than a vector of characters
    # Ex 2.3.5 2 plotOutput("plot", width = "400px"),
    
    mainPanel(
        plotOutput("coolplot"),
        br(), br(),
        tableOutput("results")
    ),
    dataTableOutput("dynamic")
)

server <- function(input, output, session) {
    dataset <- reactive({
        data <- read.csv("2021_test.csv")
        #data<-read.csv("2021_test.csv")%>%filter(Scenario.number==input$scenarioInput)
        #data[is.na(data)] <- 0
    })
    
    # Ex 2.3.5 2 output$plot <- renderPlot(plot(1:5), res = 96, height=300, width = 700, alt = "Scatterplot of five random numbers")
    output$dynamic <- renderDataTable(data%>%filter(Scenario.number==input$scenarioInput), options = list(pageLength = 15))
    output$coolplot <- renderPlot({
        
        ggplot(data%>%filter(Scenario.number==input$scenarioInput), aes(x=Country.Region,y=Forecast.Supply,fill=Technology)) +
            geom_bar(stat='identity')
    })
}

shinyApp(ui, server)
# Run the application 
shinyApp(ui = ui, server = server)
