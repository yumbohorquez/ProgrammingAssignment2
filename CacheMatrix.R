## This code contains two functions, the first one stores a matrix and its inverse; second function
## uses the matrix returned by the first one in order to retrieve the inverse from the cache value 

## This function returns a list of four functions set(), get(), setsolve() and getsolve()
## including the matrix defined

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) i <<- solve
  getsolve <- function() i
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
} 



## This function retrieves the inverse of the matrix stored in the first function
## if the inverse has been already calculated, it brings that info from the cache

cacheSolve <- function(x, ...) {
  i <- x$getsolve()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setsolve(i)
  i
}