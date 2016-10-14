#Read data
advertising <- read.csv('../../data/Advertising.csv')

#Produce text file containing summary statistics
sink("../../data/eda-output.txt")
'Summary of TV'
summary(advertising$TV)
'Summary of Radio'
summary(advertising$Radio)
'Summary of Newspaper'
summary(advertising$Newspaper)
'Summary of Sales'
summary(advertising$Sales)
'Summary of Everything'
summary(advertising)
'Correlation Matrix'
cor(advertising)
sink()

#Save the matrix correlation to Rdata file
save(cor(advertising), file='../../data/correlation-matrix.RData')

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
