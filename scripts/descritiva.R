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

# Proporções dos impactos são diferentes?
imp.n <- with(dados.impacto, table(IMPACTO))
imp.mat <- matrix(c(as.vector(imp.n), sum(imp.n) - as.vector(imp.n)), ncol = 2)
pt.imp <- prop.test(imp.mat)
# R: não

# Homens tem tipos de impacto != das mulheres?

tc.sexo.imp <- with(dados.impacto, table(SEXO, IMPACTO))
ft.sexo.imp <- fisher.test(tc.sexo.imp)
# R: sim

ppt.sexo.imp <- pairwise.prop.test(t(tc.sexo.imp))

# Sentir dor é um bom preditor para o tipo do impacto?

tc.grupo.imp <- with(dados.impacto, table(GRUPO, IMPACTO))
ft.grupo.imp <- fisher.test(tc.grupo.imp)
# R: não


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

format.OR <- function(x, digits = 2) {
  paste("OR:", format.float(x$estimate, digits = digits), "IC:", format.interval(x$conf.int, digits = digits))
}
