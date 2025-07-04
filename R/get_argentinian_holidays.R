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

#' Get Official Holidays in Argentina for a Given Year
#'
#' This function retrieves the list of official holidays in Argentina for a specified year.
#' The data is obtained from the public API at \url{https://api.argentinadatos.com/v1/feriados/{año}}.
#' If no year is provided, it returns holidays for the current year.
#'
#' @param year An integer representing the year (between 2016 and 2025). Defaults to the current year.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{fecha}: Date of the holiday (character in YYYY-MM-DD format).
#'   \item \code{tipo}: Type of holiday (e.g., "inamovible", "trasladable").
#'   \item \code{nombre}: Name or reason of the holiday.
#' }
#'
#' @details
#' The function sends a GET request to the ArgentinaDatos API and converts the JSON response into a structured
#' data frame. It validates the input year and falls back to the current year if none is specified.
#' If the API does not return a 200 status code, the function will return \code{NULL} and emit a message.
#'
#' @examples
#' \dontrun{
#' # Get holidays for the year 2025
#' feriados_2025 <- get_argentinian_holidays(2025)
#' print(feriados_2025)
#'
#' # Get holidays for the current year
#' feriados_actual <- get_argentinian_holidays()
#' View(feriados_actual)
#' }
#'
#' @note
#' Requires an active internet connection. If the API is unavailable or its structure changes,
#' the function may need updates.
#'
#' @seealso
#' \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom lubridate year
#'
#' @export
get_argentinian_holidays <- function(year = NULL) {
  if (is.null(year)) {
    year <- lubridate::year(Sys.Date())
  }

  if (!is.numeric(year) || year < 2016 || year > 2025) {
    stop("Year must be an integer between 2016 and 2025.")
  }

  url <- paste0("https://api.argentinadatos.com/v1/feriados/", year)

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  res_content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), flatten = TRUE)

  df <- dplyr::as_tibble(res_content)

  return(df)
}
