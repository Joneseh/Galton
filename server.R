require("HistData")

childHeight<- function(m,f,g) {
    fit<- lm(childHeight~mother+father+gender, data=GaltonFamilies)
    prediction <-predict.lm(fit, data.frame(mother=m,father=f,gender=g), interval="prediction")
    paste ("For", g , "children, 95%  will be in the range",
           round(prediction[2],1),"inches and", round(prediction[3],1), "inches with an average of", round(prediction[1],1),"inches")

}

shinyServer(
    function(input, output) {
        output$mother <- renderPrint({input$mother})
        output$father <- renderPrint({input$father})
        #prediction <- childHeight(input$mother, input$father)
        output$girl <- renderText({ 
            childHeight(input$mother, input$father, "female")
        })
        output$boy <- renderText({ 
            childHeight(input$mother, input$father, "male")
        })
     }
)