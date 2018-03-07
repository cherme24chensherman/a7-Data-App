# install.packages("shiny")
# install.packages("shinydashboard")
library("shiny")
library("shinydashboard")
library("dplyr")

wdi.emissions.full <- read.csv("./data/WDI_emissions_Data.csv", stringsAsFactors = FALSE)
# View(wdi.emissions.full)

my.ui <- fluidPage(
  titlePanel("Hahaha"
    ),
    mainPanel(
      sidebarPanel(
        sliderInput('slide.key', label = "Pollution threshold", 
                    min = 1998, max = 2015, value = 1998),
        selectInput("select", h3("Select Year"),
                    choices = c("All years", "1998", "1999", "2000", "2001",
                    "2002", "2003", "2004", "2005", 
                    "2006", "2007", "2008", "2009", "2010", 
                    "2011", "2012", "2013", "2014")
        )
      ), 
      tabsetPanel(
        tabPanel("Table", dataTableOutput("tabelu")),
        tabPanel("Map", textInput('text.key', label = "Hello")
      )
    )
  )
)



my.ui2 <- hist(runif(1:50))
my.ui3 <- hist(runif(1:500))
uihaha <- fluidPage('my.ui2', 'my.ui3')

