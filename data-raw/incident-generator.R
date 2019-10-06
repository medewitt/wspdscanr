## code to prepare `DATASET` dataset goes here

library(wspdscanr)


# get and read new data ---------------------------------------------------

today <- Sys.Date()

file_name <- paste0(today,"-wspd-reports.csv")

out <- get_reports()

readr::write_csv(out, here::here("data-raw", file_name))

library(readr)
# see whats available and combine -----------------------------------------

existing_files <- fs::dir_ls(here::here("data-raw"), glob = "*.csv")

wspd_incidents <- purrr::map_dfr(existing_files, readr::read_csv,
																 col_types = readr::cols(
																 	case = col_character(),
																 	call_type = col_character(),
																 	address = col_character(),
																 	incident_date = col_date(format = ""),
																 	incident_time = col_time(format = ""),
																 	incident_date_time = col_datetime(format = "")
																 )) %>%
	dplyr::distinct()

usethis::use_data(wspd_incidents, overwrite = T)
