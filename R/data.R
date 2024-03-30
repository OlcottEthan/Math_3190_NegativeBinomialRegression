#' Bike Rentals Data
#'
#' The bike_rentals dataset contains information on bike-sharing rentals over the past 2 years, including environmental and seasonal settings.
#'
#' @name bike_rentals
#' @usage data(bike_rentals)
#' @format A data frame with 17379 rows and 16 variables:
#'   \describe{
#'     \item{instant}{record index}
#'     \item{dteday}{date}
#'     \item{season}{season (1:spring, 2:summer, 3:fall, 4:winter)}
#'     \item{yr}{year (0: 2011, 1:2012)}
#'     \item{mnth}{month (1 to 12)}
#'     \item{hr}{hour (0 to 23)}
#'     \item{holiday}{whether the day is holiday or not}
#'     \item{weekday}{day of the week}
#'     \item{workingday}{if day is neither weekend nor holiday then 1, otherwise is 0}
#'     \item{weathersit}{weather situation:
#'       \describe{
#'         \item{1}{Clear, Few clouds, Partly cloudy}
#'         \item{2}{Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist}
#'         \item{3}{Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds}
#'         \item{4}{Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog}
#'       }
#'     }
#'     \item{temp}{Normalized temperature in Celsius (values are divided by 41)}
#'     \item{atemp}{Normalized feeling temperature in Celsius (values are divided by 50)}
#'     \item{hum}{Normalized humidity (values are divided by 100)}
#'     \item{windspeed}{Normalized wind speed (values are divided by 67)}
#'     \item{casual}{count of casual users}
#'     \item{registered}{count of registered users}
#'     \item{cnt}{count of total rental bikes including both casual and registered}
#'   }
"bike_rentals"


#' Periods Between Rain Events
#'
#' @description Data collected at Winnipeg International Airport (Canada) on periods (in days) between rain events.
#'
#' @usage droughts
#' @format A data frame with 2 columns: 
#' 	\describe{
#'	  \item{length}{the length of time from the copletion of the last rain event
#'			to the beginning of the next rain event.}
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
#' @usage restaurant_inspections
#' @format A data frame with 27178 rows and 5 variables:
#'   \describe{
#'     \item{business_name}{Name of restaurant/chain}
#'     \item{inspection_score}{Health Inspection Score}
#'     \item{Year}{Year of inspection}
#'     \item{NumberofLocations}{Number of locations in restaurant chain}
#'     \item{Weekend}{Was the inspection performed on a weekend?}
#'   }
#' @details This data set is used in the Regression chapter of The Effect.
#' @source Camus, Louis-Ashley. 2020. [Kaggle](https://www.kaggle.com/loulouashley/inspection-score-restaurant-inspection)
#' @references Huntington-Klein. 2021. [The Effect: An Introduction to Research Design and Causality](https://theeffectbook.net)
"restaurant_inspections"


