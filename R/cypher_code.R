#' cypher_code.
#'
#' send secret message.
#' @param x text
#' @return coded text
#' @export

cypher_code <- function(x) {
  cn <- round(runif(1, 1, 999))
  paste0(stringr::str_pad(cn, 3, pad = "0"), intToUtf8(utf8ToInt(x) + utf8ToInt(substr(cyphers[cn], 1, nchar(x)))))
}
