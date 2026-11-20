#' Connect to the Training Activity Cube
#'
#' @returns
#' @export
#'
#' @examples
cube_connect <- function() {
  
  reticulate::py_require("pywin32")
  
  connect <- reticulate::import("pywin32")$connect
  
  conn <- connect(
    "Provider=MSOLAP.4;Data Source=p06671.awslzdom01.vic.gov.au;Initial Catalog=Skills Victoria Cubes CutDown;Persist Security Info=True;"
  )
  
  
}

#' Query the Training Activity Cube with an MDX Query
#'
#' @param conn an existing connection (see `cube_connect`)
#' @param query An MDX Query. Either created with `mdx_query` or raw MDX
#' @param raw If query is created with `mdx_query` this parameter must be set to FALSE
#'
#' @returns
#' @export
#'
#' @examples
cube_query <- function(conn, query, raw) {
  
  reticulate::py_require("pandas")
  pd <- reticulate::import("pandas")
  cursor <- conn$cursor()
  
  if (isFALSE(raw)) {
    cursor$execute(query$query)
    
    res <- cursor$fetchall()
    df <- data.frame(pd$DataFrame(res)) |> 
      setNames(query$colnames)  
    
    tibble::as_tibble(df, 
                      .name_repair = "universal_quiet")
  } else {
    cursor$execute(query)
    res <- cursor$fetchall()
    df <- data.frame(pd$DataFrame(res))
    tibble::as_tibble(df)
  }
  
}



