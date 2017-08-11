library(ggplot2)

shinyUI(fluidPage(
	
	# Application title
	titlePanel("Investigation of Mammal Sleep Data"),
	
	# Sidebar with options for the data set
	sidebarLayout(
		sidebarPanel(
			selectInput("SB", h3("Select the mammal's biological order:"), choices=list("omni", "carni", "herbi", "insecti"),multiple=FALSE),
			sliderInput("S",h3("Size of Points on Graph",style="font-family: Courier New; color:green"),min=1, max=10,value=100,animate=TRUE,step=0.25),
		checkboxInput("CB",label=h3("Color Code Conservation Status", style="color:red"),value=FALSE,width="100%") #note the use of CSS separators for adding styling. 
		),
		
		# Outputs  
		mainPanel(plotOutput("sleepPlot"), 
							textOutput("info"), #dataInfo is name of "text" object in server
							tableOutput("table")
			
		)
	)
))