shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    MFN <- input$Intr/1200
    P <- 12*input$Tnr
    MFD <- 1-((1+MFN)^(-P))
    EMI <- input$LnAmt*(MFN/MFD)
    paste("EMI for a loan of $", input$LnAmt, " at the rate of ", input$Intr, "% pa for period of ",input$Tnr, " year is $", sprintf("%.2f",EMI), sep = "")
  })
  
  # Return the formula text for printing as a caption
  output$EmiOut <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
})