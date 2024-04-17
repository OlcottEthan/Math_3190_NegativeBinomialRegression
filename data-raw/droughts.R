droughts <- as_tibble(read.csv("data-raw/droughts.csv", header = TRUE)) |>
  mutate(length = as.integer(length),
         year = as.character(year))
usethis::use_data(droughts, overwrite = TRUE)

str(droughts)
library(tidyverse)
