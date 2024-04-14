## code to prepare `ship_accidents` dataset goes here

ship_accidents <- as_tibble(read.csv("data-raw/ship_accidents.csv", header = TRUE))
usethis::use_data(ship_accidents, overwrite = TRUE)
