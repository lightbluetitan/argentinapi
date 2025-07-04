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

# detention_centers_tbl_df

library(testthat)

# Test 1: Confirm the object is a tibble (inherits from spec_tbl_df, tbl_df, tbl, data.frame)
test_that("detention_centers_tbl_df is a tibble", {
  expect_s3_class(detention_centers_tbl_df, "spec_tbl_df")
  expect_s3_class(detention_centers_tbl_df, "tbl_df")
  expect_s3_class(detention_centers_tbl_df, "tbl")
  expect_s3_class(detention_centers_tbl_df, "data.frame")
})

# Test 2: Confirm it has exactly 7 columns
test_that("detention_centers_tbl_df has 7 columns", {
  expect_equal(length(detention_centers_tbl_df), 7)
})

# Test 3: Confirm it has exactly 762 rows
test_that("detention_centers_tbl_df has 762 rows", {
  expect_equal(nrow(detention_centers_tbl_df), 762)
})

# Test 4: Confirm column names are correct
test_that("detention_centers_tbl_df has correct column names", {
  expect_named(detention_centers_tbl_df, c(
    "ID",
    "lugar_emplazamiento_propiedad",
    "denominacion",
    "espacio_de_memoria",
    "ubicacion",
    "lon",
    "lat"
  ))
})

# Test 5: Confirm column types
test_that("detention_centers_tbl_df columns have correct types", {
  expect_type(detention_centers_tbl_df$ID, "double")
  expect_type(detention_centers_tbl_df$lugar_emplazamiento_propiedad, "character")
  expect_type(detention_centers_tbl_df$denominacion, "character")
  expect_type(detention_centers_tbl_df$espacio_de_memoria, "logical")
  expect_type(detention_centers_tbl_df$ubicacion, "character")
  expect_type(detention_centers_tbl_df$lon, "double")
  expect_type(detention_centers_tbl_df$lat, "double")
})
