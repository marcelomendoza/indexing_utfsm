differenting <- function(h) {
  n = length(h)
  diff <- array(0.0, dim=c(n))
  diff[1] <- h[1] 
  for (i in 2:n){
    diff[i] <- h[i] - diff[i-1]
  }
  return(diff)
}
