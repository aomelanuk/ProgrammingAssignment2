## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) 
{
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_ginv <- function(ginv) m <<- ginv
  get_ginv <- function() m
  list(
    set = set, 
    get = get,
    set_ginv = set_ginv,
    get_ginv = get_ginv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) 
{
        ## Return a matrix that is the inverse of 'x'
  m <- x$get_ginv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- ginv(data, ...)
  x$set_ginv(m)
  m
}
