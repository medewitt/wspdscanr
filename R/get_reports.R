#' Get WSPD Data
#' @description This function is used to pull the current incident tracking
#'     report from online
#' @param date_range specification
#'
#' @export
#'
#'

get_reports <- function(date_range){

	base_url <- "http://www.cityofws.org/crimestats/txt/WSPD"

	current_year <- substring(Sys.Date(), 1,4)

	current_date <- Sys.Date()

	dates_to_get <-expand.grid(mon = 1:12, day = 1:31) %>%
		dplyr::mutate(mon = ifelse(mon < 10, paste0("0",mon), mon),
					 day = ifelse(day < 10, paste0("0",day), day),
					 mon_day = paste0(mon,day))



}
