## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Set and get the values of a matriz and it's inverse
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setinv <- function(solve) s <<- solve
  getinv <- function() s
  list(set = set,
       get = get,
       setinv = setinv,
       getinv = getinv)
}

## Write a short comment describing this function
## Retrieve the inverse from the inverse matrix if it has already benn calculated
cacheSolve <- function(x, ...) {
  s <- x$getinv()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setinv(s)
  s
}

# Tests 
# mat <- matrix(c(2,3,2,4), nrow =2, ncol = 2)
# cached <- makeCacheMatrix(mat)
# cacheSolve(cached)

