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

# pollination_matrix

library(testthat)

# Test 1: Confirm it is a matrix
test_that("pollination_matrix is a matrix", {
  expect_true(is.matrix(pollination_matrix))
})

# Test 2: Confirm the matrix class includes 'matrix' and 'array'
test_that("pollination_matrix class includes 'matrix' and 'array'", {
  expect_true("matrix" %in% class(pollination_matrix))
  expect_true("array" %in% class(pollination_matrix))
})

# Test 3: Confirm the matrix has 9 rows and 27 columns
test_that("pollination_matrix has correct dimensions", {
  expect_equal(dim(pollination_matrix), c(9, 27))
})

# Test 4: Confirm the matrix has 243 elements
test_that("pollination_matrix has 243 elements", {
  expect_equal(length(pollination_matrix), 243)
})

# Test 5: Confirm all values are integers or NA
test_that("pollination_matrix contains only integer or NA values", {
  expect_true(all(is.na(pollination_matrix) | pollination_matrix == as.integer(pollination_matrix)))
})

# Test 6: Confirm the matrix has row and column names
test_that("pollination_matrix has dimnames", {
  expect_true(!is.null(dimnames(pollination_matrix)))
  expect_equal(length(dimnames(pollination_matrix)), 2)
  expect_equal(length(dimnames(pollination_matrix)[[1]]), 9)
  expect_equal(length(dimnames(pollination_matrix)[[2]]), 27)
})
