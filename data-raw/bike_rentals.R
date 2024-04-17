bike_rentals <- as_tibble(read.csv("data-raw/bike_rentals.csv", header = TRUE)) |>
  mutate(dteday = as.Date(dteday),
         yr = as.numeric(yr) + 2011)
usethis::use_data(bike_rentals, overwrite = TRUE)
