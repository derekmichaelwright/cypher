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

    ## [1] "865 138 152 156 165 83 156 170 86 147 80 163 154 154 162 158 170 86 156 163 148 157 150 83 161 154 165 164 146 158 153"

# Decoded Message

``` r
cypher_decode(xx)
```

    ## [1] "This is a secret coded message"

-----

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

-----

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
