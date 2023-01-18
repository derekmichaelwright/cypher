cypher
================

`cypher`: an `R` package for coding and decoding secret messages

Uses a Ceasar cypher in which each letter gets a different shift.
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

    ## [1] "228 141 154 158 172 81 161 171 83 149 84 168 151 151 162 154 166 86 148 159 150 151 156 85 161 156 166 166 153 159 156"

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
