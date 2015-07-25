## makeCacheMatrix is a function which acts both as a storage and access provider
##of the matrix. It also calculates and sets the inverse of the matrix.
##This function is in so many ways like C++ classes. Since it returns a list of functions
## which inturn act on the objects whose environment is within this function, it is akin 
## to a class which defines member variables and functions.

## makeCacheMatrix provides the following four functions i.e. methods
## set() - set the value of the matrix
## get() - get the value of the matrix 
## setinv() - set the value of the inverse matrix with the given matrix
## getinv() - get the value of the inverse matrix 

##Note 0: This method therefore acts as a caching mechanism for inverse matrices.
##Note 1: This assumes that matrix is invertible i.e. matrix is square matrix (N*N)

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

## cacheSolve is a function which receives an object returned by makeCacheMatrix().
##It then goes on to verify if the inverse is already calculated or not.
##If inverse is already calculated, it just retrieves the set inverse matrix.
##Else, it calculates and returns the inverse matrix using solve() function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)){
      message("getting cached data")
      return(m)
  }
  mat <- x$get()
  inverse <- solve(mat)   ##solve() is used to calculate the inverse.
  x$setinverse(inverse)
  inverse
}


##To use the above functions, see the below example.
## x<- matrix(c(2,4,1,3),2,2)
##  2  1
##  4  3
## mycache <- makeCacheMatrix(x)
## cacheSolve(mycache)
## Output inverse matrix:
##  1.5 -0.5
## -2.0  1.0