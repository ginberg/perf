# Medicare server part

shinyServer(function(input, output, session){

  # if dashboard should be updated contineously
  update <- reactiveValues(do = TRUE)
  
  topOutput <- reactive({
    
    if(update$do == TRUE){
      invalidateLater(input$updateFreq*1000)
    }
    
    sysOutput <- system("top -b -n 1", intern =  TRUE)
    nrows <- length(sysOutput)
    maxResults <- ifelse(input$maxResults < nrows, input$maxResults + 7, nrows) 
    
    # line 7 is the header, from line 8 the content
    out <- read.table(text = sysOutput[8:maxResults], header = FALSE, fill = TRUE)
    colnames(out) <- scan(text = sysOutput[7], what = "")
    
    return(out)
  })
  
  observeEvent(input$stopRefresh, {
    update$do <- FALSE
  })
  
  observeEvent(input$updateRefresh, {
    update$do <- TRUE
  })
  
  # render the table
  output$dataTable = renderDataTable({
    df <- topOutput()
    
    datatable(df, rownames = FALSE, extensions = 'Buttons', class = "compact",
              options = list(pageLength = MAX_ITEMS_PER_PAGE, 
                             lengthMenu = LENGTH_MENU,
                             paging = TABLE_PAGING,
                             pagingType='simple',
                             dom = 'Blfrtip',
                             buttons = list(list(extend = 'csv', exportOptions = list(columns = ':visible')), list(extend = 'pdf', exportOptions = list(columns = ':visible')),
                                            list(extend = 'colvis', text='Show/Hide Columns', collectionLayout='fixed two-column'))
              )
    )
  })
  
})