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

# get_country_info

library(testthat)


test_that("get_country_info returns expected columns for a valid country", {
  skip_on_cran()
  result <- get_country_info("Argentina")

  expect_s3_class(result, "data.frame")
  expect_false(is.null(result))

  expected_cols <- c(
    "name_common", "name_official", "capital", "region",
    "subregion", "population", "area", "languages"
  )

  expect_true(all(expected_cols %in% names(result)))
  expect_equal(ncol(result), length(expected_cols))
})

test_that("get_country_info handles invalid country name gracefully", {
  skip_on_cran()
  result <- get_country_info("ThisCountryDoesNotExistXYZ123")
  expect_null(result)
})

test_that("get_country_info handles missing argument", {
  expect_error(get_country_info(), "Please provide a valid country name")
})

test_that("get_country_info handles non-character input", {
  expect_error(get_country_info(123), "Please provide a valid country name")
})

test_that("get_country_info returns correct data types", {
  skip_on_cran()
  result <- get_country_info("Argentina")

  expect_type(result$name_common,   "character")
  expect_type(result$name_official, "character")
  expect_type(result$capital,       "character")
  expect_type(result$region,        "character")
  expect_type(result$subregion,     "character")
  expect_type(result$population,    "integer")
  expect_type(result$area,          "double")
  expect_type(result$languages,     "character")
})
