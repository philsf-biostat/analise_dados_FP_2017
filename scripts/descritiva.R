source('scripts/input.R', encoding = 'UTF-8')

library(tableone)

tab1 <- print(CreateTableOne(data = dados.raw[, .(IDADE, IMC, SEXO, HHS)]), showAllLevels = TRUE, printToggle = FALSE)
sum.grupo <- print(CreateTableOne(data = dados[, .(GRUPO, TORCAO, ALFA, IA, ACB, IE)],strata = "GRUPO"), showAllLevels = TRUE, exact = TRUE, printToggle = FALSE)
# sum.dor <- print(CreateTableOne(data = dados[, .(IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "GRUPO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
# sum.rac <- print(CreateTableOne(data = dados[, .(SEXO, RACA, IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "RACA"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)

# remover variável de estratificação, filtrar colunas
sum.grupo <- sum.grupo[-c(2:3), 2:4]
# sum.dor <- sum.dor[-c(4:6), 1:5]
# sum.rac <- sum.rac[-c(4:5), 1:4]

require(philsfmisc)

CV <- function(x) { sd(x, na.rm = TRUE)/mean(x, na.rm = TRUE)}

tab.cv <- dados[, .(
  "%CV TORCAO" = format.pct(CV(TORCAO), pct.symbol = TRUE),
  "%CV ALFA" = format.pct(CV(ALFA), pct.symbol = TRUE)
  ), by = .(GRUPO)]

write.csv2(tab1, "results/tab1.csv")
write.csv2(sum.grupo, "results/grupo.csv")
# write.csv2(sum.dor, "results/dor.csv")
# write.csv2(sum.rac, "results/raca.csv")
write.csv2(tab.cv, "results/tab_cv.csv")

## Associação de dados categóricos

# Homens tem tipos de impacto != das mulheres?

ft.sexo.imp <- fisher.test(with(droplevels(dados.impacto), table(SEXO, IMPACTO)))
# R: sim

ft.sexo.cam <- fisher.test(with(dados, table(SEXO, CAM)))
ft.sexo.pincer <- fisher.test(with(dados, table(SEXO, PINCER)))
ft.sexo.misto <- fisher.test(with(dados, table(SEXO, MISTO)))

# Sentir dor é um bom preditor para o tipo do impacto?
ft.grupo.imp <- fisher.test(with(droplevels(dados.impacto), table(GRUPO, IMPACTO)))
# R: não

ft.grupo.cam <- fisher.test(with(dados, table(GRUPO, CAM)))
ft.grupo.pincer <- fisher.test(with(dados, table(GRUPO, PINCER)))
ft.grupo.misto <- fisher.test(with(dados, table(GRUPO, MISTO)))

tt.tor.cam <- with(dados, t.test(TORCAO ~ CAM))
tt.tor.pincer <- with(dados, t.test(TORCAO ~ PINCER))
tt.tor.misto <- with(dados, t.test(TORCAO ~ MISTO))

# formatar p-valores ------------------------------------------------------

pv <- function(x, digits = 3) {
  # x é um objeto htest
  # formata o p-valor
  format.pval(x$p.value, scientific = FALSE, eps = 10^-digits, digits = digits)
}

fisher.OR <- function(x, digits = 2) {
  # x é um objeto htest (fisher.test)
  # formata a diferença entre os grupos, e não a relação ( - 1 )
  format.float(x$estimate - 1, digits = digits)
}
