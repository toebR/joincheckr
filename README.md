# joincheckr
An R package with functions to get information on a left join between 2 data frames


<img src="https://user-images.githubusercontent.com/65813696/105766734-63bda380-5f5a-11eb-94bb-6f78f021e805.png" width="400" height="461" align = "right" />

## Introduction
I often find myself in the situation where I need to join (well, left-join) two data sets which are messy and/or too large for any visual control.
Some months ago, I started to write small (and honestly, very simple) helper functions to get information on a possible join before I actually join the data.
In this package, I share some of them which might prove useful to others. This is most of all a learning project for writting transferable functions and wrapping them in a documented package, so don't expect too much.

## Installation
The package is not yet on CRAN so you can install it from github and load it into your session by running the following line:

```r
remotes::install_github("toebR/joincheckr")
library(joincheckr)
```

## Functions
Regarding nomenclature, the functions arguments are distinguished between "data" and "ID". A request for "data_x" is a request for your first data frame i.e. the data frame the join will be based on. "data_y" is subsequently the other. Same principle goes for the "ID" where we enter the common join ID of df x or y. **All functions should be fully pipeable with tidyverse functions**.

Before we get to the functions, lets prepare 2 example datasets: data1 and data2.

```r
datagen <- function(){
  data1 <<- data.frame(ID = c(1,1, 2, 3, 4),
                       GroupX = c("A", "A", "A", "B", "C"),
                       VarX = c(1, 10,100, 1000, 10000))
  
  data2 <<- data.frame(ID = c(1, 2, 2, 3, 5),
                       GroupY = c("A", "B", "B", "C", "D"),
                       VarY = c(2, 20,200, 2000, 20000))
  
  
}
datagen()
```
Which assigns data1 and data2 to the global environment.
data1:
```r
> data1
  ID GroupX  VarX
1  1      A     1
2  1      A    10
3  2      A   100
4  3      B  1000
5  4      C 10000
```
data2:
```r
> data2
  ID GroupY  VarY
1  1      A     2
2  2      B    20
3  2      B   200
4  3      C  2000
5  5      D 20000
```

### get_join_cols()
This function returns a dataframe where are columns of two entered dataframes are listed which would be subject to a join.

```r
get_join_cols(data_x = data1, data_y = data2)
```
```r
    cols origin
1     ID data_x
2 GroupX data_x
3   VarX data_x
4     ID data_y
5 GroupY data_y
6   VarY data_y
```
### get_join_count()
This function counts how many times an ID is present in a data frame and returns a tibble.

> get_join_count(data_x=  data1,ID_x = data1$ID)
# A tibble: 4 x 2
  `data1$ID` join_count
       <dbl>      <int>
1          1          2
2          2          1
3          3          1
4          4          1
## Example


## Acknowledgements
A big thank you to Joshua de la Bruere (Twitter: @delaBJL) for the advice on how to write pipeable functions and help de-bugging the package!
