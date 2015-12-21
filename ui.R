library("shiny")

shinyUI(pageWithSidebar(
        headerPanel("MercadoLivre Brazil Price Comparison"),
        sidebarPanel(
                h6("In this application, you will be able to search for a anything in MercadoLivre.com (Brazil) and get the median price of the first products listed. You can set the search term and number of products that you want to consider for the median (recommended at least 12 for a good statistical relevance)."),
                textInput("search", 'Search term'),
                numericInput("n", 'Number of products', 12),
                submitButton('Submit')
        ),
        mainPanel(
                h4('You searched for'),
                verbatimTextOutput("inputText"),
                h4('The number of products entered'),
                verbatimTextOutput("inputNumber"),
                h4('The median price found was'),
                verbatimTextOutput("prediction")
        )
))