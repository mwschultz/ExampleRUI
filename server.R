library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
	
newData <- reactive({msleep %>% filter(vore==input$vore)})

output$sleepPlot <- renderPlot({
	if (input$conservation == TRUE) {
		g <- ggplot(newData(), aes(x = bodywt, y = sleep_total))
		g + geom_point(size = input$size, aes(col = conservation))
	}
	else {
		g <- ggplot(newData(), aes(x = bodywt, y = sleep_total))
		g + geom_point(size = input$size)
	}
})
  

  #create text info
  output$info <- renderText({
  	paste("The average body weight for order", "is", input$vore, round(mean(newData()$bodywt, na.rm = TRUE), 2), "and the average total sleep time is", round(mean(newData()$sleep_total, na.rm = TRUE), 2), sep = " ")
  })
  
  #create output of observations    
  output$table <- renderTable({
		select(newData(), name, sleep_total, bodywt)
  })
  
})
