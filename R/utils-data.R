# utils-data.R

library(testthat2)

test_that("Patient data is correctly filtered", {
  expect_equal(nrow(selected_patient()), 1)
})
