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
writeToDataBase <- function(database, objects, fits) {
  count <- 1
  query <- ""
  while(1) {
    if (count > length(objects)/8) break
    aux <- sprintf("(%s,%s,ST_SetsRID(ST_MakePoint(%s,%s),4326),'%s')", objects[count,3],objects[count,4], objects[count,3], objects[count,4],fits)
    if (count > 1) {aux <- sprintf(",%s",aux)}
    query <- sprintf("%s %s", query, aux)
    count <- count + 1
  }
  query <- sprintf("INSERT INTO objects VALUES%s", query)
  print(query)
  dbSendQuery(database, query) 
}
