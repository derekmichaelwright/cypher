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

    ## [1] "379<U+0089><U+009E><U+009C>¨R¡©R<U+0099>V§<U+0097><U+0096>§<U+0095>¬U<U+0094>¥<U+0098>\235<U+0098>P£<U+0096>¤«<U+0098><U+009A><U+0099>"

# Decoded Message

``` r
cypher_decode(xx)
```

    ## [1] "This is a secret coded message"

-----

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
