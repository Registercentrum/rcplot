library(sf)

se4 <- tempfile()
se7 <- tempfile()

download.file(url = "http://api.thenmap.net/v2/se-4/geo/2020-06-03", destfile = se4)
download.file(url = "http://api.thenmap.net/v2/se-7/geo/2020-06-03", destfile = se7)

counties <- sf::read_sf(se4)
municipalities <- sf::read_sf(se7)

usethis::use_data(counties)
usethis::use_data(municipalities)