## ----library------------------------------------------------------------------
library("BiocIO")

## ----importexportGeneirc------------------------------------------------------
getGeneric("import")
getGeneric("export")
.CSVFile <- setClass("CSVFile", contains = "BiocFile")

## Constructor
CSVFile <-
  function(resource)
  {
    .CSVFile(resource = resource)
  }

## Define import
setMethod("import", "CSVFile",
          function(con, format, text, ...)
          {
            read.csv(resource(con), ...)
          })

## Define export
setMethod("export", c("data.frame", "CSVFile"),
          function(object, con, format, ...)
          {
            write.csv(object, resource(con), ...)
          })

temp <- tempfile(fileext = ".csv")
csv <- CSVFile(temp)
temp
csv
export(mtcars, csv)

