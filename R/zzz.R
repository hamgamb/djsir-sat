.onLoad <- function(libname, pkgname) {
  op <- options()
  op.djsir <- list(
    djsir.plot_base_size = 12,
    djsir.plot_ink = black,
    djsir.plot_paper = cool_grey0
  )
  
  toset <- !(names(op.djsir) %in% names(op))
  if (any(toset)) {
    options(op.djsir[toset])
  }
  
  invisible()
}
