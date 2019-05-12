## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function takes a Matrix and loads into an internal structure a function to:
## Set the Value
## Get the Value
## Set the Inverse (via the Solve Function)
## Get the Inverse 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
## this function checkes whether there is alreday an inverse for X 
## If the invserse has been calculated that is returned otherwise it will calc the inverse (using Solve)

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
