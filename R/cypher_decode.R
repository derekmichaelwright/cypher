#' cypher_decode.
#'
#' decode a secret message.
#' @param x coded text
#' @return decoded message
#' @export

cypher_decode <- function(x) {
  cn <- as.numeric(substr(x, 1, 3))
  intToUtf8(utf8ToInt(substr(x, 4, nchar(x))) - utf8ToInt(substr(cyphers[cn], 1, nchar(x)-3)))
}
