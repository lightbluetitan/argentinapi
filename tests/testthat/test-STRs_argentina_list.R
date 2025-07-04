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

# STRs_argentina_list

library(testthat)

# Test 1: Confirm the object is a base R list
test_that("STRs_argentina_list is a base R list", {
  expect_true(is.list(STRs_argentina_list))
})

# Test 2: Confirm the list has 24 named elements
test_that("STRs_argentina_list has 24 named elements", {
  expect_equal(length(STRs_argentina_list), 24)
  expect_false(is.null(names(STRs_argentina_list)))
  expect_equal(length(names(STRs_argentina_list)), 24)
})

# Test 3: Each element is a named numeric vector of length 93
test_that("Each element in STRs_argentina_list is a named numeric vector of length 93", {
  for (element in STRs_argentina_list) {
    expect_type(element, "double")
    expect_equal(length(element), 93)
    expect_false(is.null(names(element)))
    expect_equal(length(names(element)), 93)
  }
})

# Test 4: Confirm all elements are numeric vectors
test_that("All elements in STRs_argentina_list are numeric vectors", {
  expect_true(all(sapply(STRs_argentina_list, is.numeric)))
})

# Test 5: NA values are valid in STRs_argentina_list
test_that("NA values in STRs_argentina_list are valid", {
  for (element in STRs_argentina_list) {
    expect_true(all(is.na(element) | is.numeric(element)))
  }
})
