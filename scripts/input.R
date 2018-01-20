library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/EXCEL TORÇÃO.xlsx"))
dados <- data.table(read_excel("dataset/EXCEL TORÇÃO FINAL MESTRADO.xlsx"))
dados <- transform(dados, ID = factor(ID),
                   SEXO = factor(SEXO),
                   RAÇA = factor(RAÇA),
                   `LADO DOR`=factor(`LADO DOR`),
                   `TONNIS D`=ordered(`TONNIS D`),
                   `TONNIS E`=ordered(`TONNIS E`),
                   `TIPO DE PATOLOGIA` = factor(`TIPO DE PATOLOGIA`),
                   IMC = IMC)
levels(dados$`LADO DOR`) <- c("D","E","B")
levels(dados$SEXO) <- c("M", "F")

# CAM ####
dados$`CAM D` <- cut(dados$`ALFA D`, breaks = c(0,50,Inf), labels = c("NORMAL", "CAM"))
dados$`CAM E` <- cut(dados$`ALFA E`, breaks = c(0,50,Inf), labels = c("NORMAL", "CAM"))

# PINCER ####
dados[, `PINCER D` := `IA D` > 10 | `ACB D` > 39 | `I. EXTRU D` < 10]
dados[, `PINCER E` := `IA E` > 10 | `ACB E` > 39 | `I. EXTRU E` < 10]
PINCER <- rep(NA, nrow(dados))
PINCER[dados$`PINCER D` == TRUE] <- "D"
PINCER[dados$`PINCER E` == TRUE] <- "E"
dados$PINCER <- PINCER
rm(PINCER)
