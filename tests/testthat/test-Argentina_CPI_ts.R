# ArgentinAPI - Access Argentine Economic, Social, and Geopolitical Data via RESTful APIs and Curated Datasets
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Argentina_CPI_ts

library(testthat)

# Test 1: Confirm the object is a 'ts' time series
test_that("Argentina_CPI_ts is a ts object", {
  expect_s3_class(Argentina_CPI_ts, "ts")
  expect_true(is.ts(Argentina_CPI_ts))
})

# Test 2: Confirm the length is exactly 80
test_that("Argentina_CPI_ts has correct length", {
  expect_equal(length(Argentina_CPI_ts), 80)
})

# Test 3: Confirm the time range and frequency
test_that("Argentina_CPI_ts has correct time range and frequency", {
  expect_equal(start(Argentina_CPI_ts), c(1970, 1))
  expect_equal(end(Argentina_CPI_ts), c(1989, 4))  # corrected to match actual end
  expect_equal(frequency(Argentina_CPI_ts), 4)
})

# Test 4: Confirm all values are numeric or NA
test_that("Argentina_CPI_ts contains only numeric or NA values", {
  expect_true(all(is.na(Argentina_CPI_ts) | is.numeric(Argentina_CPI_ts)))
})

# Test 5: Confirm no character values are present
test_that("Argentina_CPI_ts contains no character values", {
  expect_false(any(is.character(Argentina_CPI_ts)))
})

# Test 6: Confirm all values are non-negative (CPI should not be negative)
test_that("Argentina_CPI_ts has only non-negative values", {
  expect_true(all(is.na(Argentina_CPI_ts) | Argentina_CPI_ts >= 0))
})

# Test 7: Confirm there are no NaN or infinite values
test_that("Argentina_CPI_ts contains no NaN or Inf", {
  expect_false(any(is.nan(Argentina_CPI_ts)))
  expect_false(any(is.infinite(Argentina_CPI_ts)))
})

# Test 8: Confirm the structure matches quarterly time series expectations
test_that("Argentina_CPI_ts follows quarterly structure", {
  expect_equal(frequency(Argentina_CPI_ts), 4)
  expect_equal(dim(matrix(Argentina_CPI_ts, ncol = 4, byrow = TRUE))[2], 4)
})
