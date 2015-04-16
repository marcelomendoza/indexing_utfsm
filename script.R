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
library("FITSio")
library("biOps")
library("EBImage")
library("DBI")
library("RPostgreSQL")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/getAbsCoord.R")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/calculateCoords.R")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/writeToDataBase.R")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/getCoordData.R")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/getObjects.R")
source("~/Desktop/Alumnos/Gabriel_Candia/codes/mainFunction.R")
drv <- dbDriver("PostgreSQL")
database <- dbConnect(drv, dbname="alma", user="postgres", password="cygnus")
fits <- "http://das.sdss.org/www/cgi-bin/drC?RUN=3630&RERUN=40&CAMCOL=3&FIELD=83&FILTER=r"
mainFunction(database,fits)
