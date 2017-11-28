source("global.R")

shinyUI(fluidPage(
  div(titlePanel("Real time system performance"), align="center"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("maxResults", "Maximum results", min = SLIDER_MIN_VALUE, max = SLIDER_MAX_VALUE, value = SLIDER_INIT_VALUE),
      hr(),
      h4("Update behaviour"),
      p(),
      actionButton("stopRefresh", "Freeze"), actionButton("updateRefresh", "Resume"),
      hr(),
      sliderInput("updateFreq", "Update frequency (sec)", min = 1, max = 10, value = 3),
      width = 2),
    
    mainPanel(
      tabsetPanel(id='main',
                  tabPanel('System processes', p(),
                           fluidRow(dataTableOutput("dataTable", width='100%', height = '800px'))
                  )      
      )
    )
  )
))