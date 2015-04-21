#This file is part of ChiVO, the Chilean Virtual Observatory
#A project sponsored by FONDEF (D11I1060)
#Copyright (C) 2015 Universidad Tecnica Federico Santa Maria Mauricio Solar
#                                                            Marcelo Mendoza
#                   Universidad de Chile                     Diego Mardones
#                   Pontificia Universidad Catolica          Karim Pichara
#                   Universidad de Concepcion                Ricardo Contreras
#                   Universidad de Santiago                  Victor Parada
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#
gaussian_mix <- function(image) {
  # dependences: bg_fg, optimal_w, kernelsmooth, kernel_shift
  # packages required: EBImage, ptw
  library(EBImage)
  library(ptw)
  source('bg_fg.R')
  source('optimal_w.R')
  source('kernelsmooth.R')
  source('kernel_shift.R')
  p <- 0.05
  rows <- dim(image)[1]
  cols <- dim(image)[2]
  size <- min(rows,cols)
  #precision <- size/100 #precision at 1% only for big images
  precision <- size/50 #precision at 2% for small images
  #Sys.sleep(2)
  #dev.off()
  print("... radius tuning ...")
  w_max <- optimal_w(image,p)
  #Sys.sleep(2)
  #dev.off()
  print("... normalizing ...")
  diff <- (image-min(image))/(max(image)-min(image))
  g <- thresh(diff, w_max, w_max, 0)
  #Sys.sleep(2)
  #dev.off()
  print("... image thresholding ...")
  r <- w_max/2
  rMin <- 2*round(precision)
  while (r > rMin) {
    background <- matrix(0,rows,cols)
    sub <- opening(g, makeBrush(r, shape='disc'))
    image(sub,col=gray.colors(12), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
    title(main="PP Structured Projection",sub="Perseus 13CO emission in L 1448") 
    #Sys.sleep(2)
    #dev.off()
    print("... structuring ...")
    sub <- bwlabel(sub)
    fts <- computeFeatures.shape(sub)
    #Sys.sleep(2)
    #dev.off()
    print("... computing features ...")
    #Sys.sleep(3)
    print(fts)
    #Sys.sleep(5)
    centroids <- computeFeatures.moment(sub)[, c('m.cx','m.cy')]
    #Sys.sleep(3)
    print("... computing centroids ...")
    print(centroids) #for visualization
    #Sys.sleep(5)
    numObjects <- dim(fts)[1]
    if (!is.null(numObjects)){
     for (i in 1:numObjects) {
        radius <- fts[i,3]
        #print(sprintf("Iteration: %s", i))
        if (numObjects < 2) {
          C_x <- centroids[1]
          C_y <- centroids[2]
        }
        else {
          C_x <- centroids[i,1]
          C_y <- centroids[i,2] 
        }
        krn <- kernelsmooth(x = matrix(1,2*radius,2*radius), kern = matrix(0.01,2*radius,2*radius))
        krn <- exp(exp(krn))
        krn <- (krn-min(krn))/(max(krn)-min(krn))
        background <- kernel_shift(background,krn,C_x,C_y)
     }
    }
    background <- (background-min(background))/(max(background)-min(background))
    diff <- diff - background
    diff <- (diff-min(diff))/(max(diff)-min(diff))
    g <- thresh(diff, r, r, 0)
    r <- round(r/2)
  }
}
