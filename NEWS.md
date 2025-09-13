# ArgentinAPI 0.2.0

## Breaking Changes

- `get_country_info()` was renamed to `get_country_info_ar()` to avoid naming conflicts with other packages and improve function identification.

The following API was added to the `ArgentinAPI` package:

- **World Bank API** <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>.

The following functions were added to the `ArgentinAPI` package:

- `get_argentina_child_mortality()`: Get Argentina’s Under-5 Mortality Rate data from the World Bank.

- `get_argentina_energy_use()`: Get Argentina’s Energy Use (kg of oil equivalent per capita) data from the World Bank.

- `get_argentina_gdp()`: Get Argentina’s GDP (current US$) data from the World Bank. 
 
- `get_argentina_hospital_beds()`: Get Argentina’s Hospital Beds (per 1,000 people) data from the World Bank. 

- `get_argentina_life_expectancy()`: Get Argentina’s Life Expectancy at Birth data from the World Bank.

- `get_argentina_population()`: Get Argentina’s Total Population data from the World Bank.

- `get_argentina_unemployment()`: Get Argentina’s Total Unemployment Rate data from the World Bank.


---

# ArgentinAPI 0.1.0

## Initial Release

- First release of `ArgentinAPI` package.
- Added `view_datasets_ArgentinAPI()` function to explore available datasets.
- Curated Collection of datasets that cover diverse aspects of Chilean society.
- Initial APIs *ArgentinaDatos API* and *REST Countries API* – Added functions powered by these APIs
