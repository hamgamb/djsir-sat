#' DJSIR Theme
#'
#' @param base_size Controls the size of most elements. The default size is 12. You can change the default size for a session by
#' running `options(djsir.plot_base_size = 14)` either in the console or at the beginning of a script. 
#' @param legend Position of the legend (top, bottom, left, right). Default is to hide the legend
#' @param ink Colour of the ink (used to draw line elements and text) in the graph. The default colour is black. You can change the default size for 
#' a session by running `options(djsir.plot_ink = 'red')` either in the console or at the beginning of a script. 
#' @param paper Colour of the paper (used to draw background elements) in the graph. The default colour is `cool_grey0`, a 10% transparency of the DJSIR colour Cool Grey. 
#' You can change the default size for a session by running `options(djsir.plot_paper = 'red')` either in the console or at the beginning of a script.
#' @param flipped The default (FALSE) draws grid lines horizontally. To draw vertical gridlines set `flipped = TRUE`
#'
#' @export
#'
#' @examples 
#' library(ggplot2)
#' mtcars |>
#' ggplot(aes(x = mpg, y = wt, col = factor(cyl))) +
#' geom_point() +
#' scale_colour_djsir() +
#' theme_djsir(legend = 'bottom')
#'
#' @importFrom ggplot2 element_line element_rect element_text element_blank rel margin unit '%+replace%'
#'   theme_sub_axis theme_sub_legend theme_sub_panel theme_sub_strip theme_sub_plot theme_sub_axis_bottom
#'   theme_sub_axis_left theme theme_bw
theme_djsir <- function(base_size = getOption("djsir.plot_base_size"),
                        ink = getOption("djsir.plot_ink"),
                        paper = getOption("djsir.plot_paper"),
                        legend = "none",
                        flipped = FALSE) {

  stopifnot(legend %in% c("none", "top", "bottom", "left", "right"))

  # If the user has showtext, can use the VIC fonts included with this package

  if (requireNamespace("showtext", quietly = T)) {

  sysfonts::font_add(
    family = "VIC",
    regular = system.file("fonts/VIC-Regular.otf", package = "djsir.sat"),
    bold = system.file("fonts/VIC-Bold.otf", package = "djsir.sat"),
    italic = system.file("fonts/VIC-Italic.otf", package = "djsir.sat"),
    bolditalic = system.file("fonts/VIC-BoldItalic.otf", package = "djsir.sat")
  )

  showtext::showtext_auto()

  base_family <- "VIC"

  } else {base_family <- "sans"}

  thm <- theme_bw(base_size = base_size,
                  base_family = base_family,
                  header_family = base_family,
                  base_line_size = base_size / 22,
                  base_rect_size = base_size /22,
                  ink = ink,
                  paper = paper) %+replace%
    theme(line = element_line(linetype = 1, colour = ink, linewidth = 0.25),
          text = element_text(colour = ink, lineheight = 1, size = base_size)) +
    theme_sub_plot(
      title = ggtext::element_textbox_simple(face = "bold", colour = ink, family = base_family, margin = margin(0, 0, 5, 0)),
      subtitle = ggtext::element_textbox_simple(family = base_family, margin = margin(5,0,5,0)),
      margin = unit(c(1,1,1,1), "lines"),
      caption = ggtext::element_textbox_simple(face = "italic", margin = margin(5, 0, 0, 0))
    ) +
    theme_sub_strip(
      background = element_blank(),
      text = ggtext::element_textbox(
        size = rel(1),
        colour = ink,
        fill = paper,
        halign = 0.5, linetype = 1, r = unit(0, "pt"), width = unit(1, "npc"),
        padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3)
      )
    ) +
    theme_sub_panel(
      grid.major.x = element_blank(),
      grid.minor = element_blank(),
      border = element_blank(),
      background = element_rect(fill = NA),
      grid = element_line(colour = ink, linewidth = 0.15),
    ) +
    theme_sub_axis(
      title = element_text(family = base_family, size = rel(1.25)),
      text = element_text(family = base_family,face = "bold", size = rel(1)),
      ticks.length = unit(4, "pt"),
      line = element_line(linewidth = 0.35, colour = ink)
    ) +
    theme_sub_axis_bottom(
      title = ggtext::element_markdown(margin = margin(t = 6), vjust = 1),
    ) +
    theme_sub_axis_left(
      title = ggtext::element_markdown(angle = 90,vjust = 1),
      ticks = element_blank(),
      line = element_blank()
    ) +
    theme_sub_legend(
      background = element_rect(),
      key.size = unit(16, "pt"),
      text = element_text(size = rel(0.85)),
      box.spacing = unit(0, "pt"),
      position = "bottom",
      direction = "horizontal",
      justification = "left",
      title = element_blank(),
      box = "vertical"
    )



  if (flipped) {
    thm <- thm %+replace%
      ggplot2::theme(panel.grid.major.x = element_line(),
                     panel.grid.major.y = element_blank())
  }



  if (legend == "none") {
    thm <- thm %+replace%
      ggplot2::theme(legend.position = "none")
  } else {
    thm <- thm %+replace%
      ggplot2::theme(legend.position = legend)
  }

  thm

}
