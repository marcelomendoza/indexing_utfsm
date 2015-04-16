#This file is part of ChiVO, the Chilean Virtual Observatory
#A project sponsored by FONDEF (D11I1060)
#Copyright (C) 2015 Universidad Tecnica Federico Santa Maria
#                   Universidad de Chile
#                   Pontificia Universidad Catolica
#                   Universidad de Concepcion
#                   Universidad de Santiago
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
calculateCoords <- function(data, objects, fts){
  dataObject <- matrix(, nrow=length(objects)/2, ncol=8)
  count <- 1
  lengthObjects <- length(objects)/2
  lengthFts <- length(fts)/5
  for (i in objects) {
    if (count > length(objects)/2){
      break
    }
    coordAbs <- getAbsCoord(data, objects[count], objects[lengthObjects + count])
    dataObject[count,1] <- objects[count]
    dataObject[count,2] <- objects[lengthObjects + count]
    dataObject[count,3] <- coordAbs$xab
    dataObject[count,4] <- coordAbs$yab
    radius <- ceiling(fts[lengthFts*2 +count])
    Xmin <- ceiling(objects[count] - radius)
    Xmax <- ceiling(objects[count] + radius)
    Ymin <- ceiling(objects[lengthObjects + count] - radius)
    Ymax <- ceiling(objects[lengthObjects + count] + radius)
    aux <- getAbsCoord(data, Xmin, Ymin)
    aux2 <- getAbsCoord(data, Xmax, Ymax)
    if (aux$xab > aux2$xab) {
      dataObject[count,7] <- aux$xab
      dataObject[count,5] <- aux2$xab
    }
    else {
      dataObject[count,5] <- aux$xab
      dataObject[count,7] <- aux2$xab
    }
    if (aux$yab > aux2$yab) {
      dataObject[count,8] <- aux$yab
      dataObject[count,6] <- aux2$yab
    }
    else {
      dataObject[count,6] <- aux$yab
      dataObject[count,8] <- aux2$yab
    }
    count <- count + 1
  }
  dimnames(dataObject) = list(c(1:(count-1)),
    c("xloc", "yloc", "xabs", "yabs", "minDEC", "minRA", "maxDEC", "maxRA"))
  return(dataObject)
}
