# ArgentinAPI

The `ArgentinAPI` package provides a comprehensive and unified interface to access open data about **Argentina** from multiple public RESTful APIs, including **ArgentinaDatos API**, **REST Countries API**, and **World Bank API**. Through these sources, users can easily retrieve information on exchange rates, inflation, political figures, national holidays, economic indicators, and general country-level statistics.

In addition to API-access functions, the package includes a collection of curated datasets covering diverse domains such as economic indicators, biodiversity, agriculture, human rights, genetic data, and consumer prices.

## Installation

You can install the `ArgentinAPI` package from CRAN with the following R function:

```R

install.packages("ArgentinAPI")

```


## Usage

After installation, load the package and start exploring and using its functions and datasets.

```R

library(ArgentinAPI)

```

### ArgentinAPI Functions

Below is a list of the main functions included in the `ArgentinAPI` package:

- `get_argentina_holidays()` – Retrieves public holidays in Argentina for a specific year using the ArgentinaDatos API.

- `get_argentine_senators()` -  Returns the current list of Argentine senators from the ArgentinaDatos API.

- `get_argentine_deputies()` – Returns the current list of Argentine deputies from the ArgentinaDatos API.

- `get_country_info_ar()` – Retrieves general country-level information about Argentina from the REST Countries API 

- `get_dollar_exchange_rates()` – Retrieves the most recent exchange rates for different dollar markets (official, blue, MEP, CCL) from the ArgentinaDatos API.

- `get_presidential_events()` – Retrieves a list of official presidential events from the ArgentinaDatos API.

- `get_argentina_child_mortality()`: Get Argentina’s Under-5 Mortality Rate data from the World Bank.

- `get_argentina_energy_use()`: Get Argentina’s Energy Use (kg of oil equivalent per capita) data from the World Bank.

- `get_argentina_gdp()`: Get Argentina’s GDP (current US$) data from the World Bank. 
 
- `get_argentina_hospital_beds()`: Get Argentina’s Hospital Beds (per 1,000 people) data from the World Bank. 

- `get_argentina_life_expectancy()`: Get Argentina’s Life Expectancy at Birth data from the World Bank.

- `get_argentina_population()`: Get Argentina’s Total Population data from the World Bank.

- `get_argentina_unemployment()`: Get Argentina’s Total Unemployment Rate data from the World Bank.

- `view_datasets_ArgentinAPI()` – Lists all curated datasets included in the `ArgentinAPI` package across various thematic areas such as economy, biodiversity, genetics, agriculture, and more.


### Some of the ArgentinAPI Datasets

The naming convention helps you easily understand the structure of each dataset:

- `_df`: A standard data frame.

- `_tbl_df`: A tibble (modern data frame).

- `_ts`: A time series object.

- `_matrix`: A matrix structure.

- `_list`: A list object.

- `corn_nitrogen_df`: Argentina Corn Yield & Nitrogen Data
A data frame with yield monitor data from a corn field in Argentina, including variables such as nitrogen application, yield, topography, and block replicates.

- `STRs_argentina_list`: STRs Allelic Frequencies from Argentina
A list of allelic frequencies for 24 Short Tandem Repeat (STR) genetic markers collected from different populations across Argentina.

## Example Code:

```R

# Load the package
library(ArgentinAPI)

# Selected, essential information about Argentina
get_country_info_ar()

# List of presidential events in Argentina 
get_presidential_events()

# Load a dataset
data("corn_nitrogen_df")

# Shows six rows of the dataset
head(corn_nitrogen_df)

# Display the structure of the dataset
str(corn_nitrogen_df)

# Shows the whole dataset

View(corn_nitrogen_df)


```

