# Change working directory to run local
setwd("C:/git_repositories/MSDS6306_HW11")

library(tseries)
suppressWarnings(library(ggplot2))

DDDdata <- get.hist.quote('ddd',quote="Close")

DDDret <- log(lag(DDDdata)) - log(DDDdata)

DDDvol <- sd(DDDret) * sqrt(250) * 100



## volatility
get
Vol <- function(d, logrets)
{
  
  var = 0
  
  lam = 0
  
  varlist <- c()
  
  for (r in logrets) {
    
    lam = lam*(1 - 1/d) + 1
    
    var = (1 - 1/lam)*var + (1/lam)*r^2
    
    varlist <- c(varlist, var)
    
  }
  
  sqrt(varlist)
}


# Recreate Figure 6.12 in the text on page 155

volest <- Vol(10,DDDret)

volest2 <- Vol(30,DDDret)

volest3 <- Vol(100,DDDret)

volplot <- plot(volest,type="l", main="3D Systems (DDD)")
volplot
lines(volest2,type="l",col="red")

lines(volest3, type = "l", col="blue")
suppressMessages(suppressWarnings(ggsave(filename = "volDDD.png", plot = volplot)))