## makeCacheMatrix is a function which acts both as a storage and access provider
##of the matrix. It also calculates and sets the inverse of the matrix.
##This function is in so many ways like C++ classes. Since it returns a list of functions
## which inturn act on the objects whose environment is within this function, it is akin 
## to a class which defines member variables and functions.

## makeCacheMatrix provides the following four functions i.e. methods
## set - set the value of the matrix
## get - get the value of the matrix 
## setinv - set the value of the inverse matrix with the given matrix
## getinv - get the value of the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
 inverse <- NULL
 
 set <- function(y) {
   x <<- y
   inverse <<- NULL
 }
 get <- function() x
 
 getinverse <- function() inverse
 setinverse <- function(inv) inverse <<- inv
 
 list(set=set, get=get, getinverse=getinverse,setinverse=setinverse)
}

## cacheSolve is a function which calculate the inverse of a matrix created with
## makeCacheMatrix and store it in the structure. If the matrix is not changed
## every nex invoke of cacheSolve just reads the stored inverse matrix. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)){
      message("getting cached data")
      return(m)
  }
  mat <- x$get()
  inverse <- solve(mat)
  x$setinverse(inverse)
  inverse
}
