source("functions/regression-functions.R")

context("Test regression functions works")

# Multiple Regression
reg <- lm(mpg ~ disp + hp, data = mtcars)

# Summary of Multiple Regression
regsum <- summary(reg)

test_that("residual_sum_squares function works", {
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  expect_equal(residual_sum_squares(reg), 283.493435)
  expect_length(residual_sum_squares(reg), 1)
})

test_that("total_sum_squares function is working", {
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_equal(total_sum_squares(reg), 1126.0472)
  expect_length(total_sum_squares(reg), 1)
})

test_that("r_squared function is working", {
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_equal(r_squared(reg), 0.748240182)
  expect_length(r_squared(reg), 1)
})


test_that("f_statistic function is working", {
  expect_equal(f_statistic(reg), regsum$fstatistic[1])
  expect_length(f_statistic(reg), 1)
})

test_that("residual_std_error function is working", {
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_equal(residual_std_error(reg), 3.1266013)
  expect_length(residual_std_error(reg), 1)
})

#---------------------------------
#make sure that wd is the parent directory
#RScript -e "library(testthat); test_file('code/test-that.R'
#---------------------------------
