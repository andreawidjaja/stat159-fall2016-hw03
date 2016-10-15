#------------------------
#Functions
#------------------------

# calculates Residual Sum of Squares (RSS):
# input: reg object
# output: RSS value

residual_sum_squares <- function(reg) {
	sum((reg$residuals)^2)
}

# calculates Total Sum of Squares (TSS):
# input: reg object
# output: TSS value

total_sum_squares <- function(reg) {
	rss <- residual_sum_squares(reg)
	r2 <- (summary(reg))$r.squared
	rss/(1-r2)
}

# calculates R-Squared:
# input: reg object
# output: R-squared value

r_squared <- function(reg) {
	(summary(reg))$r.squared
}

# calculates F-Statistic:
# input: reg object
# output: F-Statistic value
f_statistic <- function(reg) {
	(summary(reg))$fstatistic[1]
}

# calculates Residual Standard Error (RSE):
# input: reg object
# output: RSE
residual_std_error <- function(reg) {
	(summary(reg))$sigma
}
