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

#' Get Presidential Events in Argentina
#'
#' This function retrieves the list of presidential events in Argentina from the API
#' `https://api.argentinadatos.com/v1/eventos/presidenciales`. It returns a structured data frame
#' with the event date, type, and description.
#'
#' @return A data frame (tibble) with the following columns:
#' \itemize{
#'   \item \code{fecha}: Date of the event (character, format YYYY-MM-DD).
#'   \item \code{tipo}: Type of event (e.g., speech, announcement).
#'   \item \code{evento}: Description or name of the event.
#' }
#'
#' @details
#' This function sends a GET request to the ArgentinaDatos API and processes the JSON response into
#' a structured data frame. The events are not filtered by year and include all available historical data.
#' If the API does not return a 200 status code, a message is displayed and \code{NULL} is returned.
#'
#' @examples
#' \dontrun{
#' # Retrieve presidential events
#' events <- get_presidential_events()
#' print(events)
#'
#' # View only events after 2020
#' events %>%
#'   dplyr::filter(fecha >= "2020-01-01")
#' }
#'
#' @note
#' Requires internet connection. If the API becomes unavailable or changes, the function may need updates.
#'
#' @seealso
#' \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_presidential_events <- function() {
  url <- "https://api.argentinadatos.com/v1/eventos/presidenciales"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: Received status code", res$status_code))
    return(NULL)
  }

  res_content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), flatten = TRUE)

  df <- dplyr::as_tibble(res_content)

  return(df)
}
