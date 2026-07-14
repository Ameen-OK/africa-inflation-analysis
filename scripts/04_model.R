library(dplyr)
all_inflation_recent <- read.csv("data/inflation_africa_2015_2025.csv")

nigerian_data <- filter(all_inflation_recent, countryiso3code == "NGA")
model <- lm(value ~ date, data = nigerian_data)

summary(model)
future_years <- data.frame(date=c(2026, 2027, 2028))
predict(model, newdata = future_years)

get_trend <- function(code){
  country_data <- filter(all_inflation_recent, countryiso3code == code)
  model <- lm(value ~ date, data = country_data)
  
  slope <- coef(model)[["date"]]
  r_squared <- summary(model)$r.squared
  prediction_2028 <- predict(model, newdata = data.frame(date = 2028))
  
  data.frame(
    country = code,
    slope = slope,
    r_squared = r_squared,
    predicted_2028 =prediction_2028
  )
}

country_codes <- c("NGA", "GHA", "KEN", "ZAF", "EGY", "ETH", "ZWE", "SEN")
trend_results <- lapply(country_codes, get_trend)
trend_results <- bind_rows(trend_results)
rownames(trend_results) <- NULL
trend_results

write.csv(trend_results, "data/inflation_trend_predictions.csv", row.names = FALSE)