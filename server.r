read.data <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  colnames(data) <- c("Україна", "16–59 років", "18 років і старше", "60 років і старше", "65 років і старше")
  return (data)
}

data <- read.data()

colors <- c("#FF0000", "#000cff", "#00ff0c", "#1a9b9d", "#750db1", "#1dc87a", "#ffa800", "#d44d0a", "#ca2149", "#3a58f0")

draw_ <- function(city, j, length){
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == city[j]){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  if(j == 1){
    plot(2:5, data[index, 2:5], type = "b", xaxt = "n", xlab = "Вік", ylab = "Кількість",col = colors[j],ylim=c(0,30))
    #title(data[index, 1])
    axis(1, at = 1:length(data),  labels = names(data))
  } else {
    lines(2:5, data[index, 2:5], type = "b", xaxt = "n", xlab = "Вік", ylab ="Кількість", col = colors[j])
  }
  legend("topright", legend = city, col = colors, lty = 1)
}

draw <- function(city){
  if(is.null(city)){
    return()
  }
  
  
  for(i in 1:length(city)){
    draw_(city,i,length(city))
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$city)
    })
  }
)