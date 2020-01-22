## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dosage Compensation",titleWidth = 235),
  dashboardSidebar(width = 235,
    sidebarMenu(
    menuItem("Genome Based", tabName = "genome", icon = icon("dna")),
    menuItem("De Novo Based", tabName = "denovo", icon = icon("align-center"),
    menuSubItem("Fold Change Comparison", tabName = "fccomp", icon = icon("chart-bar")))
  )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "genome",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "denovo",
              h2("De Novo Based")
      )
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)