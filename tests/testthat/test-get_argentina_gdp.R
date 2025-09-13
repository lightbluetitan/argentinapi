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

# get_argentina_gdp

library(testthat)

test_that("get_argentina_gdp() returns a tibble with correct structure", {
  skip_on_cran()
  skip_if_offline()

  result <- get_argentina_gdp()

  # Debe ser tibble/data.frame
  expect_s3_class(result, "tbl_df")
  expect_s3_class(result, "data.frame")

  # Debe tener las 5 columnas correctas
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))

  # Debe tener 13 filas (2010-2022 inclusive)
  expect_equal(nrow(result), 13)

  # Tipos de datos esperados
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
  expect_type(result$value_label, "character")
})

test_that("get_argentina_gdp() values are consistent", {
  skip_on_cran()
  skip_if_offline()

  result <- get_argentina_gdp()

  # Indicator y country deben ser constantes
  expect_true(all(result$indicator == "GDP (current US$)"))
  expect_true(all(result$country == "Argentina"))

  # Los años deben ir de 2010 a 2022
  expect_equal(sort(result$year), 2010:2022)

  # No debe haber NAs en columnas clave
  expect_false(any(is.na(result$year)))
  expect_false(any(is.na(result$value)))

  # value_label debe ser carácter y contener comas
  expect_true(all(grepl(",", result$value_label)))
})
