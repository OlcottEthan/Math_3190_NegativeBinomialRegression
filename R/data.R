#' Bike Rentals Data
#'
#' The bike_rentals dataset contains information on bike-sharing rentals over the past 2 years, including environmental and seasonal settings.
#'
#' @name bike_rentals
#' @usage bike_rentals
#' @format A data frame with 17379 rows and 16 variables:
#'   \describe{
#'     \item{instant}{record index,}
#'     \item{dteday}{date,}
#'     \item{season}{season (1:spring, 2:summer, 3:fall, 4:winter),}
#'     \item{yr}{year (0: 2011, 1:2012),}
#'     \item{mnth}{month (1 to 12),}
#'     \item{hr}{hour (0 to 23),}
#'     \item{holiday}{whether the day is holiday or not,}
#'     \item{weekday}{day of the week,}
#'     \item{workingday}{if day is neither weekend nor holiday then 1, otherwise is 0,}
#'     \item{weathersit}{weather situation:
#'       \describe{
#'         \item{1}{Clear, Few clouds, Partly cloudy,}
#'         \item{2}{Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist,}
#'         \item{3}{Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds,}
#'         \item{4}{Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog,}
#'       }
#'     }
#'     \item{temp}{Normalized temperature in Celsius (values are divided by 41),}
#'     \item{atemp}{Normalized feeling temperature in Celsius (values are divided by 50),}
#'     \item{hum}{Normalized humidity (values are divided by 100),}
#'     \item{windspeed}{Normalized wind speed (values are divided by 67),}
#'     \item{casual}{count of casual users,}
#'     \item{registered}{count of registered users,}
#'     \item{cnt}{count of total rental bikes including both casual and registered,}
#'   }
"bike_rentals"


#' Periods Between Rain Events
#'
#' @description Data collected at Winnipeg International Airport (Canada) on periods (in days) between rain events.
#'
#' @name droughts
#' @usage droughts
#' @format A data frame with 2 columns: 
#' 	\describe{
#' 	  \item{rownames}{instance of each entry,}
#'	  \item{length}{the length of time from the completion of the last rain event to the beginning of the next rain event,}
#'	  \item{year}{the calendar year.}
#'	}
#' @examples
#' \dontrun{
#'   boxplot(length ~ year, data = droughts)
#'   boxplot(log(length) ~ year, data = droughts)
#'   hist(droughts$length, main = "Winnipeg Droughts", xlab = "length (in days)")
#'   hist(log(droughts$length), main = "Winnipeg Droughts", xlab = "length (in days, log scale)")
#' }
"droughts"


#' Data on Restaurant Inspections
#'
#' @description The restaurant_inspections data contains data on restaurant health inspections performed in Anchorage, Alaska.
#'
#' @name restaurant_inspections
#' @usage restaurant_inspections
#' @format A data frame with 27178 rows and 5 variables:
#'   \describe{
#'     \item{rownames}{instance of each entry,}
#'     \item{business_name}{Name of restaurant/chain,}
#'     \item{inspection_score}{Health Inspection Score,}
#'     \item{Year}{Year of inspection,}
#'     \item{NumberofLocations}{Number of locations in restaurant chain,}
#'     \item{Weekend}{Bool indicating if the inspection was performed on a weekend.}
#'   }
#' @details This data set is used in the Regression chapter of The Effect.
#' @source Camus, Louis-Ashley. 2020. [Kaggle](https://www.kaggle.com/loulouashley/inspection-score-restaurant-inspection)
#' @references Huntington-Klein. 2021. [The Effect: An Introduction to Research Design and Causality](https://theeffectbook.net)
"restaurant_inspections"


#' Ship Accidents
#'
#' @description Data on ship accidents.
#'
#' @name ship_accidents
#' @usage ship_accidents
#' @format A data frame containing 40 observations on 5 ship types in 4 vintages and 2 service periods.
#'   \describe{
#'     \item{type}{factor with levels "A" to "E" for the different ship types,}
#'     \item{construction}{factor with levels "1960-64", "1965-69", "1970-74", "1975-79" for the periods of construction,}
#'     \item{operation}{factor with levels "1960-74", "1975-79" for the periods of operation,}
#'     \item{service}{aggregate months of service,}
#'     \item{incidents}{number of damage incidents.}
#'   }
#' @details The data are from McCullagh and Nelder (1989, p. 205, Table 6.2) and were also used by Greene (2003, Ch. 21), see below.
#' 
#' @source Online complements to Greene (2003).
#' 
#' https://pages.stern.nyu.edu/~wgreene/Text/tables/tablelist5.htm
#' @references Greene, W.H. (2003). Econometric Analysis, 5th edition. Upper Saddle River, NJ: Prentice Hall.
#' 
#' McCullagh, P. and Nelder, J.A. (1989). Generalized Linear Models, 2nd edition. London: Chapman & Hall.
#' @seealso Greene2003, AER package
"ship_accidents"


#' Bicycle Counts for East River Bridges
#'
#' @description Daily total of bike counts conducted monthly on the Brooklyn Bridge, Manhattan Bridge, Williamsburg Bridge, and Queensboro Bridge.
#'
#' @name bikes_bridges
#' @usage bikes_bridges
#' @format A data frame containing 215 observations on 2 date variables, 2 temperature ranges, precipitation amounts, 4 different bridges and a total number of bikes.
#'   \describe{
#'     \item{date}{Factor with each date,}
#'     \item{day}{factor with the day,}
#'     \item{temp_high}{number with high temperature recorded each day,}
#'     \item{temp_low}{number with low temperature recorded each day,}
#'     \item{precipitation}{precipitation percentages for each day,}
#'     \item{Brooklyn_bridge}{number of bikes that crossed the Brooklyn bridge,}
#'     \item{Manhattan_bridge}{number of bikes that crossed the Manhattan bridge,}
#'     \item{Williamsburg_bridge}{number of bikes that crossed the Williamsburg bridge,}
#'     \item{Queensboro_bridge}{number of bikes that crossed the Queensboro bridge,}
#'     \item{total}{total number of bikes that crossed every bridge for the day,}
#'   }
#' @details The data are from the New York Department of Transportation for 2017
#' 
#' @source NYCDOT Bicycle Counts 2017.
#' 
#' https://data.cityofnewyork.us/Transportation/Bicycle-Counts-for-East-River-Bridges-Historical-/gua4-p9wg/about_data
"bikes_bridges"
