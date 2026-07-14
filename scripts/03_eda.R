library(ggplot2)
all_inflation_recent = read.csv("data/inflation_africa_2015_2025.csv")
no_zimbabwe_inflation <- filter(all_inflation_recent, countryiso3code != "ZWE")
zimbabwe_only <- filter(all_inflation_recent, countryiso3code == "ZWE")


ggplot(no_zimbabwe_inflation, aes(x=date, y=value, colour = countryiso3code)) + geom_line() + labs(x= "Date", y= "Inflation rate (%)")

ggplot(zimbabwe_only, aes(x=date, y=value) ) + geom_line() +geom_point() + labs(x= "Date", y= "Inflation rate (%)")

latest <- filter(all_inflation_recent, date == 2025)

ggplot(latest, aes(x=reorder(countryiso3code, value), y=value)) + geom_col() + coord_flip() + labs(x = "Country", y= "Inflation rate (%)", title= "2025 inflation rate by country: no zimbabwe data")

ggplot(no_zimbabwe_inflation, aes(x = countryiso3code, y = value)) + geom_boxplot() + labs(x = "Country", y = "Inflation Rate (%)", title = "Inflation Volatility by Country (2015-2025)")