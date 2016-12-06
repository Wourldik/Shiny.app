library(shiny)
library(XLConnect)

checkbox <- function(){
  data <- data.frame(readWorksheet(loadWorkbook("data.xls"), sheet = "sheet", startRow = 13))
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}

shinyUI(pageWithSidebar(
  headerPanel("Кількість жінок у містах"),
  
  sidebarPanel(
    checkboxGroupInput("city", "Виберіть регіон:", checkbox())
  ),
  
  mainPanel(
    plotOutput("plot", height = "800px")
  )
))