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

#' Get USD Exchange Rates from Argentina's Currency Markets
#'
#' This function retrieves the latest exchange rates of the US dollar (USD) from multiple
#' currency exchange houses in Argentina, using the public API
#' `https://api.argentinadatos.com/v1/cotizaciones/dolares`. The results are sorted in
#' descending order by date (most recent first).
#'
#' @return A data frame (tibble) with the following columns:
#' \itemize{
#'   \item \code{casa}: Name of the exchange house (e.g., Blue, Oficial, Mayorista).
#'   \item \code{compra}: Buying rate (numeric).
#'   \item \code{venta}: Selling rate (numeric).
#'   \item \code{fecha}: Date of the rate (Date format).
#' }
#'
#' @details
#' The function connects to the ArgentinaDatos API to obtain current USD exchange rates. It arranges
#' the results in descending order by date, making recent data easier to access.
#'
#' @examples
#' \dontrun{
#' # Get latest USD exchange rates
#' rates <- get_usd_exchange_rates()
#' head(rates)  # Shows the most recent ones first
#'
#' # Filter for the year 2025
#' rates_2025 <- dplyr::filter(rates, lubridate::year(fecha) == 2025)
#' }
#'
#' @note
#' Requires an internet connection. Results may vary depending on API availability.
#'
#' @seealso
#' \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{arrange}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble arrange mutate
#'
#' @export
get_usd_exchange_rates <- function() {
  url <- "https://api.argentinadatos.com/v1/cotizaciones/dolares"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  res_content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), flatten = TRUE)

  df <- dplyr::as_tibble(res_content)
  df$fecha <- as.Date(df$fecha)
  df <- dplyr::arrange(df, dplyr::desc(fecha))

  return(df)
}
