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

#' Get Current and Past Senators of Argentina
#'
#' This function retrieves a list of senators from the Argentine Senate API endpoint:
#' `https://api.argentinadatos.com/v1/senado/senadores`. The result includes name, province,
#' party affiliation, and their legal term of office. The results are sorted by the start
#' of their legal term in descending order (most recent first).
#'
#' @return A data frame (tibble) with the following columns:
#' \itemize{
#'   \item \code{id}: Unique identifier of the senator.
#'   \item \code{nombre}: Full name of the senator.
#'   \item \code{provincia}: Province represented.
#'   \item \code{partido}: Political party.
#'   \item \code{inicio}: Start date of the legal period (Date).
#'   \item \code{fin}: End date of the legal period (Date).
#' }
#'
#' @details
#' The function parses the nested JSON structure returned by the API, extracts the period data,
#' and ensures that `inicio` and `fin` are treated as proper `Date` objects. The data is sorted
#' by `inicio` in descending order to prioritize currently active or recently active senators.
#'
#' @examples
#' \dontrun{
#' senators <- get_argentine_senators()
#' head(senators)
#'
#' # Filter only currently active senators
#' active <- dplyr::filter(senators, Sys.Date() <= fin)
#' }
#'
#' @note
#' Requires internet access. Be cautious with malformed or missing date fields.
#'
#' @seealso
#' \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{arrange}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble arrange desc
#'
#' @export
get_argentine_senators <- function() {
  url <- "https://api.argentinadatos.com/v1/senado/senadores"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  res_content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), flatten = TRUE)

  # Asegurar estructura esperada
  if (!all(c("id", "nombre", "provincia", "partido", "periodoLegal.inicio", "periodoLegal.fin") %in% names(res_content))) {
    message("Error: Missing expected fields in API response.")
    return(NULL)
  }

  df <- dplyr::as_tibble(res_content)

  # Convertir fechas
  df$inicio <- as.Date(df$periodoLegal.inicio)
  df$fin <- as.Date(df$periodoLegal.fin)

  # Seleccionar columnas relevantes
  df <- df[, c("id", "nombre", "provincia", "partido", "inicio", "fin")]

  # Ordenar por inicio descendente
  df <- dplyr::arrange(df, dplyr::desc(inicio))

  return(df)
}
