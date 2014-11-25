shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Height prediction based on Parents Height"),
        sidebarPanel(
            h4("Predict the height of a child based on it's parents heights."),
            p("Prediction is calculated using a linear regression model on the GaltonFamilies data."),
            p("Use the sliders to choose the mother's height and the father's height. Click submit for result."),
            sliderInput("mother", "Mother's Height in inches", 64, min = 55, max = 75, step = 1),
            sliderInput("father", "Father's Height in inches", 71, min = 60, max = 80, step = 1),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Results of prediction'),
            h4('You entered the following for height of Mother'),
            verbatimTextOutput("mother"),
            h4('And you entered the following for height of Father'),
            verbatimTextOutput("father"),
            h4('And the prediction is'),
            verbatimTextOutput("girl"),
            verbatimTextOutput("boy")
        )
    )
)