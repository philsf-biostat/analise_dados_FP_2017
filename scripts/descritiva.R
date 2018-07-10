source('scripts/input.R', encoding = 'UTF-8')

library(tableone)

tab1 <- print(CreateTableOne(data = dados.raw[, c(2:3, 5:7)]), showAllLevels = TRUE, printToggle = FALSE)
sum.lado <- print(CreateTableOne(data = dados[, .(GRUPO, TORCAO, ALFA, IA, ACB, IE)],strata = "GRUPO"), showAllLevels = TRUE, exact = TRUE, printToggle = FALSE)
sum.gen <- print(CreateTableOne(data = dados[, .(SEXO, IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "SEXO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
sum.dor <- print(CreateTableOne(data = dados[, .(IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "GRUPO"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)
# sum.rac <- print(CreateTableOne(data = dados[, .(SEXO, RACA, IDADE, IMC, GRUPO, CAM, PINCER, MISTO)], strata = "RACA"), exact = TRUE, showAllLevels = TRUE, printToggle = FALSE)

# remover variável de estratificação, filtrar colunas
sum.lado <- sum.lado[-c(2:3), 1:4]
sum.gen <- sum.gen[-c(2:3), 1:4]
sum.dor <- sum.dor[-c(4:6), 1:5]
# sum.rac <- sum.rac[-c(4:5), 1:4]

write.csv2(tab1, "results/tab1.csv")
write.csv2(sum.lado, "results/lado.csv")
write.csv2(sum.gen, "results/gen.csv")
write.csv2(sum.dor, "results/dor.csv")
# write.csv2(sum.rac, "results/raca.csv")
