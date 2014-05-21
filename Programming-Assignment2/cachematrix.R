## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {

        inv <- NULL
        # set and get for the matrix
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function() x # get or return the matrix
        # set and get for the matrix inverse
        setInverse <- function(i) inv <<- i
        getInverse <- function() inv
        #return methods in a list
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
        
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed)
# then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        # If the inv is not null has already been calculated, then the cachesolve should retrieve the inverse from the cache.
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        
        inv <- solve(x$get())
        x$setInverse(inv)
        inv
}
# test cases
amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
amatrix$get()         # Returns original matrix
cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
amatrix$getinverse()  # Returns matrix inverse
cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse

amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
amatrix$get()         # Returns matrix
amatrix$getInverse()  # Returns matrix inverse