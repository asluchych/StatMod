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

summary(lm(y ~ x+ Treat))
