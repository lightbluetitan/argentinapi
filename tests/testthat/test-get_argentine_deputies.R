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

# get_argentine_deputies


# Load the testing framework and your package
library(testthat)

test_that("get_argentine_deputies() returns a valid tibble with correct structure", {
  result <- get_argentine_deputies()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that the result is a tibble
  expect_s3_class(result, "tbl_df")

  # Check that the tibble has at least one row
  expect_gt(nrow(result), 0)

  # Check that all expected columns are present
  expected_columns <- c("id", "nombre", "apellido", "genero", "provincia", "inicio", "fin")
  expect_true(all(expected_columns %in% names(result)))

  # Check column data types
  expect_type(result$id, "character")
  expect_type(result$nombre, "character")
  expect_type(result$apellido, "character")
  expect_type(result$genero, "character")
  expect_type(result$provincia, "character")
  expect_s3_class(result$inicio, "Date")
  expect_s3_class(result$fin, "Date")

  # Check that the 'inicio' column is sorted in descending order
  expect_true(all(diff(as.numeric(result$inicio)) <= 0))
})
