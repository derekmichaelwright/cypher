cypher
================

`cypher`: an `R` package for coding and decoding secret messages

Uses a Caesar cypher in which each letter gets a different shift.
Additionally, each message gets a different set of shifts based on the 3
number code at the start of the message.

------------------------------------------------------------------------

# Installation

``` r
devtools::install_github("derekmichaelwright/cypher")
```

``` r
library(cypher)
```

![](man/figures/hex_cypher.png)

------------------------------------------------------------------------

# Code Message

``` r
xx <- cypher_code("This is a secret coded message")
xx
```

    ## [1] "346 137 159 159 165 85 159 168 84 151 82 172 156 154 168 152 167 88 150 167 149 157 152 80 159 152 167 166 146 155 150"

# Decoded Message

``` r
cypher_decode(xx)
```

    ## [1] "This is a secret coded message"

------------------------------------------------------------------------

# Shiny App

Download and run the following `R` script:

<a href="https://github.com/derekmichaelwright/cypher/blob/master/shinyapp/app.R">
<button class="btn btn-success"><i class="far fa-file-code"></i> https://github.com/derekmichaelwright/cypher/blob/master/shinyapp/app.R</button>
</a>

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

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
