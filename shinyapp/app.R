##############################################################################
# Decyhper App
##############################################################################
library(shiny)
library(cypher)
##############################################################################
#options(encoding="UTF-8")
# Define UI for application that draws a histogram
ui <- fluidPage(
    # Application title
    titlePanel("Cypher App"),
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Cypher Code",
                     textInput("cypherTextInput", "Text to Cypher:", "", width = "100%"),
                     hr(),
                     p("Cyphered Text:"),
                     verbatimTextOutput("cypherTextOutput")
                     ),
            tabPanel("Decypher Code",
                     textInput("decypherTextInput", "Text to Decypher", "", width = "100%"),
                     p("Decyphered Text:"),
                     verbatimTextOutput("decypherTextOutput")
                     )
            )
        )
    )
##############################################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
    output$cypherTextOutput <- renderPrint({
      xx <- cypher_code(input$cypherTextInput)
      xx
    })
    output$decypherTextOutput <- renderPrint({
      cypher_decode(input$decypherTextInput)
    })
}
##############################################################################
# Run the application
shinyApp(ui = ui, server = server)
