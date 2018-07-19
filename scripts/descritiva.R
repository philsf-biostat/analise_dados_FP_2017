source('scripts/input.R', encoding = 'UTF-8')

library(tableone)

tab1 <- print(CreateTableOne(data = dados.raw[, c(2:3, 5:7)], strata = "SEXO"), showAllLevels = TRUE, printToggle = FALSE)
sum.grupo <- print(CreateTableOne(data = dados[, .(GRUPO, TORCAO, ALFA, IA, ACB, IE)],strata = "GRUPO"), showAllLevels = TRUE, exact = TRUE, printToggle = FALSE)
# sum.dor <- print(CreateTableOne(data = dados[, .(IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "GRUPO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
# sum.rac <- print(CreateTableOne(data = dados[, .(SEXO, RACA, IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "RACA"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)

# remover variável de estratificação, filtrar colunas
tab1 <- tab1[-c(2:3), 1:4]
sum.grupo <- sum.grupo[-c(2:3), 2:4]
# sum.dor <- sum.dor[-c(4:6), 1:5]
# sum.rac <- sum.rac[-c(4:5), 1:4]

write.csv2(tab1, "results/tab1.csv")
write.csv2(sum.grupo, "results/grupo.csv")
# write.csv2(sum.dor, "results/dor.csv")
# write.csv2(sum.rac, "results/raca.csv")

## Associação de dados categóricos

# Homens tem tipos de impacto != das mulheres?

fisher.test(with(droplevels(dados[IMPACTO != "AUSENTE"]), table(SEXO, IMPACTO)))
# R: sim

fisher.test(with(dados, table(SEXO, CAM)))
fisher.test(with(dados, table(SEXO, PINCER)))
fisher.test(with(dados, table(SEXO, MISTO)))

# Sentir dor é um bom preditor para o tipo do impacto?
fisher.test(with(droplevels(dados[IMPACTO != "AUSENTE"]), table(GRUPO, IMPACTO)))
# R: não

fisher.test(with(dados, table(GRUPO, CAM)))
fisher.test(with(dados, table(GRUPO, PINCER)))
fisher.test(with(dados, table(GRUPO, MISTO)))

# formatar p-valores ------------------------------------------------------

pv <- function(x, digits = 3) {
  # x é um objeto htest
  format.pval(x$p.value, scientific = FALSE, eps = 10^-digits, digits = digits)
}
