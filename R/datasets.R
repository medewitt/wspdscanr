#' Winston-Salem Police Incident Logs
#' @description This is a running log of the incident reports posted to the
#'     Winston-Salem Police Department Website.
#' @format a dataframe with many rows and 6 columns:
#' \describe{
#'   \item{case}{Case Number}
#'   \item{call_type}{Type of Call}
#'   \item{address}{Where the incident occured}
#'   \item{incident_date}{Date}
#'   \item{incident_time}{Time}
#'   \item{incident_date_time}{Date and time combined}
#'    ...
#' }
#' @source \url{http://www.cityofws.org/crimestats/}

"wspd_incidents"

#' Ward Centers
#' @description The centers of the Wards in Winston-Salem
#' @format a dataframe with 12 rows and 4 columns:
#' \describe{
#'   \item{Ward}{The name of the ward}
#'   \item{lon}{Type of Call}
#'   \item{lat}{Where the incident occured}
#'   \item{geometry}{Date}
#'    ...
#' }
#' @source \url{http://www.cityofws.org}

"ward_centers"

#' Ward Centers
#' @description The shapefile for the Wards of Winston-Salem
#' @format an sf object
#' @source \url{http://www.cityofws.org}

"ward_map"
