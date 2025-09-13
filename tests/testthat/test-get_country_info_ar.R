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

# get_country_info_ar

library(testthat)

test_that("get_country_info_ar() returns a tibble with the correct structure", {
  skip_on_cran()
  skip_if_offline()

  tryCatch({
    result <- get_country_info_ar()

    # Check that the result is not NULL
    expect_false(is.null(result))
    # Check class
    expect_s3_class(result, "tbl_df")
    # Check that the column names are exactly as expected
    expect_named(result, c("name_common", "name_official", "region", "subregion",
                           "capital", "area", "population", "languages"))
    # Check dimensions
    expect_equal(nrow(result), 1)
    expect_equal(ncol(result), 8)

  }, error = function(e) {
    if (grepl("SSL|curl|Connection|timeout|Recv failure", e$message, ignore.case = TRUE)) {
      skip("API not accessible due to network issues")
    } else {
      stop(e)
    }
  })
})

test_that("get_country_info_ar() returns columns with correct types", {
  skip_on_cran()
  skip_if_offline()

  tryCatch({
    result <- get_country_info_ar()

    expect_type(result$name_common, "character")
    expect_type(result$name_official, "character")
    expect_type(result$region, "character")
    expect_type(result$subregion, "character")
    expect_type(result$capital, "character")
    expect_type(result$area, "double")
    expect_type(result$population, "integer")
    expect_type(result$languages, "character")

  }, error = function(e) {
    if (grepl("SSL|curl|Connection|timeout|Recv failure", e$message, ignore.case = TRUE)) {
      skip("API not accessible due to network issues")
    } else {
      stop(e)
    }
  })
})

test_that("get_country_info_ar() returns expected values for Argentina", {
  skip_on_cran()
  skip_if_offline()

  tryCatch({
    result <- get_country_info_ar()

    expect_equal(result$name_common, "Argentina")
    expect_equal(result$name_official, "Argentine Republic")
    expect_equal(result$region, "Americas")
    expect_equal(result$subregion, "South America")
    expect_equal(result$capital, "Buenos Aires")
    expect_true(result$area > 2000000)       # Argentina's area is ~2.78M km²
    expect_true(result$population > 40000000) # Population > 40M
    expect_true(grepl("Spanish", result$languages))

  }, error = function(e) {
    if (grepl("SSL|curl|Connection|timeout|Recv failure", e$message, ignore.case = TRUE)) {
      skip("API not accessible due to network issues")
    } else {
      stop(e)
    }
  })
})
