library(readxl)
library(data.table)

# dados <- data.table(read_excel("dataset/EXCEL TORÇÃO.xlsx"))
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
dados$PINCER <- factor(PINCER)
rm(PINCER)

# IMPACTO D
`IMPACTO D` <- rep(NA, nrow(dados))
`IMPACTO D`[dados$`PINCER D` == TRUE] <- "PINCER"
`IMPACTO D`[dados$`CAM D` == "CAM"] <- "CAM"
`IMPACTO D`[dados$`MISTO D` == TRUE] <- "MISTO"
dados$`IMPACTO D` <- factor(`IMPACTO D`)
rm(`IMPACTO D`)

# IMPACTO E
`IMPACTO E` <- rep(NA, nrow(dados))
`IMPACTO E`[dados$`PINCER E` == TRUE] <- "PINCER"
`IMPACTO E`[dados$`CAM E` == "CAM"] <- "CAM"
`IMPACTO E`[dados$`MISTO E` == TRUE] <- "MISTO"
dados$`IMPACTO E` <- factor(`IMPACTO E`)
rm(`IMPACTO E`)

# MISTO
dados[, `MISTO D` := `CAM D` == "CAM" & `PINCER D` == TRUE]
dados[, `MISTO E` := `CAM E` == "CAM" & `PINCER E` == TRUE]

