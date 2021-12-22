################################################################
# Folie 34: Installation, Laden und Entladen von Paketen
################################################################

install.packages("fortunes")
library(fortunes)
fortune()
detach(package:fortunes, unload = TRUE)

################################################################
# Folie 35: Das Arbeitsverzeichnis
################################################################

getwd()
setwd("D:/git/StatMod/Kapitel0")

################################################################
# Folie 37: R als wissenschaftliche Taschenrechner
################################################################

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

################################################################
# Folie 38: (Numerische) Vektoren
################################################################

c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

seq(from = 1, to = 10, by = 1)

# binärer Operator
seq(1, 10)

1:10

seq(26, by = 2, length.out = 5)

seq(to = 26, by = 2, length.out = 5)

seq(26, by = -2, length.out = 5)

################################################################
# Folie 40: Oft genutzte mathematische Funktionen
################################################################

min(1:10)

cummin(c(15, 20, 10, 30, 5))

max(1:10)

cummax(c(15, 20, 10, 30, 5))

sum(1:10)

cumsum(1:10)

prod(1:10)

cumprod(1:10)

################################################################
# Folie 41: Runden und Trunkieren
################################################################

round(1183.63, digits = 1)

round(1183.63, digits = -2)

signif(1183.63, digits = 3)

floor(1183.63)

ceiling(1183.63)

trunc(1183.63)

trunc(-1183.63)

################################################################
# Folie 42: Wiederholungen in Vektoren
################################################################

rep(16, times = 4)

rep(c(1, 6), times = 4)

rep(c(1, 6), each = 4)

rep(c(1, 6), times = 4, each = 4)

################################################################
# Folie 43: Vektorisierung
################################################################

0:10 + rev(0:10)

1:10 / 1:10

sqrt(c(1, 4, 16, 36, 144))

################################################################
# Folie 44: Recycling
################################################################

1:10 + 10

1:10 + 1:5

################################################################
# Folie 45: Zuweisungen
################################################################

x <- c(10, 13, 1, 6)
y <- c(6, 3, 15, 10)
z <- x + y
z

################################################################
# Folie 47: Der Arbeitsplatz
################################################################

# Namen der Objekte im Arbeitsplatz anzeigen:
ls()

################################################################
# Folie 49: Speichern und Laden
################################################################

# Vektor z speichern
save(z, file = "z.RData")
# Vektor z loeschen
rm(z)
# Vektor z einladen
load("z.RData")
z
# Mit dem Speichern des Konsolenausdrucks anfangen
sink("Vektoren.txt")
x
y
z
# Speichern des Konsolenausdrucks beenden
sink() 
# Arbeitsplatz speichern
save.image()

################################################################
# Folie 51: Matrizen
################################################################

M1 <- matrix(1:6, ncol = 3)
M2 <- matrix(rev(1:6), ncol = 3)
M1 + M2

################################################################
# Folie 52: Matrixoperationen
################################################################

rowSums(M1)
colSums(M1)

# Multiplikation der entsprechenden Elementen
M1 * M2

# Matrixmultiplikation

M1 %*% M2

V <- 1:3

# Umwanldung des Vektors in eine Matrix
as.matrix(V)
M1 %*% V

# Trasponieren einer Matrix
t(M1)

M3 <- matrix(c(1, 2, 2, 3), ncol = 2)

# Inverse einer Matrix berechnen
solve(M3)
M3 %*% solve(M3)

