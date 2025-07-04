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

library(testthat)

test_that("get_usd_exchange_rates() returns a valid tibble with correct structure", {
  result <- get_usd_exchange_rates()

  # Check that result is not NULL
  expect_false(is.null(result))

  # Check it's a tibble
  expect_s3_class(result, "tbl_df")

  # Check it has at least one row
  expect_gt(nrow(result), 0)

  # Check expected columns are present
  expected_columns <- c("casa", "compra", "venta", "fecha")
  expect_true(all(expected_columns %in% names(result)))

  # Check column types
  expect_type(result$casa, "character")
  expect_type(result$compra, "double")
  expect_type(result$venta, "double")
  expect_s3_class(result$fecha, "Date")

  # Check 'fecha' is in descending order
  expect_true(all(diff(as.numeric(result$fecha)) <= 0))

  # Check that compra and venta are numeric or NA (not compared)
  expect_true(all(is.na(result$compra) | is.numeric(result$compra)))
  expect_true(all(is.na(result$venta) | is.numeric(result$venta)))

  # NOTE: Do not assume compra <= venta — that is API logic, not integrity
})
