shinyUI(navbarPage("Black–Scholes model",
                   tabPanel("Calculator",
                            sidebarLayout(
                              sidebarPanel(
                                numericInput('days', 'Days to expiry', 22, min = 1, max = 10000, step = 1),
                                numericInput('vol', 'Implied volatility, percent', 25, min = 1, max = 1000, step = 1),
                                numericInput('stock', 'stock price', 100, min = 0.01, max = 1000, step = 0.01),
                                numericInput('strike', 'strike price', 100, min = 0.01, max = 1000, step = 0.01),
                                numericInput('rate', 'interest rate, percent', 0.25, min = 0, max = 100, step = 0.01),
                                checkboxInput("call.opt", "Call option", TRUE),
                                submitButton('Submit')
                              ),
                              mainPanel(
                                h3('Calculation results'),
                                h4('Fair value of the european option is'),
                                verbatimTextOutput("opt")
                                
                              )	
                              
                            )),
                   tabPanel("Documentation",
                            fluidPage(
                              mainPanel(
                                h3('Black-Scholes model is the earliest and simpliest model for pricing European options. It takes several parameters:
                                   time to expiry, implied volatility, stock and strike prices, risk free rate of interest and option type and calculates the
                                   fair value of the option.'),
                                tags$div(class = "header", checked = NA,
                                         tags$p("If You want to learn more about Black-Scholes model"),
                                         tags$a(href = "https://en.wikipedia.org/wiki/Black-Scholes_model", "Click Here!")
                                )
                                ,width=12)
                            ))
                          
))