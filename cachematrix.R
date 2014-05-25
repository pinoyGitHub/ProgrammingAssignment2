# makeCacheMatrix: return a list of functions to:
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse
# sample usage
# x<-makeCacheMatrix()
# x$set(matrix(1:4,2,2)
# cacheSolve(x)

makeCacheMatrix <- function(x = matrix()) {
    # storage for inverse matrix
    inv <- NULL


    # setter matrix
    set <r- function(y) {
        x <<- y
        inv <<- NULL
    }
    # getter  matrix
    get <- function() x


    # setter inverse
    setinv <- function(inverse) inv <<- inverse
    # getter inverse
    getinv <- function() inv


    # Return matrix with newly defined functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


# cacheSolve: Compute the inverse of the matrix. 

cacheSolve <- function(x, ...) {
    inv <- x$getinv()


    # return if calculated
    if (!is.null(inv)) {
        message("return cached data")
        return(inv)
    }


    # calculate if not
    data <- x$get()
    inv <- solve(data, ...)


    # cache the inverse
    x$setinv(inv)


     #return it
    inv
}
