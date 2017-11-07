library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/EXCEL TORÇÃO.xlsx"))
dados <- transform(dados, ID = factor(ID),
                   `TONNIS D`=ordered(`TONNIS D`),
                   `TONNIS E`=ordered(`TONNIS E`),
                   "")
