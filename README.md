# ArgentinAPI

The `ArgentinAPI` package provides a unified interface to access open data from the **ArgentinaDatos** API and the **REST Countries API**, with a focus on **Argentina**. It allows users to easily retrieve up-to-date information on exchange rates, inflation, political figures, national holidays, and country-level indicators relevant to **Argentina**.

In addition to API-access functions, the package includes a collection of curated datasets related to **Argentina**, covering diverse domains such as economic indicators, biodiversity, agriculture, human rights, genetics, and consumer prices.

`ArgentinAPI` is designed to support research, teaching, and data analysis focused on Argentina by integrating publicly available APIs and high-quality datasets into a single, easy-to-use R package.

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

### ColombiAPI Functions

- get_argentine_deputies() This function retrieves a list of Argentine deputies

- get_argentine_senators() This function retrieves a list of Argentine senators

- get_argentinian_holidays() This function retrieves the list of official holidays in Argentina

- get_country_info() Retrieves selected, essential information about Argentina

- get_presidential_events() This function retrieves the list of presidential events in Argentina

- get_usd_exchange_rates() Latest exchange rates of the US dollar (USD) in Argentina

- view_datasets_ArgentinAPI() List of Datasets in the ArgentinAPI Package

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
get_country_info()

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

