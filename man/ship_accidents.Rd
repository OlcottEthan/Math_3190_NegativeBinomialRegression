% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{ship_accidents}
\alias{ship_accidents}
\title{Ship Accidents}
\format{
A data frame containing 40 observations on 5 ship types in 4 vintages and 2 service periods.
\describe{
\item{type}{factor with levels "A" to "E" for the different ship types,}
\item{construction}{factor with levels "1960-64", "1965-69", "1970-74", "1975-79" for the periods of construction,}
\item{operation}{factor with levels "1960-74", "1975-79" for the periods of operation,}
\item{service}{aggregate months of service,}
\item{incidents}{number of damage incidents.}
}
}
\source{
Online complements to Greene (2003).

https://pages.stern.nyu.edu/~wgreene/Text/tables/tablelist5.htm
}
\usage{
ship_accidents
}
\description{
Data on ship accidents.
}
\details{
The data are from McCullagh and Nelder (1989, p. 205, Table 6.2) and were also used by Greene (2003, Ch. 21), see below.
}
\references{
Greene, W.H. (2003). Econometric Analysis, 5th edition. Upper Saddle River, NJ: Prentice Hall.

McCullagh, P. and Nelder, J.A. (1989). Generalized Linear Models, 2nd edition. London: Chapman & Hall.
}
\seealso{
Greene2003, AER package
}
\keyword{datasets}
