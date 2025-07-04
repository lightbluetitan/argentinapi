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

# repression_victims_tbl_df

library(testthat)

# Test 1: Confirm the object is a tibble
test_that("repression_victims_tbl_df is a tibble", {
  expect_s3_class(repression_victims_tbl_df, "tbl_df")
  expect_s3_class(repression_victims_tbl_df, "tbl")
  expect_s3_class(repression_victims_tbl_df, "data.frame")
})

# Test 2: Confirm it has exactly 20 columns
test_that("repression_victims_tbl_df has 20 columns", {
  expect_equal(length(repression_victims_tbl_df), 20)
})

# Test 3: Confirm it has exactly 8,753 rows
test_that("repression_victims_tbl_df has 8753 rows", {
  expect_equal(nrow(repression_victims_tbl_df), 8753)
})

# Test 4: Confirm column names are correct
test_that("repression_victims_tbl_df has correct column names", {
  expect_named(repression_victims_tbl_df, c(
    "id_unico_ruvte",
    "anio_denuncia",
    "tipificacion_ruvte",
    "apellido_paterno_nombres",
    "apellido_materno",
    "apellido_casada",
    "edad_al_momento_del_hecho",
    "documentos",
    "anio_nacimiento",
    "provincia_nacimiento",
    "pais_nacimiento",
    "nacionalidad",
    "embarazo",
    "fecha_detencion_secuestro",
    "lugar_detencion_secuestro",
    "fecha_asesinato_o_hallazgo_de_restos",
    "lugar_asesinato_o_hallazgo_de_restos",
    "fotografia",
    "provincia_nacimiento_indec_id",
    "pais_nacimiento_indec_id"
  ))
})

# Test 5: Confirm column types
test_that("repression_victims_tbl_df columns have correct types", {
  expect_type(repression_victims_tbl_df$id_unico_ruvte, "character")
  expect_type(repression_victims_tbl_df$anio_denuncia, "double")
  expect_type(repression_victims_tbl_df$tipificacion_ruvte, "character")
  expect_type(repression_victims_tbl_df$apellido_paterno_nombres, "character")
  expect_type(repression_victims_tbl_df$apellido_materno, "character")
  expect_type(repression_victims_tbl_df$apellido_casada, "character")
  expect_type(repression_victims_tbl_df$edad_al_momento_del_hecho, "character")
  expect_type(repression_victims_tbl_df$documentos, "character")
  expect_type(repression_victims_tbl_df$anio_nacimiento, "character")
  expect_type(repression_victims_tbl_df$provincia_nacimiento, "character")
  expect_type(repression_victims_tbl_df$pais_nacimiento, "character")
  expect_type(repression_victims_tbl_df$nacionalidad, "character")
  expect_type(repression_victims_tbl_df$embarazo, "character")
  expect_type(repression_victims_tbl_df$fecha_detencion_secuestro, "character")
  expect_type(repression_victims_tbl_df$lugar_detencion_secuestro, "character")
  expect_type(repression_victims_tbl_df$fecha_asesinato_o_hallazgo_de_restos, "character")
  expect_type(repression_victims_tbl_df$lugar_asesinato_o_hallazgo_de_restos, "character")
  expect_type(repression_victims_tbl_df$fotografia, "character")
  expect_type(repression_victims_tbl_df$provincia_nacimiento_indec_id, "character")
  expect_type(repression_victims_tbl_df$pais_nacimiento_indec_id, "character")
})
