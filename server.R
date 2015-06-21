option.value <- function(days,vol,stock,strike,rate,call.opt){
  d1 <- (1/(vol*0.01*sqrt(days/365)))*(log(stock/strike)+(rate*0.01+0.5*vol^2*0.0001)*(days/365))
  d2 <- d1 - vol*0.01*sqrt(days/365)
  call.value <- pnorm(d1)*stock - pnorm(d2)*strike*exp(-rate*0.01*days/365)
  put.value <- strike*exp(-rate*0.01*days/365) - stock + call.value
  if(call.opt==TRUE){call.value} else{put.value}
}
shinyServer(
  function(input, output) {
    
    output$opt <- renderPrint({round(option.value(input$days,input$vol,input$stock,input$strike,input$rate,input$call.opt),2)})
    
  }
)