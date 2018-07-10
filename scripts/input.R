library(readxl)
library(data.table)

dados.raw <- data.table(read_excel("dataset/Cabral FMP dados 2018-06-06.xlsx"))
dados.raw <- dados.raw[, c(1:19,24:26)]
names(dados.raw) <- c("ID", "SEXO", "IDADE", "RACA", "IMC", "LADO DOR", "HHS",
                  "TORCAO D", "TORCAO E", "TONNIS D", "TONNIS E",
                  "ACB D", "ACB E", "IA D", "IA E", "ACD D", "ACD E",
                  "ALFA D", "ALFA E", "I. EXTRU D", "I. EXTRU E",
                  "TIPO DE PATOLOGIA")

dados.raw$ID <- factor(dados.raw$ID)
dados.raw$SEXO <- factor(dados.raw$SEXO, labels = c("M", "F"))
dados.raw$SEXO <- relevel(dados.raw$SEXO, "F")
dados.raw$RACA <- factor(dados.raw$RACA, labels = c("Branca", "Outras"))
dados.raw$RACA <- relevel(dados.raw$RACA, "Outras")
dados.raw$`LADO DOR` <- factor(dados.raw$`LADO DOR`, labels = c("D", "E", "B"))

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
  dados.raw[`LADO DOR`== "D", .(ID, IDADE, SEXO, IMC, HHS, LADO="D", TORCAO = `TORCAO D`, ALFA = `ALFA D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)],
  dados.raw[`LADO DOR` == "E", .(ID, IDADE, SEXO, IMC, HHS, LADO="E", TORCAO = `TORCAO E`, ALFA = `ALFA E`, IA = `IA E`, ACB = `ACB E`, IE = `I. EXTRU E`)],
  dados.raw[`LADO DOR` == "B", .(ID, IDADE, SEXO, IMC, HHS, LADO="D", TORCAO = `TORCAO D`, ALFA = `ALFA D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)],
  dados.raw[`LADO DOR` == "B", .(ID, IDADE, SEXO, IMC, HHS, LADO="E", TORCAO = `TORCAO E`, ALFA = `ALFA E`, IA = `IA E`, ACB = `ACB E`, IE = `I. EXTRU E`)]
)
dor$GRUPO <- rep("Doloroso", nrow(dor))

controle <- rbind(
  dados.raw[`LADO DOR`== "D", .(ID, IDADE, SEXO, IMC, HHS, LADO="E", TORCAO = `TORCAO E`, ALFA = `ALFA E`, IA = `IA D`, ACB = `ACB E`, IE = `I. EXTRU E`)],
  dados.raw[`LADO DOR` == "E", .(ID, IDADE, SEXO, IMC, HHS, LADO="D", TORCAO = `TORCAO D`, ALFA = `ALFA D`, IA = `IA D`, ACB = `ACB D`, IE = `I. EXTRU D`)]
)
controle$GRUPO <- rep("Controle", nrow(controle))
dados <- rbind(dor, controle)
dados$LADO <- factor(dados$LADO)
dados$GRUPO <- factor(dados$GRUPO)
dados$GRUPO <- relevel(dados$GRUPO, "Controle")
dados$TORCAO.cat <- cut(dados$TORCAO, c(0,4.9, 25.1, Inf), c("retro", "normal", "ante"))
dados$TORCAO.cat <- relevel(dados$TORCAO.cat, "normal")
dados$TORCAO.alt <- dados$TORCAO.cat
levels(dados$TORCAO.alt) <- c("normal", "alterado", "alterado")
rm(dor, controle)

# CAM ####
dados$CAM <- diag.CAM(dados$ALFA)

# exceção: P17 sem ALFA D
dados[ID == "P17" & LADO == "D"]$CAM <- FALSE

# PINCER ####
dados$PINCER <- diag.PINCER(ia = dados$IA, acb = dados$ACB, extru = dados$IE)

# exceção: P15 sem ACB D
dados[ID == "P15" & LADO == "D"]$PINCER <- FALSE

# exceção: P28 sem I Extru D e E
dados[ID == "P28" & LADO == "D"]$PINCER <- FALSE
dados[ID == "P28" & LADO == "E"]$PINCER <- TRUE

# MISTO
dados$MISTO <- diag.MISTO(cam = dados$CAM, pincer = dados$PINCER)

# influentes: checar valores de ALFA D
# print(dados[(ID %in% c("P22", "P30", "P36")), .(ID, `LADO DOR`, `TORCAO D`, `ALFA D`)])
# dados <- dados[!(ID %in% c("P22", "P30", "P36"))]

# PINCER influentes: TORCAO muito pequena?
# print(dados[(ID %in% c("P3" )),.(ID, `IMPACTO D`, `TORCAO D`, `ALFA D`)])
# print(dados[(ID %in% c("P17")),.(ID, `IMPACTO E`, `TORCAO E`, `ALFA E`)])
# dados <- dados[!(ID %in% c("P3", "P17"))]

