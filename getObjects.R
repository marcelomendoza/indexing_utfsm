getObjects <- function(im) {
  y <- im$imDat
  #image(y, zlim=c(1100,1200), col=gray.colors(256))
  x <- thresh(y, 25, 25, 0)
  x = opening(x, makeBrush(12, shape='disc'))
  x <- bwlabel(x)
  #fts <- computeFeatures.shape(x)
  xy <- computeFeatures.moment(x)[, c('m.cx','m.cy')]
  return(list(xy, fts))
}