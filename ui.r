library(shiny)

checkbox <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}

shinyUI(pageWithSidebar(
  headerPanel("Кількість жінок у містах"),
  
  sidebarPanel(
    checkboxGroupInput("city", "Виберіть регіон:", checkbox()),
    submitButton("Submit")
  ),
  
  mainPanel(
    plotOutput("plot",height = 800)
  )
))