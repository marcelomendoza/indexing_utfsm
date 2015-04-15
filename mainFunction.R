#This file is part of ChiVO
#Copyright (C) Gabriel Candia, Marcelo Mendoza
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
mainFunction <- function(database, fits) {
  ptm <- proc.time()
  im <- readFITS(fits)
  xy <- getObjects(im)
  coordData <- getCoordData(im$hdr)
  absCoord <- calculateCoords(coordData, xy[[1]], xy[[2]])
  writeToDataBase(database, absCoord, fits)
  print("Process Finished")
  print(sprintf("Imagen fits: %s", fits))
  print(sprintf("%s Objects identified and archived", (length(xy[[1]])/2)))
  proc.time() - ptm
}
