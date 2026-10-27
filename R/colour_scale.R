#' Colour Scale using DJSIR Corporate Brand Guidelines.
#'
#' @description
#' A palette is a collection of colours. Palettes included in this package can be
#' viewed using `palette_names()`
#'
#'
#' @param name The name of the scale which will be the axis or legend title. The default
#' `waiver` will use the variable name for that aesthetic. The title can be omitted by
#' setting `waiver` as `NULL`.
#' @param ... additional options passed to `discrete_scale`
#' @param type Palette type. One of "seq" (sequential), "div" (divergent), or "qual" (qualitative). Not Yet Implemented.
#' @param palette The name of the palette requested. See `djsir_palettes` for available palette names.
#' @param direction Direction of the colours. 1 (the default) or -1 to reverse the direction
#'
#' @export
#' 
#' @importFrom ggplot2 waiver discrete_scale
scale_colour_djsir <- function(
  name = waiver(),
  ...,
  type = "seq",
  palette = "main",
  direction = 1
) {
  discrete_scale(
    "colour",
    name = name,
    palette = pal_djsir(type, palette, direction),
    ...
  )
}

#' Fill Scale using DJSIR Corporate Brand Guidelines.
#'
#' @inheritParams scale_colour_djsir
#'
#' @export
#'
scale_fill_djsir <- function(
  name = waiver(),
  ...,
  type = "seq",
  palette = "main",
  direction = 1
) {
  discrete_scale(
    "fill",
    name = name,
    palette = pal_djsir(type, palette, direction),
    ...
  )
}
