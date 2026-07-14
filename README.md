# africa-inflation-analysis

# Africa Inflation Analysis

This is a personal project focused on data analysis, practicing how to pull, clean, and interpret real-world data using R. The goal is to identify which African countries currently face the most severe inflationary pressure, how volatile or stable each country's inflation has been over the past decade, and to model how these trends might continue if left unaddressed.

## Analytical Question
How has inflation across major African economies changed from 2015-2025, and which countries currently face the most severe cost-of-living pressure? This analysis covers eight countries: Nigeria, Ghana, Kenya, South Africa, Ethiopia, Egypt, Zimbabwe, and Senegal.

## Data Source
Data is pulled live from the [World Bank API](https://api.worldbank.org/v2/country/{COUNTRY_CODE}/indicator/FP.CPI.TOTL.ZG?format=json&per_page=100), using the `FP.CPI.TOTL.ZG` indicator (inflation, consumer prices, annual %). Each country is queried by its ISO3 code (e.g. `NGA` for Nigeria).

## Tools
R, dplyr, ggplot2, httr, jsonlite, knitr

## Project Structure
- `scripts/01_fetch_data.R` — pulls raw inflation data from the World Bank API for all 8 countries
- `scripts/02_clean_data.R` — cleans and filters the raw data to 2015-2025
- `scripts/03_eda.R` — exploratory visualizations (trend lines, bar chart, boxplot)
- `scripts/04_model.R` — fits a linear regression model per country and projects inflation to 2028
- `africa_inflation_report.Rmd` — full written report combining code, charts, and findings

## Key Findings
- Nigeria shows the most significant current inflationary pressure among the countries observed, with a statistically reliable upward trend (R² = 0.62)
- Senegal has maintained the lowest and most stable inflation over the period
- Linear regression is not a reliable prediction method for countries with highly volatile inflation (e.g. Zimbabwe) — the model's 2028 projection for Zimbabwe should be read as a limitation of the method

## How to Run
Run the scripts in order: `01_fetch_data.R` → `02_clean_data.R` → `03_eda.R` → `04_model.R`. Then knit `africa_inflation_report.Rmd` to generate the full report.