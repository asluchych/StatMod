%>% rm(list = ls())
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

#################################################
# Folie 24
#################################################

SwissLabor.logit <- SwissLabor
SwissLabor.logit$participation <- relevel(SwissLabor.logit$participation, ref = "no")
summary(SwissLabor.logit)

log.model <- glm(participation ~ income + age + education + youngkids + 
                   oldkids + foreign + I(age^2), family = binomial(link = "logit"), data = SwissLabor.logit)
summary(log.model)

#################################################
# Folie 27
#################################################

exp(coef(log.model))["foreignyes"]

#################################################
# Folie 28
#################################################

eff_income <- fitted(log.model) * (1 - fitted(log.model)) * coef(log.model)["income"]
ame_income <- mean(eff_income)
ame_income

X <- model.matrix(log.model)
X_bar <- colMeans(X)
X_bar0 <- X_bar
X_bar0["foreignyes"] <- 0
eta_bar0 <- X_bar0 %*% coef(log.model)
mem_income0 <- binomial()$linkinv(eta_bar0) * (1 - binomial()$linkinv(eta_bar0)) *
              coef(log.model)["income"]

X_bar1 <- X_bar
X_bar1["foreignyes"] <- 1
eta_bar1 <- X_bar1 %*% coef(log.model)
mem_income1 <- binomial()$linkinv(eta_bar1) * (1 - binomial()$linkinv(eta_bar1)) *
  coef(log.model)["income"]

mem_income0
mem_income1

#################################################
# Folie 30
#################################################

library("effects")
e1.log <- predictorEffect("income", log.model)
plot(e1.log)


#################################################
# Folie 34
#################################################

library('arm')
binnedplot(log.model$fitted.values, log.model$residuals )