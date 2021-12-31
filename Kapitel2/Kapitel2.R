rm(list = ls())
cat("\014")
dev.off()

#################################################
# Folie 7
#################################################

library(AER)
data(SwissLabor)
head(SwissLabor)
SwissLabor$participation <- relevel(SwissLabor$participation, ref = "yes")
str(SwissLabor)

plot(participation ~ age, data = SwissLabor, ylevels = 2:1)
plot(participation ~ income, data = SwissLabor, ylevels = 2:1)
plot(participation ~ foreign, data = SwissLabor, ylevels = 2:1)


SwissLabor.linear <- SwissLabor
SwissLabor.linear$participation <- relevel(SwissLabor.linear$participation, ref = "no")
SwissLabor.linear$participation <- as.numeric(SwissLabor.linear$participation)
SwissLabor.linear$foreign <- as.numeric(SwissLabor.linear$foreign)
str(SwissLabor.linear)

lin.model <- lm(participation ~ income + age + education + youngkids + 
                  oldkids + foreign + I(age^2), data = SwissLabor.linear)
summary(lin.model)