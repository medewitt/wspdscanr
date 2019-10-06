# Generate Ward Object

library(sf)
library(purrr)
wards <- st_read("data-raw/wards_20150327.shp")

wards_2 <- st_transform(wards, crs = 4326)

wards_2 %>%
	mutate(
		lon = map_dbl(geometry, ~st_centroid(.x)[[1]]),
		lat = map_dbl(geometry, ~st_centroid(.x)[[2]])
	)->wards_3

content <- wards_3 %>%
	dplyr::select(Ward, lon, lat) %>%
	mutate(Ward = as.character(Ward))

ward_map <- wards_2
ward_centers <- content
# write out data ----------------------------------------------------------

usethis::use_data(ward_map, overwrite = T)
usethis::use_data(ward_centers, overwrite = T)
