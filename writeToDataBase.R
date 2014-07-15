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