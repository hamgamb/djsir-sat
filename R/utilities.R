# library(tidyverse)
# make_col_tibble <- function(n, palette = "main") {
#
#   tibble(col = make_djsir_pal_discrete(n, palette),
#          order = c(1:n),
#          n = n)
#
# }
#
# djsir_colours <- map_dfr(seq_along(djsir_palettes$blue), ~make_col_tibble(n = .x, palette = "main"))
#
# djsir_colours$col <- factor(djsir_colours$col)
#
# djsir_colours <- djsir_colours |>
#   mutate(n_desc = if_else(n == 1, "n = 1", paste0("  ", n)))
#
# col_plot <- djsir_colours  |>
#   ggplot(aes(x = reorder(n_desc, -n),
#              y = order,
#              fill = col)) +
#   geom_tile(col = "white", linewidth = 1) +
#   scale_fill_manual(values = levels(djsir_colours$col)) +
#   coord_flip(expand = FALSE, ylim = c(0, 13)) +
#   theme_djsir() +
#   theme(panel.grid = element_blank(),
#         axis.title = element_blank(),
#         axis.ticks = element_blank(),
#         axis.line = element_blank(),
#         axis.text.x = element_blank())
#
# col_plot
