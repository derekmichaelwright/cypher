cypher
================

`cypher`: an R package for coding and decoding secret messages

![](man/figures/logo_cypher.png)

------------------------------------------------------------------------

# Installation

``` r
devtools::install_github("derekmichaelwright/cypher")
```

``` r
library(cypher)
```

------------------------------------------------------------------------

# Code Message

``` r
xx <- cypher_code("This is a secret coded message")
xx
```

    ## [1] "727 140 156 161 165 84 156 168 85 145 88 168 156 150 162 154 169 86 153 162 157 155 153 83 159 155 167 169 147 158 158"

# Decoded Message

``` r
cypher_decode(xx)
```

    ## [1] "This is a secret coded message"

------------------------------------------------------------------------

# Shiny App

Download and run the following `R` script:

<https://github.com/derekmichaelwright/cypher/blob/master/shinyapp/app.R>

------------------------------------------------------------------------

# Personalize

A custom cypher for this package can be recreated using the following
code. However, it should be noted that the recipient will need the
`Data/cyphers.RData` file to decode the messages.

``` r
cyphers <- list()
for(i in 1:999) {
  cyphers[i] <- paste(round(runif(1000, 0, 9)),collapse = "")
}
save(cyphers, file = "Data/cyphers.RData")
```

------------------------------------------------------------------------

# How it works

This package uses a Caesar cypher in which each letter gets a different
shift. Additionally, each message gets a different set of shifts based
on the 3 number code at the start of the message. The first 3 numbers
indicate which cypher will be used, and indicates the shift used for
every character. then the utf8 codes are converted to integers and the
caesar shift is added. For decoding, the first 3 numbers are read and
used to find the correct cypher, then the integers are shifted, allowing
the integers to be converted back to utf8 coding.

------------------------------------------------------------------------

# R Script/Functions

``` r
cypher_code <- function(x) {
  cn <- round(runif(1, 1, 999))
  x <- paste(c(as.numeric(stringr::str_pad(cn, 3, pad = "0")), utf8ToInt(x) + utf8ToInt(substr(cyphers[cn], 1, nchar(x)))), collapse = " ")
  x
}
```

``` r
cypher_decode <- function(x) {
  x <- as.numeric(unlist(strsplit(x, split = " ")))
  cn <- x[1]
  intToUtf8(x[2:length(x)] - utf8ToInt(substr(cyphers[cn], 1, length(x)-1)))
}
```

------------------------------------------------------------------------

© Derek Michael Wright
