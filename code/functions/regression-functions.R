#------------------------
#Functions
#------------------------

# Residual Sum of Squares (RSS):
# input: lm() object
# output: RSS value

residual_sum_squares <- function(reg) {
	sum((reg$residuals)^2)
}

# Total Sum of Squares (TSS):
# input: lm() object
# output: TSS value

total_sum_squares <- function(reg) {
	rss <- residual_sum_squares(reg)
	r2 <- (summary(reg))$r.squared
	rss/(1-r2)
}

# R-Squared:
# input: lm() object
# output: R-squared value

r_squared <- function(reg) {
	(summary(reg))$r.squared
}

# F-Statistic:
# input: lm() object
# output: F-Statistic value
f_statistic <- function(reg) {
	(summary(reg))$fstatistic[1]
}

# Residual Standard Error (RSE):
# input: lm() object
# output: RSE
residual_std_error <- function(reg) {
	(summary(reg))$sigma
}
