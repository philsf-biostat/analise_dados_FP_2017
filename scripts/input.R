library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/EXCEL TORÇÃO.xlsx"))
dados <- transform(dados, ID = factor(ID),
                   SEXO = factor(SEXO),
                   RAÇA = factor(RAÇA),
                   `LADO DOR`=factor(`LADO DOR`, levels = c("D","E","B")),
                   `TONNIS D`=ordered(`TONNIS D`),
                   `TONNIS E`=ordered(`TONNIS E`),
                   `TIPO DE PATOLOGIA` = factor(`TIPO DE PATOLOGIA`),
                   IMC = IMC)
