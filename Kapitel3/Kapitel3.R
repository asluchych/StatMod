#################################################
# Folie 16
#################################################

set.seed(123)
n <- 200
Treat <- factor(rep(c(0, 1), each = n/2), labels = c("nein", "ja"))
x <- rep(NA, n)
x[Treat == "nein"] <- rnorm(n/2, 70, 10)
x[Treat == "ja"] <- rnorm(n/2, 80, 10)
y <- x + rnorm(n, 0, 5)

# Differenz der im Mittel erreichten Punkte
tapply(y, Treat, mean)["ja"] - tapply(y, Treat, mean)["nein"]

summary(lm(y ~ Treat))

#################################################
# Folie 17
#################################################

set.seed(123)
n <- 200
Treat <- factor(rep(c(0, 1), each = n/2), labels = c("nein", "ja"))
x <- rep(NA, n)
x[Treat == "nein"] <- rnorm(n/2, 80, 10)
x[Treat == "ja"] <- rnorm(n/2, 70, 10)
delta <- numeric(n)
delta[Treat == "ja"] <- 10
y <- x + delta + rnorm(n, 0, 5)

summary(lm(y ~ Treat))

#################################################
# Folie 26
#################################################

set.seed(123)
n <- 200
Treat <- factor(rep(c(0, 1), each = n/2), labels = c("nein", "ja"))
x <- rep(NA, n)
x[Treat == "nein"] <- rnorm(n/2, 70, 10)
x[Treat == "ja"] <- rnorm(n/2, 80, 10)
y <- x + rnorm(n, 0, 5)

# Differenz der im Mittel erreichten Punkte
tapply(y, Treat, mean)["ja"] - tapply(y, Treat, mean)["nein"]

summary(lm(y ~ x + Treat)) 

#################################################
# Folie 60
#################################################

library(AER)
data("RecreationDemand")
recreationDemand <- subset(RecreationDemand, subset = quality != 0)

fm_pois <- glm(trips ~ ., family = poisson, data = recreationDemand)
summary(fm_pois)

#################################################
# Folie 61
#################################################

fm_quasi_pois <- glm(trips ~ ., family = quasipoisson, data = recreationDemand)
summary(fm_quasi_pois)

#################################################
# Folie 62
#################################################

library(boot)
X <- model.matrix(fm_pois)[, -1]
DAT <- data.frame(RecreationDemand$trips, X)

pois.boot <- function(data, i) {
  y <- DAT[i, 1]
  X <- as.matrix(DAT[i, -1])
  coef(glm(y ~ X, family =  poisson))
}

boot.pois <- boot(DAT, pois.boot, R = 999)

boot.pois_ci <- apply(boot.pois$t, 2, quantile, c(.025, .975))
colnames(boot.pois_ci) <- names(coef(fm_pois))

plot(boot.pois, 5)


