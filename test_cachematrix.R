## Test CacheMatrix functions
## Just run the code line by line and check results

source("cachematrix.R")

x <- matrix(c(1:4), nrow = 2, ncol = 2)
solve(x)
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5

solve(x) %*% x
#     [,1] [,2]
#[1,]    1    0
#[2,]    0    1

xcache <- makeCacheMatrix(x)
cacheSolve(xcache)
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5

cacheSolve(xcache)
#getting cached data
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
 