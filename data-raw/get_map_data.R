library(sf)

se4 <- tempfile()
se7 <- tempfile()

download.file(url = "http://api.thenmap.net/v2/se-4/geo/2020-06-03", destfile = se4)
download.file(url = "http://api.thenmap.net/v2/se-7/geo/2020-06-03", destfile = se7)

counties <- sf::read_sf(se4)
municipalities <- sf::read_sf(se7)

cnames <- data.frame(
    RegionName = c(
        "Stockholm",
        "Uppsala",
        "Södermanland",
        "Östergötland",
        "Jönköping",
        "Kronoberg",
        "Kalmar",
        "Gotland",
        "Blekinge",
        "Skåne",
        "Halland",
        "Västra Götaland",
        "Värmland",
        "Örebro",
        "Västmanland",
        "Dalarna",
        "Gävleborg",
        "Västernorrland",
        "Jämtland",
        "Västerbotten",
        "Norrbotten"
    ),
    RegionID = stringr::str_pad(
        as.character(c(1, 3:10, 12:14, 17:25)),
        width = 2, 
        side = "left",
        pad = "0"
    )
)

# Pad id with 0
counties[["id"]] <- stringr::str_pad(
    counties[["id"]], 
    width = 2,
    side = "left", 
    pad = "0"
)

counties <- dplyr::full_join(
    counties,
    cnames,
    by = c("id" = "RegionID")
)
usethis::use_data(counties, overwrite = TRUE)
usethis::use_data(municipalities, overwrite = TRUE)
