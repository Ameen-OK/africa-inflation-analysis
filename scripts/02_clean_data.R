library(dplyr)
all_inflation <- read.csv("data/africa_inflation_raw.csv")

all_inflation
str(all_inflation)

all_inflation_recent <- filter(all_inflation, date >=2015)
all_inflation_recent
write.csv(all_inflation_recent, "data/2015_2025_africa_inflation.csv", row.names = FALSE)