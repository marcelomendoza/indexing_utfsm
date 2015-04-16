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
getAbsCoord <- function(data, xloc, yloc){
  wcs1 <- data$CD1_1*(xloc-data$CRPIX1) + data$CD1_2*(yloc-data$CRPIX2)
  wcs2 <- data$CD2_1*(xloc-data$CRPIX1) + data$CD2_2*(yloc-data$CRPIX2)
  xabs <- data$CRVAL1 - wcs1
  yabs <- data$CRVAL2 - wcs2
  #dec <- data$CD1_1*(xloc) + data$CD1_2*(yloc)
  #ra <- data$CD2_1*(xloc) + data$CD2_2*(yloc)
  return(list(xab=xabs, yab=yabs))
}
