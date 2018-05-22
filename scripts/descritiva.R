source('scripts/input.R', encoding = 'UTF-8')

library(tableone)
sum.gen <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RAÇA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "SEXO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
sum.dor <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RAÇA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "DOR"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
sum.rac <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, RAÇA, IMC, DOR = `LADO DOR`, CAM, PINCER, MISTO)], strata = "RAÇA"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)

write.csv2(sum.gen[, 1:5], "results/gen.csv")
write.csv2(sum.dor[, 1:5], "results/dor.csv")
write.csv2(sum.rac[, 1:5], "results/raca.csv")

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
fisher.test(with(impacto.lat[MISTO != "N"], table(MISTO, SEXO)))

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

fisher.test(with(impacto.lat, table(DOR, CAM)))
fisher.test(with(impacto.lat, table(DOR, PINCER)))
fisher.test(with(impacto.lat, table(DOR, MISTO)))
