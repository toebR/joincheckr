# joincheckr
R package with functions to get information on left join between 2 data frames


**Test Data** (Will generate data1 and data2 in the global environment
```
datagen <- function(libname, pkgname){
  data1 <<- data.frame(ID = c(1,1, 2, 3, 4),
                       GroupX = c("A", "A", "A", "B", "C"),
                       VarX = c(1, 10,100, 1000, 10000))
  
  data2 <<- data.frame(ID = c(1, 2, 2, 3, 5),
                       GroupY = c("A", "B", "B", "C", "D"),
                       VarY = c(2, 20,200, 2000, 20000))
  
  
}

datagen
````
