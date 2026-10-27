test_that("theme creates a theme", {
  thm <- theme_djsir()
  expect_s3_class(thm, "ggplot2::theme")
  expect_type(thm, "list")
})

test_that("options adjust the theme", {
  expect_equal(theme_djsir()$text@size, 12)
  expect_equal(theme_djsir(base_size = 22)$text@size, 22)
  options(djsir.plot_base_size = 30)
  expect_equal(theme_djsir()$text@size, 30)
  
})
 