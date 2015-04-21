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
optimal_w <- function(image,p) {
  #radiusMin, radius Max and inc in percentages of the image size, p as [0,1] value, image is the original version
  radiusMin <- 5
  radiusMax <- 40
  inc <- 1
  f <- (image-min(image))/(max(image)-min(image))
  rows <- dim(f)[1]
  cols <- dim(f)[2]
  maxsize <- max(rows,cols)
  imagesize <- rows*cols
  radius_thresh <- round(min(rows,cols)/4)
  unit <- round(maxsize/100)
  radiusMin <- radiusMin*unit
  radiusMax <- radiusMax*unit
  radiusMax <- min(radiusMax,radius_thresh)
  radius = radiusMin
  inc <- inc*unit
  bg <- quantile(f,p)
  fg <- quantile(f,1-p)
  bg <- bg[[1]]
  fg <- fg[[1]]
  min_ov <- imagesize
  while (radius <= radiusMax) {
    g <- thresh(f, radius, radius, 0)
    ov <- bg_fg(f,g,bg,fg)
    if (ov < min_ov) {
      w <- radius
      min_ov <- ov
    }
    radius <- radius + inc
  }
  #print(w)
  return(w)
}
