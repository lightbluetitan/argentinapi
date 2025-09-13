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

# utils.R


utils::globalVariables(c(


  # Variables of the get_argentine_deputies function

  "id","nombre","apellido","genero","provincia","inicio","fin",

  # Variables of the get_argentine_senators function

  "id","nombre","provincia","partido","inicio","fin",

  # Variables of the get_argentinian_holidays function

  "fecha","tipo","nombre",

  # Variables of the get_country_info_ar function
  "name_common", "name_official", "region", "subregion", "capital", "area", "population", "languages",

  # Variables of the get_presidential_events function
  "fecha","tipo","evento",

  # Variables of the get_usd_exchange_rates function
  "casa","compra","venta","fecha",

  # Variables of the get_argentina_child_mortality function
  "indicator","country","year","value",

  # Variables of the get_argentina_energy_use function
  "indicator","country","year","value",

  # Variables of the get_argentina_gdp function
  "indicator","country","year","value","value_label",

  # Variables of the get_argentina_hospital_beds function
  "indicator","country","year","value",

  # Variables of the get_argentina_life_expectancy function
  "indicator","country","year","value",

  # Variables of the get_argentina_population function
  "indicator","country","year","value","value_label",

  # Variables of the get_argentina_unemployment function
  "indicator","country","year","value"



))

utils::globalVariables(c("data"))
