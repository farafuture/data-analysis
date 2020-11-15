# ISLR Package install

dim(Auto)
names(Auto)

# 1. Statistical Learning Methods
# (a) It is better to use an inflexible method because when n is small there is no enough data to fit a complex model
# for example we 'd rater do best fit line than a polinomila of high degree
#    
#
#b) better use flexible ( complex)method as we have enough samples to fit a complex model , without too much overfitting
#
#
#c) because is the relationship is non linear i think flexible method will perform better, by fitting data better and thus achieving a better MSE score

#d ) high variance on the test data would mean the we the model overfitted and we better use a simpler inflexible method

# 2. Bayes' rule
#
# P(A|B) = P(B|A) * P(A) / P(B)
#
# P(cool) = 8/20
# P(hot) = 12/20
# P(Golf) = 8/20
# P(¬Golf) = 12/20
#
#  
# P(cool | golf) = 5/8
# P(cool | ¬golf) = 3/12
# P(hot | golf) = 3/8    
# P(hot | ¬golf) = 9/12  
#
# P(golf | cool) = p(cool|golf) * P(golf) / P(cool)
# 0.625 * 0.4 / 0.4 = 0.625
#
# P(golf | hot) = P(hot|gold) * P(golf) / P(hot)
# 0.375 * 0.4 / 0.6 = 0.25
#
#
# 3. Descriptive Analysis
# (a) Which of the predictors are quantitative vs qualitative
# The column 'name' and 'origin' is the only qualitative predictor
#
# (b) What is the range of each quantitative predictor?

data("Auto",package = "ISLR")
# Range of mpg
mpgVector <- Auto['mpg']
rangeOfMpg <- range(mpgVector)
#?data.frame

# Range of Cylinders
cylindersVector <- Auto['cylinders']
rangeOfCylinder <- range(cylindersVector)

# Range of displacement
displacementVector <- Auto['displacement']
rangeOfDisplacement <- range(displacementVector)

# Range of horsepower
horsepowerVector <- Auto['horsepower']
rangeOfHorsepower <- range(horsepowerVector)

# Range of weight
weightVector <- Auto['weight']
rangeOfWeight <- range(weightVector)

# Range of acceleration
accelerateVector <- Auto['acceleration']
rangeOfAccelerate <- range(accelerateVector)

# Range of year
yearVector <- Auto['year']
rangeOfYear <- range(yearVector)


# (c) What is the median and variance of each quantitative predictor

# Median : Mpg
mpgMedian <- median(Auto$mpg)

# Median : Cylinders
cylindersMedian <- median(Auto$cylinders)

# Median : Displacement
displacementMedian <- median(Auto$displacement)

# Median : Horsepower
horsepowerMedian <- median(Auto$horsepower)

# Median : Weight
weightMedian <- median(Auto$weight)

# Median : Acceleration
accelerateMedian <- median(Auto$accelerate)

# Median : Year
yearMedian <- median(Auto$year)

# Calculating the variance
# To calculate variance, subtract the mean from each observation

# Variance : Mpg (unbiased)
mpgVariance <- var(mpgVector)

# Variance : Cylinders (unbiased)
cylindersVariance <- var(cylindersVector)

# Variance : Displacement (unbiased)
displacementVariance <- var(displacementVector)

# Variance : Horsepower
horsepowerVariance <- var(horsepowerVector)

# Variance : Weight
weightVariance <- var(weightVector)

# Variance : Acceleration
accelerateVariance <- var(accelerateVector)

# Variance : Year
yearVariance <- var(yearVector)

# (d) : Removing observations 11th to 79th

auto2 <- Auto[c(1:10, 80:392),]
cylindersVector2 <- auto2["cylinders"]
rangeOfCylinder2 <- range(cylindersVector2)

cat("Mpg2 range:" , range(auto2$mpg))






#e)
#plot(Auto$cylinders, Auto$mpg, main="Scatterplot",pch=19)
#abline(lm(Auto$mpg~ Auto$cylinders), col="red"))

plot(Auto$horsepower, Auto$mpg, main="Scatterplot",pch=19)
abline(lm(Auto$mpg~ Auto$horsepower), col="red")


# Linear regression

# (a) Use lm()

lm.fit <- lm(mpg ~ acceleration, data=Auto)
print(summary(lm.fit))
#mpgVector <- unlist(mpgVector, recursive = TRUE, use.names = TRUE)
#accelerateVector <- unlist(accelerateVector, recursive = TRUE, use.names = TRUE)
#accMpg <- data.frame(mpgVector, accelerateVector)
#lm.fit <- lm(mpgVector ~ accelerateVector, accMpg)
#lm.fit
# From the output, B1 = 1.198, B0 = 4.833. As a result the least squares equation
# is mpg = 4.833 + 1.198 * acceleration
# 1) yes  p_value 2e-16 < 0.05 so ew can reject hypotheiss that the coefficient is 0
#2 )
#3) positive , 1,19
#4)
mpg_pred = predict(lm.fit,newdata=data.frame(acceleration=c(14.50)), interval="confidence", level=0.97)
print("MPG prediction: ")
print(mpg_pred)

plot(Auto$acceleration, Auto$mpg)
abline(lm.fit)

acc <- data.frame(acceleration = seq(10,25,length = 100))
conf <- predict (lm.fit, newdata = acc , interval="confidence", level=0.97)
pred <- predict (lm.fit, newdata = acc , interval="prediction", level=0.97)

lines(acc$acceleration, pred[,"upr"], col="blue", type="b", pch="*")
lines(acc$acceleration, pred[,"lwr"], col="blue", type="b", pch="*")
lines(acc$acceleration, conf[,"upr"], col="red", type="b", pch="+")
lines(acc$acceleration, conf[,"lwr"], col="red", type="b", pch="+")