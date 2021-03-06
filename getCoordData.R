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
getCoordData <- function(header){
  return (list(CRVAL1=as.numeric(header[which(header=="CRVAL1")+1]),
    CRVAL2=as.numeric(header[which(header=="CRVAL2")+1]),
    CRPIX1=as.numeric(header[which(header=="CRPIX1")+1]),
    CRPIX2=as.numeric(header[which(header=="CRPIX2")+1]),
    CD1_1=as.numeric(header[which(header=="CD1_1")+1]),
    CD1_2=as.numeric(header[which(header=="CD1_2")+1]),
    CD2_1=as.numeric(header[which(header=="CD2_1")+1]),
    CD2_2=as.numeric(header[which(header=="CD2_2")+1]),
    NAXIS1=as.numeric(header[which(header=="NAXIS1")+1]),
    NAXIS2=as.numeric(header[which(header=="NAXIS2")+1])))
}
