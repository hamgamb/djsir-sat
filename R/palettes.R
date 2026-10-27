djsir_palettes <- function(name) {
  pal <- list(
  `main` = c(blue,
           teal,
           green,
           lime,
           slate,
           dark_blue,
           forest_green,
           burnt_orange,
           orange),
  `blue` = blue_palette,
  `teal` = teal_palette,
  `green` = green_palette)
  
  pal[[name]]
}

pal_djsir <- function(type = "seq", palette = "main", direction = 1) {
  pal <- palette

  fun <- function(n) {
   pal <- djsir.pal(n, pal)

   pal <- pal[seq_len(n)]

   if (direction == -1) {
     pal <- rev(pal)
   }
   pal
  }
}

 djsir.pal <- function(n, name) {
   djsir_palettes(name)[1:n]
 }


#' List available palettes
#'
#' @returns character vector of palette names
#' @export
#'
#' @examples palette_names()
palette_names <- function(){
  names(djsir_palettes)
}

