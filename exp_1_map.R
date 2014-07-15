exp_1_map <- function(wMax, bMax, offset){
  output <- array(0, dim=c(bMax,wMax))
  for (i in 2:bMax) {
    for (j in 2:wMax) {
      output[i,j] <- experimento_1(i,j,offset);
    }
  }
  i <- 1 #no brush
  for (j in 2:wMax) {
    x <- thresh(nuc, j, j, offset)
    x <- bwlabel(x)
    output[i,j] <- max(x)
  }
  j <- 1 #no thresh
  for (i in 2:bMax) {
    x = opening(nuc, makeBrush(i, shape='disc'))
    x <- bwlabel(x)
    output[i,j] <- max(x)
  }
  output[1,1] <- output[2,1]
  return(output)
}

# output_offset_0 <- exp_1_map(40,60,0)
# abs_error_offset_0 <- abs(output_offset_0-76)
# abs_error_offset_0_log <- log(abs_error_offset_0+1)
# x <- seq(1,40, by=1)
# y <- seq(1,60, by=1)
# filled.contour(x,y,abs_error_offset_0_log,nlevels=25,color.palette=topo.colors, xlab="window width (in pixels)", ylab="disc radius (in pixels)", main="Log Absolute Error")
