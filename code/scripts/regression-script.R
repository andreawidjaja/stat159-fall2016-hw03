#Read in advertising data set
advertising <- read.csv('../../data/Advertising.csv')

#------------------------
#Multiple Regression
#------------------------

#Regression Object
regression_object <- lm(Sales~TV+Radio+Newspaper, data=advertising)
#Regression Object Summary
regression_summary <- summary(regression_object)

#------------------------
#Individual Simple Regression
#------------------------
#TV Regression
TV_regression <- lm(Sales ~ TV, data=advertising)
#Radio Regression
Radio_regression <- lm(Sales ~ Radio, data=advertising)
#Newspaper Regression
Newspaper_regression <- lm(Sales ~ Newspaper, data=advertising)


#----------------------------------
#Objects Saved in regression.RData
#----------------------------------

save(TV_regression, Radio_regression, Newspaper_regression, regression_object, regression_summary, file = "../../data/regression.RData")


#------------------------------
#Diagnostocs Plots
#------------------------------

#Residual Plot
png('../../images/residual-plot.png')
plot(regression_object, which = 1)
dev.off()

#Scale Location Plot
png('../../images/scale-location-plot.png')
plot(regression_object, which = 3)
dev.off()

#Normal QQ Plot
png('../../images/normal-qq-plot.png')
plot(regression_object, which = 2)
dev.off()


#-------------------------------------------
#Individual Simple Regression Scatterplots
#-------------------------------------------
#TV Sales Scatterplot
png('../../images/scatterplot-tv-sales.png')
plot(advertising$TV, advertising$Sales, main="TV Sales Scatterplot", col="#e52b50", xlab = "TV", ylab = "Sales")
abline(TV_regression, col="#318ce7", lwd = 2)
dev.off()

#Radio Sales Scatterplot
png('../../images/scatterplot-radio-sales.png')
plot(advertising$Radio, advertising$Sales, main = "Radio Sales Scatterplot", col="#e52b50", xlab = "Radio", ylab = "Sales")
abline(Radio_regression, col = "#318ce7", lwd = 2)
dev.off()

#Newspaper Sales Scatterplot
png('../../images/scatterplot-newspaper-sales.png') 
plot(advertising$Newspaper, advertising$Sales, main = "Newspaper Sales Scatterplot", col="#e52b50", xlab = "Newspaper", ylab = "Sales")
abline(Newspaper_regression, col = "#318ce7", lwd = 2)
dev.off()
