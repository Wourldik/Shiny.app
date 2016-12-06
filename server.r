read.data <- function(){
  read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
}

data <- read.data()

draw_ <- function(city, length){
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == city){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  plot(2:5, data[index, 2:5], type = "l", xaxt = "n", xlab = "Вік", ylab = "Кількість")
  title(data[index, 1])
  axis(1, at = 1:length(data),  labels = names(data))
}

draw <- function(city){
  if(is.null(city)){
    return()
  }
  
  par(mfrow = c(length(city), 1))
  
  for(i in 1:length(city)){
    draw_(city[i], length(city))
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$city)
    })
  }
)