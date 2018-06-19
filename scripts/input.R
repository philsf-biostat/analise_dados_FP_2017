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

