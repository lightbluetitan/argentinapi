# ArgentinAPI - Access Argentinian Data via APIs and Curated Datasets
# Version 0.2.0
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

# get_argentina_energy_use

library(testthat)

test_that("get_argentina_energy_use() returns a tibble with correct structure", {
  skip_on_cran()
  result <- get_argentina_energy_use()

  # Not NULL
  expect_false(is.null(result))

  # Class
  expect_s3_class(result, "tbl_df")

  # Column names
  expect_named(result, c("indicator", "country", "year", "value"))

  # Dimensions
  expect_equal(ncol(result), 4)
  expect_equal(nrow(result), 13) # 2010–2022
})

test_that("get_argentina_energy_use() returns correct column types", {
  skip_on_cran()
  result <- get_argentina_energy_use()

  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_argentina_energy_use() returns expected values for Argentina", {
  skip_on_cran()
  result <- get_argentina_energy_use()

  # Constant columns
  expect_true(all(result$indicator == "Energy use (kg of oil equivalent per capita)"))
  expect_true(all(result$country == "Argentina"))

  # Years
  expect_equal(sort(unique(result$year)), 2010:2022)

  # No missing values in year or value
  expect_false(any(is.na(result$year)))
  expect_false(any(is.na(result$value)))

  # Values are positive
  expect_true(all(result$value > 0))

  # Years should be sorted in descending order (as per API)
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})
