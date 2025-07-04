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

# get_presidential_events


library(testthat)

test_that("get_presidential_events() returns a valid tibble with correct structure", {
  result <- get_presidential_events()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that it is a tibble
  expect_s3_class(result, "tbl_df")

  # Check that it has at least one row
  expect_gt(nrow(result), 0)

  # Check for expected columns
  expected_columns <- c("fecha", "tipo", "evento")
  expect_true(all(expected_columns %in% names(result)))

  # Check column types
  expect_type(result$fecha, "character")
  expect_type(result$tipo, "character")
  expect_type(result$evento, "character")

  # Check date format for 'fecha'
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$fecha)))
})
