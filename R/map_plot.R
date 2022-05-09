#' map plot

map_plot <- function(
  df, 
  fill_var = "id",
  region_var = "Region", 
  map_data = NULL,
  counties = TRUE,
  municipalites = FALSE){

  if(!is.null(map_data)){
    df <- dplyr::left_join(
        map_data,
        df,
        by = c("id" = region_var)
    )
  }
 ggplot2::ggplot() +
  ggplot2::geom_sf(
    data = df, 
    aes(fill = .data[[fill_var]])
  ) + 
  ggplot2::theme_void()
 
}