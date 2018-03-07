library("ggplot2")
library("dplyr")
library("tidyr")

#####
wdi.emissions.full <- read.csv("./data/WDI_emissions_Data.csv", na.strings = c("", "NA"), stringsAsFactors = FALSE)
colnames(wdi.emissions.full)[1] <- "Country.Name"
wdi.emissions.full <- na.omit(wdi.emissions.full)
wdi.emissions.mod <- aggregate(wdi.emissions.full[, -1], wdi.emissions.full[1], mean)
wdi.emissions.mod$Series.Code = NULL
#View(wdi.emissions.mod)
#View(wdi.emissions.full)

source("ui.R")

# newTable <- function(slide.key) {
#   if(slide.key == 1998) {
#     table.1998 <- select(wdi.emissions.mod, YR1998)
#     renderDataTable({table.1998
#       return(table.1998)})
#   } else{
#     renderDataTable({wdi.emissions.mod
#       return(wdi.emissions.mod)
#     })
#   }
# }

# my.server <- function(input, output) {
#   if(input$slide.key == 1998) {
#     table.1998 <- select(wdi.emissions.mod, paste0("YR", input$slide.key))
#     renderDataTable({table.1998
#       return(table.1998)})
#   } else{
#     renderDataTable({wdi.emissions.mod
#       return(wdi.emissions.mod)
#     })
#   }

# my.server <- function(input, output, session) {
  # slider.data <- reactiveValues()
  # slider.data$value <- input$slide.key
  #  
  # slider_value <- reactive({
  #   return(input$slide.key)
  # })
  # 
  # table.1998 <- select(wdi.emissions.mod, paste0("YR", slider_value()))
  # output$tabelu <- renderDataTable ({
  #   table.1998 
  #   })
my.server <- function(input, output, session) {
  iinput.select <- reactive({
    switch(input$select,
           "choices" = choices
    )
  wdi.emissions.x <- select(wdi.emissions.mod, paste0("YR", iinput.select()))
  return(wdi.emissions.x)
  })
  output$tabelu <- renderDataTable({wdi.emissions.x
  })
}


# table.1998 <- select(wdi.emissions.mod, YR1998)
# View(table.1998)
  
  #output$message <- renderText({
    
    #my.message <- paste("Hahaha, my name is", input$username)
    #return(my.message)
  #})
  
  #output$runif <- renderPlot({
    #ranum <- runif(input$num, 1, 10)
    #return(hist(ranum))
  #})
  
  #uniform.nums <- reactive({
    #return(runif(input$num, 1, 10))  # just like for a render function
  #})
  
  # render a table
  
  
  # render the counts
  #output$counts <- renderPrint({
    #counts <- factor(cut(uniform.nums(), breaks=1:10))  # call the reactive variable AS A FUNCTION
    #return(summary(counts))
  #})
#}

source("ui.R")
shinyApp(ui = my.ui, server = my.server)

# filter.pipe <- %>%
  # filter(price > price)

