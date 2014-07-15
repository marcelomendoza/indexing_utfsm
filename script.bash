library("FITSio")
library("biOps")
library("EBImage")
library("DBI")
library("RPostgreSQL")
drv <- dbDriver("PostgreSQL")
database <- dbConnect(drv, dbname="alma", user="postgres", password="xxx")
fits <- "http://das.sdss.org/www/cgi-bin/drC?RUN=3630&RERUN=40&CAMCOL=3&FIELD=83&FILTER=r"