source("global.R")

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  
  HTML("<!-- common header-->
  <div id='headerSection'>
    <h1>Real time system performance</h1>
    <span style='font-size: 1.2em'>
      <span>Created by </span>
      <a href='http://gerinberg.com'>Ger Inberg</a>
      &bull;
      <span>November 2017</span>
      &bull;
      <a href='http://gerinberg.com/shiny'>More apps</a> by Ger
    </span>
  </div>"),
  
  div(titlePanel("Real time system performance"), align="center"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("maxResults", "Maximum results", min = SLIDER_MIN_VALUE, max = SLIDER_MAX_VALUE, value = SLIDER_INIT_VALUE),
      hr(),
      h4("Update behaviour"),
      p(),
      actionButton("stopRefresh", "Freeze"), actionButton("updateRefresh", "Resume"),
      hr(),
      sliderInput("updateFreq", "Update frequency (sec)", min = FREQ_SLIDER_MIN_VALUE, max = FREQ_SLIDER_MAX_VALUE, value = FREQ_SLIDER_INIT_VALUE),
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