cypher
================
Derek Michael Wright <wrightmderek@gmail.com>
[www.dblogr.com/](https://dblogr.com/#posts_dblogr)
2021-12-03

<img src="hex_cypher.png" align="right" width = "200px" />

`cypher`: an `R` package for coding secret messages

# Installation

``` r
devtools::install_github("derekmichaelwright/cypher")
```

``` r
library(cypher)
```

# Code Message

``` r
xx <- cypher_code("This is a secret coded message")
xx
```

    ## [1] "229 138 155 156 167 84 158 166 87 146 88 165 157 148 170 156 166 86 151 166 155 157 150 88 160 151 166 169 153 155 156"

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

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
