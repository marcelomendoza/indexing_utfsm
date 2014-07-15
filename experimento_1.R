experimento_1 <- function(brush, w, offset) {
  x <- thresh(nuc, w, w, offset)
  x = opening(x, makeBrush(brush, shape='disc'))
  x <- bwlabel(x)
  return(max(x))
}