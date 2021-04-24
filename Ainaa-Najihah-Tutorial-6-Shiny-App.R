#Salary Increment Calculator

library(shiny)
ui<-pageWithSidebar(
    # Application title
    headerPanel("Salary Increment Calculator"),
    sidebarPanel(
      numericInput('Salary', 'Current Salary ($)', 5500, min = 1, max = 10000000000, step = 1
      ),
      numericInput('Increment', 'Expected Salary Increase per Year (%)', 5, min = 0, max = 100, step = 1
      ),
      numericInput('Years', 'Number of Years', 5, min = 1, max = 100, step = 1
      ),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of Salary Increment Calculation'),
      h4('Predicted Salary'),
      verbatimTextOutput("SalaryCalculation")
    )
  )

Salary <- function(Salary,Years,Increment) Salary*(1+(Increment/100))^Years

server<- function(input, output) {
    output$inputValueSalary <- renderPrint({input$Salary})
    output$inputValueIncrement <- renderPrint({input$Increment})
    output$inputValueYears <- renderPrint({input$Years})
    output$SalaryCalculation <- renderPrint({Salary(input$Salary,input$Years,input$Increment)})
  }


shinyApp(ui = ui, server = server)