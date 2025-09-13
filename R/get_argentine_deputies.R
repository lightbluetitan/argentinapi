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

#' Get Argentine Deputies (Diputados)
#'
#' This function retrieves a list of Argentine deputies from the public API endpoint
#' `https://api.argentinadatos.com/v1/diputados/diputados`. It includes basic information
#' and the official mandate period of each deputy.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Unique identifier for the deputy.
#'   \item \code{nombre}: First name of the deputy.
#'   \item \code{apellido}: Last name of the deputy.
#'   \item \code{genero}: Gender of the deputy.
#'   \item \code{provincia}: Province represented.
#'   \item \code{inicio}: Start date of the mandate period (Date).
#'   \item \code{fin}: End date of the mandate period (Date).
#' }
#'
#' @details
#' The data is returned in descending order of the start date (\code{inicio}), showing the
#' most recent mandates first.
#'
#' @examples
#' \dontrun{
#' deputies <- get_argentine_deputies()
#' head(deputies)
#'
#' # Filter currently active deputies
#' active <- dplyr::filter(deputies, Sys.Date() <= fin)
#' }
#'
#' @note
#' Requires internet connection. If `inicio` or `fin` dates are malformed, parsing may fail.
#'
#' @seealso
#' \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{arrange}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble arrange desc
#'
#' @export
get_argentine_deputies <- function() {
  url <- "https://api.argentinadatos.com/v1/diputados/diputados"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  res_content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), flatten = TRUE)

  # Validación de campos esperados
  expected_fields <- c("id", "nombre", "apellido", "genero", "provincia", "periodoMandato.inicio", "periodoMandato.fin")
  if (!all(expected_fields %in% names(res_content))) {
    message("Error: Missing expected fields in API response.")
    return(NULL)
  }

  df <- dplyr::as_tibble(res_content)

  # Convertir fechas
  df$inicio <- as.Date(df$`periodoMandato.inicio`)
  df$fin <- as.Date(df$`periodoMandato.fin`)

  # Seleccionar columnas relevantes
  df <- df[, c("id", "nombre", "apellido", "genero", "provincia", "inicio", "fin")]

  # Ordenar por inicio descendente
  df <- dplyr::arrange(df, dplyr::desc(inicio))

  return(df)
}
