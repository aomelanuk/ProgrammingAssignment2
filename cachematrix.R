## Put comments here that give an overall description of what your
## functions do
##library(MASS) downloading package for matrix inversion, without this package skript not working
##After executing the code, the library will be unloaded from the environment
##set_ginv main function for matrix inverse
## Write a short comment describing this function
## make cache matrix
makeCacheMatrix <- function(x = matrix()) 
{
  library(MASS)
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
##function make matrix inverse

cacheSolve <- function(x, ...) 
{
        ## Return a matrix that is the inverse of 'x'
  m <- x$get_ginv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ##recieve data matrix
  data <- x$get()
  ##make inversion of matrix
  m <- ginv(data, ...)
  x$set_ginv(m)
  m
}
