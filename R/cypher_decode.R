#' cypher_decode.
#'
#' decode a secret message.
#' @param x coded text
#' @return decoded message
#' @export
#' @examples
#' xx <- cypher_code("This is a secret coded message")
#' xx
#' cypher_decode(xx)

cypher_decode <- function(x) {
  x <- as.numeric(unlist(strsplit(x, split = " ")))
  cn <- x[1]
  intToUtf8(x[2:length(x)] - utf8ToInt(substr(cyphers[cn], 1, length(x)-1)))
}
