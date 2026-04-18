library(shiny)

fluidPage(

  titlePanel("Colorado Trout Weight Estimator"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("length",
        label = "Fish Length (inches):",
        min = 6, max = 30, value = 14, step = 0.5
      ),
      radioButtons("species",
        label = "Species:",
        choices = list(
          "Rainbow Trout" = "rainbow",
          "Brown Trout"   = "brown",
          "Brook Trout"   = "brook"
        ),
        selected = "rainbow"
      ),
      hr(),
      p("Colorado minimum keeper size: 12 inches on most waters.")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Results",
          br(),
          h4(textOutput("verdict")),
          br(),
          textOutput("weight"),
          br(),
          plotOutput("curve")
        ),
        tabPanel("How to Use",
          br(),
          p("1. Use the slider to enter the length of your fish in inches."),
          p("2. Select the species using the radio buttons."),
          p("3. The app estimates the fish's weight using a standard
             length-weight formula and tells you whether it meets
             Colorado's 12-inch minimum keeper size."),
          p("4. The chart shows where your fish falls on the
             typical length-weight curve for that species."),
          br(),
          p(strong("Note:"), "Weight estimates are based on average
            condition factors for Colorado high-altitude trout.
            Individual fish may vary.")
        )
      )
    )
  )
)
