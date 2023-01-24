#' cypher_code.
#'
#' send secret message.
#' @param x text
#' @return coded text
#' @export
#' @examples
#' xx <- cypher_code(x = "This is a secret coded message")
#' xx
#' cypher_decode(xx)

cypher_code <- function(x) {
  cn <- round(runif(1, 1, 999))
  x <- paste(c(as.numeric(stringr::str_pad(cn, 3, pad = "0")), utf8ToInt(x) + utf8ToInt(substr(cyphers[cn], 1, nchar(x)))), collapse = " ")
  x
}