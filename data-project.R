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

# Range of mpg
mpgVector <- Auto['mpg']
rangeOfMpg <- range(mpgVector)

# Range of Cylinders
cylindersVector <- Auto['cylinder']
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
mpgMedian <- median(mpgVector)

# Median : Cylinders
cylindersMedian <- median(cylindersVector)

# Median : Displacement
displacementMedian <- median(displacementVector)

# Median : Horsepower
horsepowerMedian <- median(horsepowerVector)

# Median : Weight
weightMedian <- median(weightVector)

# Median : Acceleration
accelerateMedian <- median(accelerateVector)

# Median : Year
yearMedian <- median(yearVector)

# Calculating the variance
# To calculate variance, subtract the mean from each observation

# Variance : Mpg (unbiased)
mpgVariance <- var(mpgVariance)

# Variance : Cylinders (unbiased)
cylindersVariance <- var(cylindersVariance)

# Variance : Displacement (unbiased)
displacementVariance <- var(displacementVariance)

# Variance : Horsepower