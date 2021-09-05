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

    ## [1] "566 133 159 158 168 81 157 170 87 152 85 165 150 149 165 153 170 82 149 164 153 150 148 87 160 156 170 169 148 154 150"

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
