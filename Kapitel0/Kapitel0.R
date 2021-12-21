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