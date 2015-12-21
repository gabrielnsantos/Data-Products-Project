library("shiny")

MLscrap <- function(search, n)
        
{
        
        library("rvest")
        
        text_slct <- vector(mode="numeric", length=0)
        
        url <- paste("http://lista.mercadolivre.com.br/", search, "_OtherFilterID_INTERES", sep = "")
        
        try(
{
        code <- html(url)
        nodes <- html_nodes(code, "#searchResults .ch-price")
        text <- html_text(nodes)
        
        for (k in 0:(n-1))
        {
                text_slct <- c(text_slct, text[(k*2) + 1])
        }
        
        text_trim <- substring(text_slct, first = 5, last = 10000)
        text_trim <- gsub("\\.", "", text_trim)
        num <- as.numeric(text_trim)/100
        result <- median(num, na.rm = TRUE)
}, silent = FALSE)

return(result)
}

shinyServer(
        function(input,output) {
                output$inputText <- renderPrint({input$search})
                output$inputNumber <- renderPrint({input$n})
                output$prediction <- renderPrint({MLscrap(input$search, input$n)})
        }
)