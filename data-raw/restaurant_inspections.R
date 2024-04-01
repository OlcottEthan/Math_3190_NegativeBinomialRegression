restaurant_inspections <- as_tibble(read.csv("data-raw/restaurant_inspections.csv", header = TRUE))
usethis::use_data(restaurant_inspections, overwrite = TRUE)
