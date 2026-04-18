library(shiny)

# Length-weight coefficients (imperial: inches -> lbs)
# Formula: W = a * L^b
coefficients <- list(
  rainbow = list(a = 0.000830, b = 3.15),
  brown   = list(a = 0.000710, b = 3.19),
  brook   = list(a = 0.000590, b = 3.22)
)

estimate_weight <- function(length, species) {
  a <- coefficients[[species]]$a
  b <- coefficients[[species]]$b
  round(a * length^b, 2)
}

shinyServer(function(input, output) {

  weight <- reactive({
    estimate_weight(input$length, input$species)
  })

  output$weight <- renderText({
    paste("Estimated weight:", weight(), "lbs")
  })

  output$verdict <- renderText({
    if (input$length >= 12) {
      paste0("Keeper — ", input$length, " inches")
    } else {
      paste0("Too small, release it — ", input$length, " inches")
    }
  })

  output$curve <- renderPlot({
    lengths <- seq(6, 30, by = 0.5)
    weights <- sapply(lengths, function(l) estimate_weight(l, input$species))

    plot(lengths, weights,
      type = "l", lwd = 2, col = "steelblue",
      xlab = "Length (inches)", ylab = "Weight (lbs)",
      main = paste("Length-Weight Curve —",
        switch(input$species,
          rainbow = "Rainbow Trout",
          brown   = "Brown Trout",
          brook   = "Brook Trout"
        )
      )
    )

    points(input$length, weight(), pch = 19, col = "tomato", cex = 2)
    abline(v = 12, lty = 2, col = "gray50")
    text(12.3, max(weights) * 0.9, "12\" min", col = "gray50", adj = 0)
  })

})
