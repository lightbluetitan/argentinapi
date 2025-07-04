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

# get_argentinian_holidays


library(testthat)

test_that("get_argentinian_holidays() returns a valid tibble with correct structure", {
  result <- get_argentinian_holidays()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that it is a tibble
  expect_s3_class(result, "tbl_df")

  # Check that it has at least one row
  expect_gt(nrow(result), 0)

  # Check that all expected columns are present
  expected_columns <- c("fecha", "tipo", "nombre")
  expect_true(all(expected_columns %in% names(result)))

  # Check column data types
  expect_type(result$fecha, "character")
  expect_type(result$tipo, "character")
  expect_type(result$nombre, "character")

  # Optional: check date format (should be YYYY-MM-DD)
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})

test_that("get_argentinian_holidays() fails with invalid years", {
  expect_error(get_argentinian_holidays(2010), "Year must be an integer between 2016 and 2025")
  expect_error(get_argentinian_holidays(2030), "Year must be an integer between 2016 and 2025")
  expect_error(get_argentinian_holidays("not_a_year"), "Year must be an integer between 2016 and 2025")
})
