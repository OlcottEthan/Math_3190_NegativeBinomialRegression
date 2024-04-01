bike_rentals <- as_tibble(read.csv("data-raw/bike_rentals.csv", header = TRUE))
usethis::use_data(bike_rentals, overwrite = TRUE)
