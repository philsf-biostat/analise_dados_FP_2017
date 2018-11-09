source('scripts/input.R', encoding = 'UTF-8')

# correlação sem filtro ---------------------------------------------------

corr.tor.alf <- with(dados.impacto, cor.test(TORCAO , ALFA))
corr.tor.alf

corr.tor.alf.con <- with(dados.impacto[GRUPO == "Controle"], cor.test(TORCAO , ALFA))
corr.tor.alf.dor <- with(dados.impacto[GRUPO == "Doloroso"], cor.test(TORCAO , ALFA))
corr.tor.alf.con
corr.tor.alf.dor

# Desfecho numérico -------------------------------------------------------

# Torção
lm.tor.alfa <- lm(TORCAO ~ ALFA, data = dados.impacto)
summary(lm.tor.alfa)

lm.tor.alfa.con <- lm(TORCAO ~ ALFA, data = dados.impacto[GRUPO == "Controle"])
lm.tor.alfa.dor <- lm(TORCAO ~ ALFA, data = dados.impacto[GRUPO == "Doloroso"])

summary(lm.tor.alfa.con)
summary(lm.tor.alfa.dor)

summary(lm(TORCAO ~ ALFA + IMPACTO, data = dados.impacto[GRUPO == "Controle"]))
summary(lm(TORCAO ~ ALFA + IMPACTO, data = dados.impacto[GRUPO == "Doloroso"]))

# Idade
# summary(lm(TORCAO ~ ALFA + IDADE, dados.impacto))

# Desfecho categórico -----------------------------------------------------

## Impactos

# Desfecho sexo

log.sexo.imp <- glm(SEXO ~ IMPACTO, binomial, dados.impacto)
summary(log.sexo.imp)

# Desfecho grupo

log.grupo.imp <- glm(GRUPO ~ IMPACTO, binomial, dados.impacto)
summary(log.grupo.imp)

## Desfecho Torção

# Cada impacto
log.tor.cam <- glm(TORCAO.alt ~ CAM, binomial, dados.impacto)
log.tor.pincer <- glm(TORCAO.alt ~ PINCER, binomial, dados.impacto)
log.tor.misto <- glm(TORCAO.alt ~ MISTO, binomial, dados.impacto)

summary(log.tor.cam)
summary(log.tor.pincer)
summary(log.tor.misto)

library(nnet)

mult.tor.cam <- multinom(TORCAO.cat ~ CAM, dados.impacto)
mult.tor.pincer <- multinom(TORCAO.cat ~ PINCER, dados.impacto)
mult.tor.misto <- multinom(TORCAO.cat ~ MISTO, dados.impacto)

summary(mult.tor.cam)
summary(mult.tor.pincer)
summary(mult.tor.misto)
