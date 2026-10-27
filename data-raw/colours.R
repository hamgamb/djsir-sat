## code to prepare colours goes here
library(grDevices)

ramp_to_hex <- function(ramp) {
  rgb(ramp, maxColorValue = 255)
}


# Primary Colours
blue <- "#004c97"
teal <- "#009Ca6"
green <- "#78be20"
lime <- "#cedc00"
slate <- "#343641"
black <- "#000000"
white <- "#FFFFFF"

# Secondary Colours
dark_blue <- "#13345e"
forest_green <- "#69972c"
burnt_orange <- "#e35205"
orange <- "#FF9E1B"
cool_grey11 <- "#52565a"
cool_grey1 <- "#d9d9d6"
cool_grey0 <- ramp_to_hex(colorRamp(c(cool_grey1, white))(0.1))

# Palettes
blue_palette <- ramp_to_hex(
  colorRamp(c(blue, white))(1-c(1, 0.7, 0.55, 0.40, 0.20, 0.10, 0.05))
)

teal_palette <- ramp_to_hex(
  colorRamp(c(teal, white))(1-c(1, 0.7, 0.55, 0.40, 0.20, 0.10, 0.05))
)

green_palette <- ramp_to_hex(
  colorRamp(c(green, white))(1-c(1, 0.7, 0.55, 0.40, 0.20, 0.10, 0.05))
)


usethis::use_data(blue, 
                  teal, 
                  green, 
                  lime, 
                  slate, 
                  black, 
                  white,
                  dark_blue, 
                  forest_green,
                  burnt_orange,
                  orange,
                  cool_grey11,
                  cool_grey1,
                  cool_grey0,
                  blue_palette,
                  teal_palette,
                  green_palette,
                  internal = TRUE, overwrite = TRUE)
