source('scripts/input.R', encoding = 'UTF-8')

# correlação sem filtro ---------------------------------------------------

corr.tor.alf <- with(dados, cor.test(TORCAO , ALFA))
corr.tor.alf

# Desfecho numérico -------------------------------------------------------

# Torção
summary(lm(TORCAO ~ ALFA, data = dados))
lm.tor.alfa.con <- lm(TORCAO ~ ALFA, data = dados[GRUPO == "Controle"])
lm.tor.alfa.dor <- lm(TORCAO ~ ALFA, data = dados[GRUPO == "Doloroso"])

summary(lm.tor.alfa.con)
summary(lm.tor.alfa.dor)

summary(lm(TORCAO ~ ALFA + IMPACTO, data = dados[GRUPO == "Controle"]))
summary(lm(TORCAO ~ ALFA + IMPACTO, data = dados[GRUPO == "Doloroso"]))

# Idade
# summary(lm(TORCAO ~ ALFA + IDADE, dados))

# Desfecho categórico -----------------------------------------------------

## Desfecho Torção

# Cada impacto
log.tor.cam <- glm(TORCAO.alt ~ CAM, binomial, dados)
log.tor.pincer <- glm(TORCAO.alt ~ PINCER, binomial, dados)
log.tor.misto <- glm(TORCAO.alt ~ MISTO, binomial, dados)

summary(log.tor.cam)
summary(log.tor.pincer)
summary(log.tor.misto)

library(nnet)

mult.tor.cam <- multinom(TORCAO.cat ~ CAM, dados)
mult.tor.pincer <- multinom(TORCAO.cat ~ PINCER, dados)
mult.tor.misto <- multinom(TORCAO.cat ~ MISTO, dados)

summary(mult.tor.cam)
summary(mult.tor.pincer)
summary(mult.tor.misto)
