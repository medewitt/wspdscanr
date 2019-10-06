#' Get WSPD Data
#' @description This function is used to pull the current incident tracking
#'     report from online
#' @param start_month a number representing the month
#' @param end_month a number representing the end of the nonth
#' @examples \dontrun{
#'
#' out <- get_reports()
#'
#' }
#' @export
#'

get_reports <- function(start_month = 1, end_month = 12){

	base_url <- "http://www.cityofws.org/crimestats/txt/WSPD"


	dates_to_get <-expand.grid(mon = start_month:end_month, day = 1:31) %>%
		dplyr::mutate(mon = ifelse(mon < 10, paste0("0",mon), mon),
					 day = ifelse(day < 10, paste0("0",day), day),
					 mon_day = paste0(mon,day))

	urls_to_parse <- paste0(base_url,dates_to_get$mon_day,".txt")

	collector <- list()

	for(i in seq_along(urls_to_parse)){
		call <- httr::GET(urls_to_parse[[i]])

		if(httr::status_code(call)!=200){
			next(i)
		}
		collector[[i]] <-readr::read_fwf(httr::content(call, encoding = "UTF-8"),
																		 readr::fwf_widths(c(13, 7, 5, 31, 45),
																		 									c("case", "date", "time",
																		 										"call_type", "address"))) %>%
			dplyr::filter(!is.na(case))

	}

	collector_1 <- purrr::compact(collector)

	purrr::safely(clean_up_dates)->safe_clean

	clean_df <- purrr::map_df(collector_1, clean_up_dates)


	clean_df


}
