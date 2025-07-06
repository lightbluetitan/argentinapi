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




#' Monthly Import Taxes of Argentina
#'
#' This dataset, Argentina_taxes_df, is a data frame containing monthly import tax revenue
#' in Argentina for the period from January to October 1992.
#'
#' The dataset name has been kept as 'Argentina_taxes_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name Argentina_taxes_df
#' @format A data frame with 10 observations and 1 variable:
#' \describe{
#'   \item{taxes}{Numeric vector indicating monthly import tax revenue}
#' }
#' @source Data taken from the robustarima package version 0.2.7
#' @usage data(Argentina_taxes_df)
#' @export
load("data/Argentina_taxes_df.rda")
NULL



#' Pollination Web from Argentina
#'
#' This dataset, pollination_matrix, is a matrix representing a pollination web collected in Argentina.
#' It was originally published by Vázquez and Simberloff (2003) and includes 9 plant species (rows)
#' and 27 pollinator species (columns), with integer values indicating the number of observed interactions
#' between each pair.
#'
#' The dataset name has been kept as 'pollination_matrix' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'matrix' indicates that the dataset is a matrix object. The original content has not been modified
#' in any way.
#'
#' @name pollination_matrix
#' @format A matrix with 9 rows and 27 columns:
#' \describe{
#'   \item{rows}{Plant species (9 total)}
#'   \item{columns}{Pollinator species (27 total)}
#'   \item{values}{Integer counts of interactions between plant and pollinator species}
#' }
#' @source Data taken from the bipartite package version 2.20
#' @usage data(pollination_matrix)
#' @export
load("data/pollination_matrix.rda")
NULL




#' STRs Allelic Frequencies from Argentina
#'
#' This dataset, STRs_argentina_list, is a list containing allelic frequencies for 24 Short Tandem Repeat (STR) genetic markers
#' from populations in Argentina. Each list element corresponds to an STR marker, and contains named numeric vectors with
#' allele frequencies. The dataset provides valuable reference data for forensic and population genetics studies.
#'
#' The dataset name has been kept as 'STRs_argentina_list' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'list' indicates that the dataset is a list object. The original content has not been modified
#' in any way.
#'
#' @name STRs_argentina_list
#' @format A list with 24 elements, each corresponding to a genetic STR marker:
#' \describe{
#'   \item{D8S1179, D21S11, D7S820, ... SE33}{Each element is a named numeric vector of allele frequencies for the respective STR marker.}
#' }
#' @source Data taken from the fbnet package version 1.0.3
#' @usage data(STRs_argentina_list)
#' @export
load("data/STRs_argentina_list.rda")
NULL


#' Argentina Corn Yield & Nitrogen Data
#'
#' This dataset, corn_nitrogen_df, is a data frame containing yield monitor data from a corn field in Argentina.
#' It includes information on yield response to varying nitrogen application levels, along with spatial coordinates,
#' topographic classification, and block structure for the experimental design.
#'
#' The dataset name has been kept as 'corn_nitrogen_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name corn_nitrogen_df
#' @format A data frame with 3443 observations and 9 variables:
#' \describe{
#'   \item{year}{Integer indicating the year of observation}
#'   \item{lat}{Numeric vector of latitude coordinates}
#'   \item{long}{Numeric vector of longitude coordinates}
#'   \item{yield}{Numeric vector representing corn yield}
#'   \item{nitro}{Numeric vector representing nitrogen application level}
#'   \item{topo}{Factor with 4 levels indicating topographic classification}
#'   \item{bv}{Numeric vector representing block variance}
#'   \item{rep}{Factor with 3 levels indicating replication blocks}
#'   \item{nf}{Factor with 6 levels indicating nitrogen field treatments}
#' }
#' @source Data taken from the agridat package version 1.24
#' @usage data(corn_nitrogen_df)
#' @export
load("data/corn_nitrogen_df.rda")
NULL


#' Argentina Detention Centers
#'
#' This dataset, detention_centers_tbl_df, is a tibble containing detailed information
#' about clandestine detention centers used during Argentina's last dictatorship.
#' The dataset includes site identifiers, locations, designations, and coordinates.
#'
#' The dataset name has been kept as 'detention_centers_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name detention_centers_tbl_df
#' @format A tibble with 762 observations and 7 variables:
#' \describe{
#'   \item{ID}{Numeric ID of the site}
#'   \item{lugar_emplazamiento_propiedad}{Description of the location and ownership}
#'   \item{denominacion}{Designation or known name of the detention center}
#'   \item{espacio_de_memoria}{Logical indicator of whether the site is a memory space}
#'   \item{ubicacion}{Textual description of the site's geographic location}
#'   \item{lon}{Longitude}
#'   \item{lat}{Latitude}
#' }
#' @source Based on data from the presentes package (version 0.1.0).
#'         Available at: \url{https://www.argentina.gob.ar/sites/default/files/6._anexo_v_listado_de_ccd-investigacion_ruvte-ilid.pdf}
#' @usage data(detention_centers_tbl_df)
#' @export
load("data/detention_centers_tbl_df.rda")
NULL


#' Argentina Repression Victims
#'
#' This dataset, repression_victims_tbl_df, is a tibble listing individuals who were victims of illegal state repression
#' during Argentina’s last dictatorship. It includes information such as names, birthplaces, nationality, dates and locations
#' of detention or disappearance, and whether the individual was pregnant at the time.
#'
#' The dataset name has been kept as 'repression_victims_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name repression_victims_tbl_df
#' @format A tibble with 8,753 observations and 20 variables:
#' \describe{
#'   \item{id_unico_ruvte}{Unique RUVTE identifier}
#'   \item{anio_denuncia}{Year of report}
#'   \item{tipificacion_ruvte}{Legal classification}
#'   \item{apellido_paterno_nombres}{Surname(s) and given name(s)}
#'   \item{apellido_materno}{Maternal surname}
#'   \item{apellido_casada}{Married surname}
#'   \item{edad_al_momento_del_hecho}{Age at time of the event}
#'   \item{documentos}{Document numbers}
#'   \item{anio_nacimiento}{Year of birth}
#'   \item{provincia_nacimiento}{Province of birth}
#'   \item{pais_nacimiento}{Country of birth}
#'   \item{nacionalidad}{Nationality}
#'   \item{embarazo}{Pregnancy status}
#'   \item{fecha_detencion_secuestro}{Date of arrest or abduction}
#'   \item{lugar_detencion_secuestro}{Place of arrest or abduction}
#'   \item{fecha_asesinato_o_hallazgo_de_restos}{Date of murder or discovery of remains}
#'   \item{lugar_asesinato_o_hallazgo_de_restos}{Place of murder or discovery of remains}
#'   \item{fotografia}{Availability of photograph}
#'   \item{provincia_nacimiento_indec_id}{INDEC code for province of birth}
#'   \item{pais_nacimiento_indec_id}{INDEC code for country of birth}
#' }
#' @source Based on data from the presentes package (version 0.1.0).
#' Available at: \url{https://datos.jus.gob.ar/dataset/registro-unificado-de-victimas-del-terrorismo-de-estado-ruvte}
#' @usage data(repression_victims_tbl_df)
#' @export
load("data/repression_victims_tbl_df.rda")
NULL



#' Consumer Price Index in Argentina (1970–1990)
#'
#' This dataset, `Argentina_CPI_ts`, is a quarterly time series of the Consumer Price Index (CPI) in Argentina from 1970 to 1990.
#' The CPI reflects changes in the general price level of goods and services purchased by households over time.
#'
#' The dataset name has been kept as 'Argentina_CPI_ts' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ArgentinAPI package and assists users in identifying its specific characteristics.
#' The suffix 'ts' indicates that the dataset is a time series object of class `ts`.
#' The original content has not been modified in any way.
#'
#' @name Argentina_CPI_ts
#' @format A quarterly time series (`ts`) object from 1970 to 1990 with 80 observations:
#' \describe{
#'   \item{Time span}{1970 Q1 to 1990 Q4}
#'   \item{Values}{Quarterly CPI values (numeric)}
#' }
#' @source Data taken from the AER package version 1.2-14.
#' @usage data(Argentina_CPI_ts)
#' @export
load("data/Argentina_CPI_ts.rda")
NULL













