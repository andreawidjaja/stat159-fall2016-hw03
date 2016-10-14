#Read in advertising data set
advertising <- read.csv('../../data/Advertising.csv')
advertising ['X'] <- NULL


#Advertising Summary Statistics
summary <- summary(advertising)
#Advertising Correlation Matrix
correlation_matrix <- cor(advertising)


#Generate eda-output.txt
sink("../../data/eda-output.txt")

cat("Summary Statistics of Advertising\n")
print(summary)

cat("\n\n")

cat("Summary Correlation Matrix\n")
print(correlation_matrix)
sink()


#Save the matrix correlation to binary format
save(correlation_matrix, file='../../data/correlation-matrix.RData')


#-----------------------------------------
#Exploratory Charts
#-----------------------------------------


#Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
pairs(~TV+Radio+Newspaper+Sales, data = advertising, main = 'Scatterplot Matrix')
dev.off()


#Histogram for TV in png
png("../../images/histogram-tv.png")
hist(advertising$TV, main="Histogram of TV", xlab="TV")
dev.off

#Histogram for Newspaper in png
png("../../images/histogram-newspaper.png")
hist(advertising$Newspaper, main="Histogram of Newspaper", xlab="Newspaper")
dev.off

#Histogram for Radio in png
png("../../images/histogram-radio.png")
hist(advertising$Radio, main="Histogram of Radio", xlab="Radio")
dev.off

#Histogram for Sales in png
png("../../images/histogram-sales.png")
hist(advertising$Sales, main="Histogram of Sales", xlab="Sales")
dev.off()
