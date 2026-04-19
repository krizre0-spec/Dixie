setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(shiny)
library(lubridate)
library(DT)

# Function for saving data to a CSV file
log_line <- function(newdata, filename = 'app_data.csv'){
  (dt <- Sys.time() %>% round %>% as.character)
  (newline <- c(dt, newdata) %>% paste(collapse=',') %>% paste0('\n'))
  cat(newline, file=filename, append=TRUE)
  print('Data stored!')
}

################################################################################
################################################################################

ui <- fluidPage(
  titlePanel(h4("Data entry app")),
  br(),
  fluidRow(
    # Example input: manual text entry
    column(4, textInput('text',
                        label='Recorder name here',
                        value='Lizzie Kriz',
                        width = '95%')),
    
    # Example input: selecting pre-canned options
    column(4, selectInput('select',
                          label='Select here',
                          choices = c('Prompted', 'Unprompted', 'NA'),
                         # choices = paste('select', 1:4),
                          width='95%')),
    
    # Example input: toggling between options
    column(4, radioButtons('radio',
                           label='Toggle here',
                           choices = c('Bed', 'Floor', 'Outside'),
                          # choices = paste('toggle', 1:4),
                           inline = TRUE,
                           width='95%'))),
  br(),
  br(),
  fluidRow(column(2),
           # Save button!
           column(8, actionButton('whine',
                                  h2('Whine'),
                                  width='100%')),
           column(2)),
 column(3, actionButton('growl',
                                  h2('Growl'),
                                  width='100%')),
column(4, actionButton('play',
                                  h2('Play'),
                                  width='100%')),
column(5, actionButton('bathroom',
                                  h2('Bathroom'),
                                  width='100%')),
column(6, actionButton('groom',
                                  h2('Groom'),
                                  width='100%')),
column(6, actionButton('stare',
                                   h2('Stare'),
                                  width='100%')),
column(6, actionButton('wiggle',
                       h2('Wiggle'),
                       width='100%')),
 column(8, actionButton('lick',
                                  h2('Lick'),
                                  width='100%')))
################################################################################
################################################################################

server <- function(input, output) {
  
  # Save button ================================================================
  observeEvent(input$whine, {
    newdata <- c(input$text, input$select, input$radio)
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Growl button ================================================================
  observeEvent(input$growl, {
    newdata <- c(input$text, input$select,'Growl')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Play button ================================================================
  observeEvent(input$play, {
    newdata <- c(input$text, input$select,'Play')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Lick button ================================================================
  observeEvent(input$lick, {
    newdata <- c(input$text, input$select,'Lick')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Groom button ================================================================
  observeEvent(input$groom, {
    newdata <- c(input$text, input$select,'Groom')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Stare button ================================================================
  observeEvent(input$stare, {
    newdata <- c(input$text, input$select,'Stare')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Wiggle button ================================================================
  observeEvent(input$wiggle, {
    newdata <- c(input$text, input$select,'Wiggle')
    log_line(newdata)
    showNotification("Save successful!")
  })
  #=============================================================================
  # Bathroom button ================================================================
  observeEvent(input$bathroom, {
    newdata <- c(input$text, input$select,'Bathroom')
    log_line(newdata)
    showNotification("Save successful!")
  })
}

################################################################################
################################################################################

shinyApp(ui, server)

