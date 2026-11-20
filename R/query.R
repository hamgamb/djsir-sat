#' Create a "Simple" MDX Query
#'
#' @param columns 
#' @param rows 
#' @param slicers 
#' @param ... 
#'
#' @returns
#' @export
#'
#' @examples
mdx_query <- function(columns, rows, slicers, years) {
  
  
  if (!is.null(years)) {
  
  years <- year_to_mdx(years)
  
  }

  
  if (!is.null(years)) {
    colnames <- c("Reporting Year",
                  "Minimum Course Commencement Year")
  } 
  
  # if (!is.null(course)) {
  #   courses <- course_code_to_mdx()
  # }
  
  # Get other column names from the rows
  names_from_row <- stringr::str_extract_all(rows,
                                         "(?<=\\[).+?(?=\\])", # Regular expression to extract characters between []
                                         simplify = FALSE)
  names_from_row <- purrr::map_chr(.x = names_from_row,
                            .f = \(x) dplyr::last(x))
  
  # And the count name from the columns
  names_from_columns <- stringr::str_extract_all(columns,
                                                 "(?<=\\[).+?(?=\\])", # Regular expression to extract characters between []
                                                 simplify = FALSE)
  
  if (length(rows) > 1) {
    rows <- paste0(rows, collapse = "*")
  }
  
                                                 
  colnames <- c(names_from_row, 
                colnames,
                names_from_columns[[1]][2])
         
  
  out <- list(query = glue::glue("SELECT 
             NON EMPTY 
             {{ 
             {columns} 
             }}
             ON COLUMNS, 
             NON EMPTY 
             {rows}
             *{{
             {years}
             }} 
             ON ROWS
             FROM [Training Activity CutDown]
             WHERE ({slicers})"
             ),
             colnames = colnames)
  out

         
}


#' Convert a simple "year" parameter to MDX
#'
#' @param year 
#'
#'
#' @examples
year_to_mdx <- function(year) { 
  
  paste(glue::glue(
    "(
        [Reporting Period].[Reporting Period Hierarchy].[Reporting Year].&[{year}],
        [Enrolment Dates].[Minimum Course Commencement Date].[Minimum Course Commencement Year].&[{year}]
      )"
  ),
  collapse = ","
  )

}

#' Convert a simple "course_Code" parameter to MDX
#'
#' @param course_code 
#'

course_name_to_mdx <- function(course_name) {
  paste(glue::glue(
    "(
  [Course Qualification].[Course Name].[Course Name].&[{course_name}]
    )"
  ),
  collapse = ","
  )

}

