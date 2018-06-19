library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/Cabral FMP dados 2018-06-06.xlsx"))
## Métodos: diagnósticos
diag.CAM <- function(alfa) {
  diag.cam <- alfa > 50
  diag.cam
}
diag.PINCER <- function(ia, acb, extru) {
  diag.pincer <- ia < 0 | acb > 39 | extru < 10
  diag.pincer
}
diag.MISTO <- function(cam, pincer) {
  diag.misto <- cam & pincer
  diag.misto
}

