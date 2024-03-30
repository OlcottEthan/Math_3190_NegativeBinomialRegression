restaurant_inspections <- read.csv("data-raw/restaurant_inspections.csv", header = TRUE)
usethis::use_data(restaurant_inspections, overwrite = TRUE)
