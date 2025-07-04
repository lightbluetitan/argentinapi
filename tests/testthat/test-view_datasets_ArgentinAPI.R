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

# view_datasets_ArgentinAPI

library(testthat)
library(ArgentinAPI)

test_that("view_datasets_ArgentinAPI works when package is loaded", {
  result <- view_datasets_ArgentinAPI()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets_ArgentinAPI prints correct message", {
  output <- capture_messages(view_datasets_ArgentinAPI())
  expect_match(
    output[1],
    "Datasets available in the 'ArgentinAPI' package:",
    fixed = TRUE
  )
})

test_that("view_datasets_ArgentinAPI returns expected datasets", {
  datasets <- view_datasets_ArgentinAPI()
  expected_datasets <- c(
    "Argentina_taxes_df",
    "pollination_matrix",
    "STRs_argentina_list",
    "corn_nitrogen_df",
    "detention_centers_tbl_df",
    "repression_victims_tbl_df",
    "Argentina_CPI_ts"

  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})
