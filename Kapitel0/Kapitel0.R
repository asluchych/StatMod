# Folie 34: Installation, Laden und Entladen von Paketen

install.packages("fortunes")
library(fortunes)
fortune()
detach(package:fortunes, unload = TRUE)

# Folie 35: Das Arbeitsverzeichnis

getwd()
setwd("D:/git/StatMod/Kapitel0")

# Folie 37: R als wissenschaftliche Taschenrechner

# integer division
16 %/% 5

# modulus
16 %% 5

10 ^ 6

abs(-16)

sqrt(16)

exp(16)

log(exp(16))

factorial(6)

# Folie 38: (Numerische) Vektoren

c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

seq(from = 1, to = 10, by = 1)

# binärer Operator
seq(1, 10)

1:10

seq(26, by = 2, length.out = 5)

seq(to = 26, by = 2, length.out = 5)

seq(26, by = -2, length.out = 5)

# Folie 40: Oft genutzte mathematische Funktionen

min(1:10)

cummin(c(15, 20, 10, 30, 5))

max(1:10)

cummax(c(15, 20, 10, 30, 5))

sum(1:10)

cumsum(1:10)

prod(1:10)

cumprod(1:10)

# Folie 41: Runden und Trunkieren

round(1183.63, digits = 1)

round(1183.63, digits = -2)

signif(1183.63, digits = 3)

floor(1183.63)

ceiling(1183.63)

trunc(1183.63)

trunc(-1183.63)

# Folie 42: Wiederholungen in Vektoren

