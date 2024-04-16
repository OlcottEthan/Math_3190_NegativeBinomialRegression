bikes_bridges <- as_tibble(read.csv("data-raw/bikes_bridges.csv", header = TRUE)) |>
  mutate(date = as.Date(paste0(Date, "-2017"), format = "%d-%b-%Y"),
         day = Day,
         temp_high = High.Temp...F.,
         temp_low = Low.Temp...F.,
         precipitation = as.numeric(Precipitation),
         Brooklyn_bridge = as.numeric(gsub(",","",Brooklyn.Bridge)),
         Manhattan_bridge = as.numeric(gsub(",","",Manhattan.Bridge)),
         Williamsburg_bridge = as.numeric(gsub(",","",Williamsburg.Bridge)),
         Queensboro_bridge = as.numeric(gsub(",","",Queensboro.Bridge)),
         total = as.numeric(gsub(",","",Total))) |>
  select(date, day, temp_high, temp_low, precipitation, Brooklyn_bridge,
         Manhattan_bridge, Williamsburg_bridge, Queensboro_bridge, total)
usethis::use_data(bikes_bridges, overwrite = TRUE)
