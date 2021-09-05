cypher
================
Derek Michael Wright <wrightmderek@gmail.com>
[www.dblogr.com/](https://dblogr.com/#posts_dblogr)
2021-09-05

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

    ## [1] "658 139 153 159 165 82 154 170 85 145 81 171 157 151 171 157 171 82 154 161 152 156 156 88 159 155 171 167 154 156 155"

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
