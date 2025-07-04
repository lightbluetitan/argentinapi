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

# Argentina_taxes_df

library(testthat)

# Test 1: Confirm it is a data frame
test_that("Argentina_taxes_df is a data frame", {
  expect_s3_class(Argentina_taxes_df, "data.frame")
})

# Test 2: Check that it has 1 column
test_that("Argentina_taxes_df has 1 column", {
  expect_equal(length(Argentina_taxes_df), 1)
})

# Test 3: Check that it has 10 rows
test_that("Argentina_taxes_df has 10 rows", {
  expect_equal(nrow(Argentina_taxes_df), 10)
})

# Test 4: Confirm the column is named 'taxes'
test_that("Argentina_taxes_df has correct column name", {
  expect_named(Argentina_taxes_df, "taxes")
})

# Test 5: Confirm the 'taxes' column is numeric or NA
test_that("Argentina_taxes_df$taxes contains only numeric or NA values", {
  expect_true(all(is.numeric(Argentina_taxes_df$taxes) | is.na(Argentina_taxes_df$taxes)))
})
