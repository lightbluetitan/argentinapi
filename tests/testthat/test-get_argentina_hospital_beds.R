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

# get_argentina_hospital_beds


library(testthat)

test_that("get_argentina_hospital_beds() returns a tibble with correct structure", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  # Basic checks
  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_equal(nrow(result), 13)
})

test_that("get_argentina_hospital_beds() returns correct column types", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_argentina_hospital_beds() returns correct indicator and country", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  expect_true(all(result$indicator == "Hospital beds (per 1,000 people)"))
  expect_true(all(result$country == "Argentina"))
})

test_that("get_argentina_hospital_beds() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_argentina_hospital_beds() returns years in descending order", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_argentina_hospital_beds() handles values correctly", {
  skip_on_cran()
  result <- get_argentina_hospital_beds()

  # value column may contain NA (as per World Bank API), so we do not forbid NA
  expect_true(is.numeric(result$value))
  # If non-NA, values should be positive
  expect_true(all(result$value[!is.na(result$value)] >= 0))
})
