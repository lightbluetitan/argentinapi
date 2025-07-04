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

# corn_nitrogen_df


library(testthat)

# Test 1: Confirm the object is a data frame
test_that("corn_nitrogen_df is a data frame", {
  expect_s3_class(corn_nitrogen_df, "data.frame")
})

# Test 2: Confirm it has exactly 9 columns
test_that("corn_nitrogen_df has 9 columns", {
  expect_equal(length(corn_nitrogen_df), 9)
})

# Test 3: Confirm it has exactly 3443 rows
test_that("corn_nitrogen_df has 3443 rows", {
  expect_equal(nrow(corn_nitrogen_df), 3443)
})

# Test 4: Confirm column names are correct
test_that("corn_nitrogen_df has correct column names", {
  expect_named(corn_nitrogen_df, c(
    "year", "lat", "long", "yield", "nitro", "topo", "bv", "rep", "nf"
  ))
})

# Test 5: Confirm column types are as expected
test_that("corn_nitrogen_df columns have correct types", {
  expect_type(corn_nitrogen_df$year, "integer")
  expect_type(corn_nitrogen_df$lat, "double")
  expect_type(corn_nitrogen_df$long, "double")
  expect_type(corn_nitrogen_df$yield, "double")
  expect_type(corn_nitrogen_df$nitro, "double")
  expect_s3_class(corn_nitrogen_df$topo, "factor")
  expect_type(corn_nitrogen_df$bv, "double")
  expect_s3_class(corn_nitrogen_df$rep, "factor")
  expect_s3_class(corn_nitrogen_df$nf, "factor")
})


