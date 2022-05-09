#' map plot

map_plot <- function(
  df, 
  fill_var = "id",
  region_var = "Region", 
  map_data = NULL,
  print_clabels = FALSE
  ){

  if(!is.null(map_data)){
    df <- dplyr::left_join(
      map_data,
      df,
      by = c("id" = region_var)
    )
  }

  p <- ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = df, 
      mapping = aes(fill = .data[[fill_var]])
    ) +
    ggplot2::theme_void()

  
  if(print_clabels){
    # Add region names
    p <- p + 
      ggplot2::geom_sf_label(
        mapping = ggplot2::aes(label = RegionName),
        position = position_dodge(width = 2)
      )
  }

  return(p)
}