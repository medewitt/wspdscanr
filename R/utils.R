
clean_up_dates <- function(df){
	df %>%
		dplyr::mutate(date = stringr::str_trim(date, side = "both")) %>%
		dplyr::mutate(time = stringr::str_trim(time, side = "both")) %>%
		dplyr::mutate(address = stringr::str_trim(address, side = "both")) %>%
		dplyr::mutate(call_type = stringr::str_trim(call_type, side = "both")) %>%
		dplyr::mutate(incident_date = lubridate::mdy(date)) %>%
		dplyr::mutate(incident_time = format(strptime(time, format="%H%M"), format = "%H:%M")) %>%
		dplyr::mutate(incident_date_time = lubridate::ymd_hm(paste(incident_date, incident_time))) %>%
		dplyr::select(-date, - time)
}
