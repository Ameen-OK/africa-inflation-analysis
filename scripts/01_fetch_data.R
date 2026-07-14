library(httr)
library(jsonlite)
library(dplyr)
library(httr)
library(jsonlite)

#response <- GET("https://api.worldbank.org/v2/country/NGA/indicator/FP.CPI.TOTL.ZG?format=json&per_page=100")

#response

#data <- content(response, as= "text")
#parsed <- fromJSON(data)

#str(parsed)
#inflation_ng <- parsed[[2]]
#head(inflation_ng)


#inflation_ng_clean <- select(inflation_ng, date, value)
#inflation_ng_clean

get_inflation <- function(country_code){
  link = "https://api.worldbank.org/v2/country/NGA/indicator/FP.CPI.TOTL.ZG?format=json&per_page=100"
  link <- gsub("NGA", country_code, link, ignore.case = TRUE)
  response <- GET(link)
  data <- content(response, as= "text")
  parsed <- fromJSON(data)
  inflation <- parsed[[2]]
  inflation_clean <- select(inflation, date, value, countryiso3code)
  return(inflation_clean)
}

inflation_gh <- get_inflation("GHA")
inflation_gh

country_codes <- c("NGA", "GHA", "KEN", "ZAF", "EGY", "ETH", "ZWE", "SEN")
all_inflation <- lapply(country_codes, get_inflation)
all_inflation <- bind_rows(all_inflation)
all_inflation <- all_inflation%>%
  mutate(date = as.numeric(date))

table(all_inflation$countryiso3code)
typeof(all_inflation$date)

all_inflation_recent <- filter(all_inflation, date >=2015)
table(all_inflation_recent$countryiso3code)
#all_inflation_recent
str(all_inflation)

write.csv(all_inflation_recent, "data/inflation_africa_2015_2025.csv", row.names = FALSE)

write.csv(all_inflation, "data/inflation_africa_full_history.csv", row.names = FALSE)