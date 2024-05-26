# nolint start

#' @docType package
#' @usage NULL
#' @useDynLib osinfo, .registration = TRUE
NULL

#' Return string `"Hello world!"` to R.
#' @export
hello_world <- function() .Call(wrap__hello_world)

# nolint end
