library(readxl)
library(data.table)

dados <- data.table(read_excel("dataset/Cabral FMP dados 2018-06-06.xlsx"))
dados <- dados[, c(1:19,24:26)]
names(dados) <- c("ID", "SEXO", "IDADE", "RACA", "IMC", "LADO DOR", "HHS",
                  "TORCAO D", "TORCAO E", "TONNIS D", "TONNIS E",
                  "ACB D", "ACB E", "IA D", "IA E", "ACD D", "ACD E",
                  "ALFA D", "ALFA E", "I. EXTRU D", "I. EXTRU E",
                  "TIPO DE PATOLOGIA")
dados <- transform(dados, ID = factor(ID),
                   SEXO = factor(SEXO),
                   RACA = factor(RACA),
                   `LADO DOR` = factor(`LADO DOR`),
                   `TONNIS D` = ordered(`TONNIS D`),
                   `TONNIS E` = ordered(`TONNIS E`),
                   `TIPO DE PATOLOGIA` = factor(`TIPO DE PATOLOGIA`),
                   IMC = IMC)
levels(dados$RACA) <- c("Branca", "Outros")
dados$RACA <- relevel(dados$RACA, "Outros")
levels(dados$`LADO DOR`) <- c("D","E","B")
levels(dados$SEXO) <- c("M", "F")
dados$SEXO <- relevel(dados$SEXO, "F")

# CAM ####
dados$`CAM D` <- cut(dados$`ALFA D`, breaks = c(0,50,Inf), labels = c("NORMAL", "CAM"))
dados$`CAM E` <- cut(dados$`ALFA E`, breaks = c(0,50,Inf), labels = c("NORMAL", "CAM"))

# exceção: P17 sem ALFA D
dados[ID == "P17"]$`CAM D` <- "NORMAL"

CAM <- rep(NA, nrow(dados))
CAM[dados$`CAM D` == "CAM"] <- "D"
CAM[dados$`CAM E` == "CAM"] <- "E"
CAM[dados$`CAM D` == "CAM" & dados$`CAM E` == "CAM"] <- "B"
CAM[dados$`CAM D` == "NORMAL" & dados$`CAM E` == "NORMAL"] <- "N"
CAM <- factor(CAM, levels = c("N", "D", "E", "B"))
# CAM <- relevel(CAM, "N")
dados$CAM <- CAM
rm(CAM)

# PINCER ####
dados[, `PINCER D` := `IA D` > 10 | `ACB D` > 39 | `I. EXTRU D` < 10]
dados[, `PINCER E` := `IA E` > 10 | `ACB E` > 39 | `I. EXTRU E` < 10]
PINCER <- rep(NA, nrow(dados))

# exceção: P15 sem ACB D
# dados[ID == "P15", `PINCER D` := `IA D` > 10 | `I. EXTRU D` < 10]
dados[ID == "P15"]$`PINCER D` <- FALSE

# exceção: P28 sem I Extru D e E
dados[ID == "P28"]$`PINCER D` <- FALSE
dados[ID == "P28"]$`PINCER E` <- TRUE

PINCER[dados$`PINCER D` == TRUE] <- "D"
PINCER[dados$`PINCER E` == TRUE] <- "E"
PINCER[dados$`PINCER D` == TRUE & dados$`PINCER E` == TRUE] <- "B"
PINCER[dados$`PINCER D` == FALSE & dados$`PINCER E` == FALSE] <- "N"
PINCER <- factor(PINCER, levels = c("N", "D", "E", "B"))
# PINCER <- relevel(PINCER, "N")
dados$PINCER <- PINCER
rm(PINCER)

# MISTO
dados[, `MISTO D` := `CAM D` == "CAM" & `PINCER D` == TRUE]
dados[, `MISTO E` := `CAM E` == "CAM" & `PINCER E` == TRUE]
MISTO <- rep(NA, nrow(dados))
MISTO[dados$`MISTO D` == TRUE] <- "D"
MISTO[dados$`MISTO E` == TRUE] <- "E"
MISTO[dados$`MISTO D` == TRUE & dados$`MISTO E` == TRUE] <- "B"
MISTO[is.na(MISTO)] <- "Simples"
dados$MISTO <- factor(MISTO, levels = c("Simples", "D", "E", "B"))
# dados$MISTO <- relevel(dados$MISTO, "N")
rm(MISTO)

# IMPACTO D
`IMPACTO D` <- rep(NA, nrow(dados))
`IMPACTO D`[dados$`PINCER D` == TRUE] <- "PINCER"
`IMPACTO D`[dados$`CAM D` == "CAM"] <- "CAM"
`IMPACTO D`[dados$`MISTO D` == TRUE] <- "MISTO"
`IMPACTO D`[is.na(`IMPACTO D`)] <- "NORMAL"
dados$`IMPACTO D` <- factor(`IMPACTO D`, levels = c("NORMAL", "CAM", "PINCER", "MISTO"))
# dados$`IMPACTO D` <- relevel(dados$`IMPACTO D`, "NORMAL")
rm(`IMPACTO D`)

# IMPACTO E
`IMPACTO E` <- rep(NA, nrow(dados))
`IMPACTO E`[dados$`PINCER E` == TRUE] <- "PINCER"
`IMPACTO E`[dados$`CAM E` == "CAM"] <- "CAM"
`IMPACTO E`[dados$`MISTO E` == TRUE] <- "MISTO"
`IMPACTO E`[is.na(`IMPACTO E`)] <- "NORMAL"
dados$`IMPACTO E` <- factor(`IMPACTO E`, levels = c("NORMAL", "CAM", "PINCER", "MISTO"))
# dados$`IMPACTO E` <- relevel(dados$`IMPACTO E`, "NORMAL")
rm(`IMPACTO E`)

# influentes: checar valores de ALFA D
print(dados[(ID %in% c("P22", "P30", "P36")), .(ID, `LADO DOR`, `TORCAO D`, `ALFA D`)])
# dados <- dados[!(ID %in% c("P22", "P30", "P36"))]

# PINCER influentes: TORCAO muito pequena?
print(dados[(ID %in% c("P3" )),.(ID, `IMPACTO D`, `TORCAO D`, `ALFA D`)])
print(dados[(ID %in% c("P17")),.(ID, `IMPACTO E`, `TORCAO E`, `ALFA E`)])
# dados <- dados[!(ID %in% c("P3", "P17"))]

impacto.lat <- dados[, .(ID, SEXO, `LADO DOR`, CAM, PINCER, MISTO)]
names(impacto.lat)[3] <- "DOR"

impacto <- impacto.lat
levels(impacto$CAM) <- c("Ausente", "CAM", "CAM", "CAM")
levels(impacto$PINCER) <- c("Ausente", "PINCER", "PINCER", "PINCER")
levels(impacto$MISTO) <- c("SIMPLES", "MISTO", "MISTO", "MISTO")

# dados numéricos
d.num <- data.frame(
  LADO = rep(c("D", "E"), each = 26),
  SEXO = rep(dados$SEXO, 2),
  RACA = rep(dados$RACA, 2),
  DOR = rep(dados$`LADO DOR`, 2),
  TORCAO = c(dados$`TORCAO D`, dados$`TORCAO E`),
  ALFA = c(dados$`ALFA D`, dados$`ALFA E`),
  CAM = rep(dados$CAM, 2),
  PINCER = rep(dados$PINCER, 2),
  IMPACTO = c(as.character(dados$`IMPACTO D`), as.character(dados$`IMPACTO E`))
)
levels(d.num$IMPACTO) <- c("NORMAL", "CAM", "PINCER", "MISTO")
