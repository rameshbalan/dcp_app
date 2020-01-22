## app.R ##
library(shiny)
library(shinydashboard)
require(ggplot2)
require(plyr)
require(plotly)

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
                box(
                  title = "Males Vs Females across different species",
                  height = 800,
                  plotlyOutput("genome_plot1")),
                box(
                  title = "Controls",
                  sliderInput("lowerT",
                              "Lower Threshold for Filter(passed as expression > selected value)",
                              0,
                              10,
                              0),
                  sliderInput("upperlim",
                              "Upper Limit for Visualization (zoom)",
                              0,
                              100000,
                              1500)
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

server <- function(input, output) {

output$genome_plot1 <- renderPlotly({
	infile <- read.table("data/annotated_normalized_count_map.txt")
	colnames(infile) <- c("gene","sample","norm_count","species","gender","chrom_num","chrom_name")
	infile_no_un <- infile[infile$chrom_name != "Un",]
	ggplot(data = infile_no_un[infile_no_un$norm_count > input$lowerT, ], aes(x = chrom_name,
                          y = norm_count))+
	  geom_boxplot()+
	  xlab("Chromosome")+
	  ylab("Normalized Count (DESeq's Median of Ratios)")+
	  coord_cartesian(ylim = c(0,input$upperlim))+
	  facet_grid(species ~ gender)
	ggplotly(width = 500, height = 700)
})

}

shinyApp(ui, server)