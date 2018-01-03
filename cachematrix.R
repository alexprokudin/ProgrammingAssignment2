## Caching the inverse form of a matrix

## The function makeCacheMatrix creates a special 
## "cacheable matrix", i.e. a matrix with a cacheable inverse form
## In fact it's a list of functions
## to set/get the main matrix 
## to set/get the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
        im <- NULL
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setInverse <- function(imatrix) im <<- imatrix
        getInverse <- function() im
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## The function cacheSolve calculates/retrieves the inverse form of 
## a "cacheable matrix" created with the above function. 
## If the inverse form has already been calculated before, it gets the inverse 
## form from the cache and skips computation. Otherwise, it calculates the 
## inverse form and sets the value in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
