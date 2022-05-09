#' Map coordinates for Sweden counties
#'
#' @format A sf dataset with one row per county
#' \describe{
#'   \item{id}{ID of county}
#'   \item{geometry}{Coordinate polygon used to draw county borders}
#' }
#'
#' @examples
#' library(sf)
#' library(ggplot2)
#' ggplot() +
#'  geom_sf(data = counties, aes(fill = as.numeric(id))) +
#'  theme_void()
#'
#' ggplot() +
#'   geom_sf(data = municipalities, aes(fill = as.numeric(id))) +
#'   geom_sf(data = counties, fill = NA, color = "red") +
#'  theme_void()
#'
#' @source \url{http://api.thenmap.net/v2/se-4/geo/2020-06-03}
"counties"

#' Map coordinates for Sweden municipalites
#'
#' @format A sf dataset with one row per municipality
#' \describe{
#'   \item{id}{ID of municipality}
#'   \item{geometry}{Coordinate polygon used to draw municipality borders}
#' }
#' @examples
#' library(sf)
#' library(ggplot2)
#'
#' ggplot() +
#'  geom_sf(data = municipalities, aes(fill = as.numeric(id))) +
#'  theme_void()
#'
#' ggplot() +
#'   geom_sf(data = municipalities, aes(fill = as.numeric(id))) +
#'   geom_sf(data = counties, fill = NA, color = "red") +
#'  theme_void()
#'
#' @source \url{http://api.thenmap.net/v2/se-7/geo/2020-06-03}
"municipalities"
