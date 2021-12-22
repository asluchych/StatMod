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

################################################################
# Folie 53-54: Indizierung
################################################################

x[3]
x[1:3]

elem <- 2:5
M2[elem]

M2[2, 3]
M2[, c(1, 3)]
M2[2, 2:3]

is.matrix(M2)
is.matrix(M2[2, 2:3])
#  R versucht beim Indizieren eine Dimension fallen zu lassen!
# Drop: Delete the dimensions of an array which have only one level
is.matrix(M2[2, 2:3, drop = FALSE])

M4 <- matrix(1:16, ncol = 4, byrow = TRUE)
M4

M5 <- M4[-4, ]
M5

# Matrix erweitern (Zeile)
rbind(M5, 13:16)

M6 <- M4[ , -(3:4)]
M6

# Matrix erweitern (Spalte)
cbind(M6,
      seq(3, by = 4, length.out = 4),
      seq(4, by = 4, length.out = 4))

# Indizierung und Zuweisung: Elemente der Objekte verändern

M4[4, ] <- 1:4
M4

################################################################
# Folie 55: Ein weiterer Datentyp
################################################################

# Typ des Objekts:
mode(x)
mode(V)
mode(M2)

alb <- matrix(c("Kraftwerk", "Kraftwerk",
                "Daft Punk", "Daft Punk",
                "Autobahn", "Trans Europa Express",
                "Homework", "Random Access Memories")
              , ncol = 2)
mode(alb)

# Spalten und Zeilen beschriften und Indizieren:
colnames(alb) <- c("Band", "Album")
rownames(alb) <- c(1974, 1977, 1997, 2013)

alb
alb["1977", ]

# Zeichenketten miteinander verbinden
paste(alb[ , 1], alb[ , 2], sep = " - ")

################################################################
# Folie 56: Faktoren
################################################################

titanic_data <- data.frame(Titanic)
titanic_data
titanic_data_fact <- factor(titanic_data$Class, 
                            labels = c("1st", "2nd", "3rd", "Crew"))
titanic_data_fact

code <- c(10, 6, 2, 8, 8, 10, 10, 2)
code_fact <- factor(code, labels = c(2, 6, 8, 10))
code_fact
as.numeric(code_fact)
as.numeric(as.character(code_fact))

################################################################
# Folie 57: Kategorisierung metrischer Daten
################################################################

women_grp <- cut(women$height, breaks = 3, labels = c("Short", "Medium", "Tall"))
women_grp
table(women_grp)

women_grp_new <- cut(women$height, breaks = c(0, 60, 65, 100))
women_grp_new
table(women_grp_new)