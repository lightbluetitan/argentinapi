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

# get_argentina_population


library(testthat)

test_that("get_argentina_population() returns a tibble with correct structure", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_false(is.null(result))
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))
  expect_equal(ncol(result), 5)
  expect_equal(nrow(result), 13)
})

test_that("get_argentina_population() returns correct column types", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "integer")
  expect_type(result$value_label, "character")
})

test_that("get_argentina_population() returns correct indicator and country", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_true(all(result$indicator == "Population, total"))
  expect_true(all(result$country == "Argentina"))
})

test_that("get_argentina_population() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_argentina_population() returns years in descending order", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_argentina_population() handles values correctly", {
  skip_on_cran()
  result <- get_argentina_population()

  expect_false(any(is.na(result$value)))
  expect_true(all(result$value > 0))
})

test_that("get_argentina_population() value_label matches value column", {
  skip_on_cran()
  result <- get_argentina_population()

  numeric_label <- as.numeric(gsub(",", "", result$value_label))
  expect_equal(numeric_label, result$value)
})
