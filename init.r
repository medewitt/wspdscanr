library(usethis)
usethis::use_appveyor()

# Set Up
use_readme_rmd()
use_description()
use_mit_license()
use_lifecycle_badge("experimental")
# Communication

# CI Tools
use_travis()
use_appveyor()

# Website

# Deploy

use_make()
use_make()


# package actual ----------------------------------------------------------

use_package("dplyr")
use_package("httr")
use_package("lubridate")
use_package("purrr")
use_package("stringr")
usethis::use_pipe()
