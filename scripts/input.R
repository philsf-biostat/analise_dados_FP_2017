library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/EXCEL TORÇÃO.xlsx"))
dados <- transform(dados, ID = factor(ID),
                   SEXO = factor(SEXO),
                   RAÇA = factor(RAÇA),
                   `LADO DOR`=factor(`LADO DOR`),
                   `TONNIS D`=ordered(`TONNIS D`),
                   `TONNIS E`=ordered(`TONNIS E`),
                   IMC = IMC)
