droughts <- as_tibble(read.csv("data-raw/droughts.csv", header = TRUE))
usethis::use_data(droughts, overwrite = TRUE)

