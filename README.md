agData R Package
================

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

    ## [1] "882 137 156 156 172 84 161 166 82 150 86 170 154 149 162 153 171 82 155 161 148 152 154 83 162 149 168 165 154 160 158"

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
