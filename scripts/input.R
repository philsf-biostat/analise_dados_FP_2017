library(readxl)
library(data.table)

dados.raw <- data.table(read_excel("dataset/Cabral FMP dados 2018-06-06.xlsx"))
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

## Grupos
dor <- rbind(
  dados.raw[`LADO DOR` == 1, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)],
  dados.raw[`LADO DOR` == 2, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO E`, IA = `IA E`, ACB = `ACB E`, IE = `I. EXTRU E`)],
  dados.raw[`LADO DOR` == 3, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)],
  dados.raw[`LADO DOR` == 3, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO E`, IA = `IA E`, ACB = `ACB E`, IE = `I. EXTRU E`)]
)
dor$GRUPO <- rep("Doloroso", nrow(dor))

controle <- rbind(
  dados.raw[`LADO DOR` == 1, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO E`, IA = `IA D`, ACB = `ACB E`, IE = `I. EXTRU E`)],
  dados.raw[`LADO DOR` == 2, .(ID, IDADE, SEXO, IMC, HHS, TORCAO = `TORCAO D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)]
)
controle$GRUPO <- rep("Controle", nrow(controle))
dados <- rbind(dor, controle)
dados$TORCAO.cat <- cut(dados$TORCAO, c(0,4.9, 25.1, Inf), c("retro", "normal", "ante"))
dados$TORCAO.cat <- relevel(dados$TORCAO.cat, "normal")
dados$TORCAO.alt <- dados$TORCAO.cat
levels(dados$TORCAO.alt) <- c("normal", "alterado", "alterado")
rm(dor, controle)

# CAM ####
dados$CAM <- diag.CAM(dados$ALFA)

# exceção: P17 sem ALFA D
# dados[ID == "P17"]$`CAM D` <- FALSE

# PINCER ####
dados$PINCER <- diag.PINCER(ia = dados$IA, acb = dados$ACB, extru = dados$IE)

# exceção: P15 sem ACB D
# dados[ID == "P15", `PINCER D` := `IA D` > 10 | `I. EXTRU D` < 10]
# dados[ID == "P15"]$`PINCER D` <- FALSE

# exceção: P28 sem I Extru D e E
# dados[ID == "P28"]$`PINCER D` <- FALSE
# dados[ID == "P28"]$`PINCER E` <- TRUE

# MISTO
dados$MISTO <- diag.MISTO(cam = dados$CAM, pincer = dados$PINCER)

# influentes: checar valores de ALFA D
# print(dados[(ID %in% c("P22", "P30", "P36")), .(ID, `LADO DOR`, `TORCAO D`, `ALFA D`)])
# dados <- dados[!(ID %in% c("P22", "P30", "P36"))]

# PINCER influentes: TORCAO muito pequena?
# print(dados[(ID %in% c("P3" )),.(ID, `IMPACTO D`, `TORCAO D`, `ALFA D`)])
# print(dados[(ID %in% c("P17")),.(ID, `IMPACTO E`, `TORCAO E`, `ALFA E`)])
# dados <- dados[!(ID %in% c("P3", "P17"))]

