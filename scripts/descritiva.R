source('scripts/input.R', encoding = 'UTF-8')

library(tableone)

tab1 <- print(CreateTableOne(
  data = dados[, c(2:7)]),
  showAllLevels = TRUE, printToggle = FALSE)

sum.lado <- print(
  CreateTableOne(
    data = d.num,
    strata = "LADO"),
  showAllLevels = TRUE,
  exact = TRUE,
  printToggle = FALSE)[, 1:4]

sum.gen <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RACA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "SEXO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
sum.dor <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RACA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "DOR"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
sum.rac <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RACA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "RACA"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)

# remover variável de estratificação, filtrar colunas
sum.lado <- sum.lado[-c(1,2:3,8:10), 1:4]
sum.rac <- sum.rac[-c(5:6), 1:4]
sum.gen <- sum.gen[-c(2:3), 1:4]
sum.dor <- sum.dor[-c(8:10), 1:5]

write.csv2(tab1, "results/tab1.csv")
write.csv2(sum.lado, "results/lado.csv")
write.csv2(sum.gen, "results/gen.csv")
write.csv2(sum.dor, "results/dor.csv")
write.csv2(sum.rac, "results/raca.csv")

png("figures/painel_Alfa_Tor_dor.png")
par(mfrow = c(2,2))
stripchart(`ALFA D` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19)
stripchart(`ALFA E` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19)
stripchart(`TORCAO D` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19)
stripchart(`TORCAO E` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19)
dev.off()

png("figures/painel_Alfa_Tor_dor2.png")
par(mfrow = c(2,2))
with(dados, plot(`ALFA D` ~ `LADO DOR`, ylim = c(30, 100)))
stripchart(`ALFA D` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19, add = TRUE)
with(dados, plot(`ALFA E` ~ `LADO DOR`, ylim = c(30, 100)))
stripchart(`ALFA E` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19, add = TRUE)
with(dados, plot(`TORCAO D` ~ `LADO DOR`, ylim = c(0, 40)))
stripchart(`TORCAO D` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
with(dados, plot(`TORCAO E` ~ `LADO DOR`, ylim = c(0, 40)))
stripchart(`TORCAO E` ~ `LADO DOR`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
dev.off()

CreateTableOne(
  data = dados[, .(`ALFA D`, `ALFA E`, `TORCAO D`, `TORCAO E`, DOR = `LADO DOR`, SEXO)],
  strata = "DOR"
  )

png("figures/painel_Alfa_Tor_sex2.png")
par(mfrow = c(2,2))
with(dados, plot(`ALFA D` ~ SEXO, ylim = c(30, 100)))
stripchart(`ALFA D` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19, add = TRUE)
with(dados, plot(`ALFA E` ~ SEXO, ylim = c(30, 100)))
stripchart(`ALFA E` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19, add = TRUE)
with(dados, plot(`TORCAO D` ~ SEXO, ylim = c(0, 40)))
stripchart(`TORCAO D` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
with(dados, plot(`TORCAO E` ~ SEXO, ylim = c(0, 40)))
stripchart(`TORCAO E` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
dev.off()

png("figures/painel_Alfa_Tor_sex.png")
par(mfrow = c(2,2))
stripchart(`ALFA D` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19)
stripchart(`ALFA E` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(30, 100), pch = 19)
stripchart(`TORCAO D` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19)
stripchart(`TORCAO E` ~ SEXO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19)
dev.off()

CreateTableOne(
  data = dados[, .(`ALFA D`, `ALFA E`, `TORCAO D`, `TORCAO E`, DOR = `LADO DOR`, SEXO)],
  strata = "SEXO"
  )

# IMPACTO (geral)
fisher.test(with(impacto, table(SEXO, CAM)))
fisher.test(with(impacto, table(SEXO, PINCER)))
fisher.test(with(impacto, table(SEXO, MISTO)))

fisher.test(with(impacto, table(CAM, SEXO)))
fisher.test(with(impacto, table(PINCER, SEXO)))
fisher.test(with(impacto, table(MISTO, SEXO)))

# controlando pelo lado do impacto
fisher.test(with(impacto.lat[CAM != "N"], table(CAM, SEXO)))
fisher.test(with(impacto.lat[PINCER != "N"], table(PINCER, SEXO)))
fisher.test(with(impacto.lat[MISTO != "Simples"], table(MISTO, SEXO)))

# png("figures/impactos_sexo.png", 1200, 500)
# par(mfrow = c(1,3))
# mybarplot(with(impacto, table(CAM, SEXO)), "GENERO", "Impacto", ylim = c(0,20))
# mybarplot(with(impacto, table(PINCER, SEXO)), "GENERO", "Impacto", ylim = c(0,20))
# mybarplot(with(impacto, table(MISTO, SEXO)), "GENERO", "Impacto", ylim = c(0,20))
# dev.off()

# Lado de dor é um bom preditor para impacto?
fisher.test(with(impacto, table(DOR, CAM)))
fisher.test(with(impacto, table(DOR, PINCER)))
fisher.test(with(impacto, table(DOR, MISTO)))

fisher.test(with(impacto.lat[CAM != "N"], table(DOR, CAM)))
fisher.test(with(impacto.lat[PINCER != "N"], table(DOR, PINCER)))
fisher.test(with(impacto.lat[MISTO != "Simples"], table(DOR, MISTO)))
