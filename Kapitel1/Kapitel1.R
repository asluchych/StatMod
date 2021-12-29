# Folie 20 Beispiel 1.1

YT <- c(37.48, 25.13, 8.64, 6.26, 55.34, 42.84, 36.94, 26.44, 11.00, 81.16, 29.26, 7.20, 25.56, 17.57, 16.42)
S <- c(6.18, 4.73, -7.14, -8.14, 27.24, -0.28, 15.34, 5.24, -2.80, 13.78, 5.26, -6.50, -0.84, 6.77, 0.46)
shiw <- data.frame(YT, S)
plot(shiw$YT, shiw$S, xlab = "Einkommen (1000 EUR)", ylab = "Ersparnis (1000 EUR)")


model <- lm(S ~ YT, data = shiw)
summary(model)
abline(model, col = "red")

#########################################################
# Folie 46: Regressionsebene
#########################################################

install.packages("scatterplot3d")
library(scatterplot3d)

data(iris)
head(iris)

scatterplot3d(iris [ , 1:3])

# Change the angle:
scatterplot3d(iris [ , 1:3], angle = 55)

scatterplot3d(iris [ , 1:3], angle = 55,
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")

scatterplot3d(iris [ , 1:3], angle = 55, pch = 16, color = "steelblue",
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")

# Change point shapes by groups:
shapes <- c(16, 17, 18) 
shapes <- shapes[as.numeric(iris$Species)]
scatterplot3d(iris [ , 1:3], angle = 55, pch = shapes,
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")

# Change point colors by groups
colors <- c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(iris [ , 1:3], angle = 55, pch = shapes, color = colors,
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")

# Remove the box around the plot
scatterplot3d(iris [ , 1:3], angle = 55, pch = shapes, color = colors,
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)",
              grid = TRUE, box = FALSE)

# Add grids
source('http://www.sthda.com/sthda/RDoc/functions/addgrids3d.r')
scatterplot3d(iris[, 1:3], pch = 16, grid=FALSE, box=FALSE)
addgrids3d(iris[, 1:3], grid = c("xy", "xz", "yz"))

source('http://www.sthda.com/sthda/RDoc/functions/addgrids3d.r')
# Create empty 3D scatter plot using pch=""
s3d <- scatterplot3d(iris[, 1:3], pch = "", grid=FALSE, box=FALSE)
# Add grids
addgrids3d(iris[, 1:3], grid = c("xy", "xz", "yz"))
Add points
s3d$points3d(iris[, 1:3], pch = 16)

# Add bars
scatterplot3d(iris[, 1:3], pch = 16, type="h", color=colors)

# Add legends
s3d <- scatterplot3d(iris[, 1:3], pch = 16, color=colors)
legend(s3d$xyz.convert(7.5, 3, 4.5), legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# Specify the legend position using keywords
graphics.off()
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("right", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("right", legend = levels(iris$Species),
       col = c("#999999", "#E69F00", "#56B4E9"), pch = 16, inset = 0.1)

graphics.off()
s3d <- scatterplot3d(iris[ ,1:3], pch = 16, color=colors)
legend("bottom", legend = levels(iris$Species),
       col = c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# Customize the legend position
graphics.off()
s3d <- scatterplot3d(iris[, 1:3], pch = shapes)
legend("bottom", legend = levels(iris$Species),
       pch = c(16, 17, 18), 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

graphics.off()
s3d <- scatterplot3d(iris[, 1:3], pch = shapes, color=colors)
legend("bottom", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), 
       pch = c(16, 17, 18), 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

# Add point labels
scatterplot3d(iris[, 1:3], pch = 16, color=colors)
text(s3d$xyz.convert(iris[, 1:3]), labels = rownames(iris),
     cex= 0.7, col = "steelblue")

# Add regression plane and supplementary points
data(trees)
head(trees)

s3d <- scatterplot3d(trees, type = "h", color = "blue", 
                     angle=55, pch = 16)
lm.trees <- lm(trees$Volume ~ trees$Girth + trees$Height)
s3d$plane3d(lm.trees)
s3d$points3d(seq(10, 20, 2), seq(85, 60, -5), seq(60, 10, -10),
             col = "red", type = "h", pch = 8)

#########################################################
# Folie 57: Lineare Restriktionen
#########################################################
library(carData)
linearHypothesis()

#########################################################
# Folie 67
#########################################################
install.packages('wooldridge')
library(wooldridge)
data("wage1")

data <- wage1

lin_lin_mod <- lm(wage ~ educ + exper + tenure, data = data)

log_lin_mod <- lm(log(wage) ~ educ + exper + tenure, data = data)

#########################################################
# Folie 68
#########################################################
lin_lin_mod.stdres <- rstandard(lin_lin_mod)
qqnorm(lin_lin_mod.stdres, col = "steelblue",
       main = "QQ-Plot des linearen Modells")
qqline(lin_lin_mod.stdres, col = "red")

log_lin_mod.stdres <- rstandard(log_lin_mod)
qqnorm(log_lin_mod.stdres, col = "steelblue",
       main = "QQ-Plot des log-linearen Modells")
qqline(log_lin_mod.stdres, col = "red")

#########################################################
# Folie 69
#########################################################

summary(log_lin_mod)

Koeff <- function(beta){100*(exp(beta) - 1)}

Koeff(log_lin_mod$coefficients[2])

#########################################################
# Folie 75
#########################################################
linearHypothesis(log_lin_mod, c("exper = 0", "tenure = 0"))

#########################################################
# Folien 76-77
#########################################################

plot(log_lin_mod)

#########################################################
# Folie 83
#########################################################
CPS1985 <- read.csv("CPS1985.csv")
str(data)

# Dummy-Variable hinzufügen
CPS_reg <- lm(log(wage) ~ education + gender, data = CPS1985)
summary(CPS_reg)

# Basiskategorie aendern
table(CPS1985$gender)
CPS1985$gender <- as.factor(CPS1985$gender)
CPS1985$gender <- relevel(CPS1985$gender, ref = "male")

CPS_reg_relev <- lm(log(wage) ~ education + gender, data = CPS1985)
summary(CPS_reg_relev)

Koeff(CPS_reg$coefficients[2])
Koeff(CPS_reg$coefficients[3])

#########################################################
# Folie 87
#########################################################
# Interaktion mit Dummys
CPS_interact_reg <- lm(log(wage) ~ education + gender + education*gender,
                       data = CPS1985)
summary(CPS_interact_reg)

#########################################################
# Folie 88
#########################################################
linearHypothesis(CPS_interact_reg, c("genderfemale = 0", "education:genderfemale = 0"))

