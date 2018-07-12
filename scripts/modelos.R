source('scripts/input.R', encoding = 'UTF-8')

# Desfecho numérico -------------------------------------------------------

# Torção
summary(lm(TORCAO ~ ALFA, data = dados))
summary(lm(TORCAO ~ ALFA + GRUPO, data = dados))
summary(lm(TORCAO ~ ALFA + IMPACTO, data = dados))
summary(lm(TORCAO ~ ALFA + GRUPO + IMPACTO, data = dados))

# IMC
summary(lm(IMC ~ IMPACTO, data = dados))
summary(lm(IMC ~ CAM, data = dados))
summary(lm(IMC ~ PINCER, data = dados))
summary(lm(IMC ~ MISTO, data = dados))

summary(lm(IMC ~ IMPACTO + GRUPO, data = dados))
summary(lm(IMC ~ CAM + GRUPO, data = dados))
summary(lm(IMC ~ PINCER + GRUPO, data = dados))
summary(lm(IMC ~ MISTO + GRUPO, data = dados))

# HHS
lm.hhs.tor <- lm(HHS ~ TORCAO, dados)
lm.hhs.tor.dor <- lm(HHS ~ TORCAO + GRUPO, dados)

# Idade
summary(lm(TORCAO ~ ALFA + IDADE, dados))

# summary(lm(TORCAO ~ IMC, data = dados))
# summary(lm(TORCAO ~ ALFA + IMC, data = dados))

# ALFA
summary(lm(ALFA ~ CAM, data = dados))
summary(lm(ALFA ~ PINCER, data = dados))
summary(lm(ALFA ~ MISTO, data = dados))
summary(lm(ALFA ~ CAM+PINCER, data = dados))
summary(lm(ALFA ~ CAM+PINCER+GRUPO, data = dados))

## ANOVAs
summary(aov(TORCAO ~ IMPACTO, dados.impacto))
TukeyHSD(aov(TORCAO ~ IMPACTO, dados.impacto))

summary(aov(TORCAO ~ IMPACTO + GRUPO, dados.impacto))
TukeyHSD(aov(TORCAO ~ IMPACTO + GRUPO, dados.impacto))

summary(aov(TORCAO ~ IMPACTO * GRUPO, dados.impacto))
TukeyHSD(aov(TORCAO ~ IMPACTO * GRUPO, dados.impacto))

aov(HHS ~ TORCAO.cat, dados.impacto)
TukeyHSD(aov(HHS ~ TORCAO.cat, dados.impacto))

aov(HHS ~ TORCAO.alt, dados.impacto)
TukeyHSD(aov(HHS ~ TORCAO.alt, dados.impacto))

# correlação sem filtro ---------------------------------------------------

with(dados, cor.test(TORCAO , ALFA))

# Desfecho categórico -----------------------------------------------------

library(nnet)

# summary(glm(CAM ~ SEXO -1, binomial(link = "logit"), dados))
# cam.sex.coef <- round(exp(coef(glm(CAM ~ SEXO -1, binomial(link = "logit"), dados))), 1)
# OR.M.CAM <- cam.sex.coef[1]/cam.sex.coef[2]
# 
# summary(glm(PINCER ~ SEXO -1, binomial(link = "logit"), dados))
# pinc.sex.coef <- round(exp(coef(glm(PINCER ~ SEXO -1, binomial(link = "logit"), dados))), 1)
# OR.F.pinc <- pinc.sex.coef[2]/pinc.sex.coef[1]
# 
# summary(glm(MISTO ~ SEXO -1, binomial(link = "logit"), dados))
# mst.sex.coef <- round(exp(coef(glm(MISTO ~ SEXO -1, binomial(link = "logit"), dados))), 1)
# OR.M.misto <- mst.sex.coef[1]/mst.sex.coef[2]
#   
# summary(glm(CAM ~ GRUPO, binomial(link = "logit"), dados))
# summary(glm(PINCER ~ GRUPO, binomial(link = "logit"), dados))
# summary(glm(MISTO ~ GRUPO, binomial(link = "logit"), dados))
# 
# round(exp(coef(glm(CAM ~ GRUPO, binomial(link = "logit"), dados))), 1)
# round(exp(coef(multinom(CAM ~ GRUPO + LADO, dados))), 1)
# 
# round(exp(coef(glm(PINCER ~ GRUPO, binomial(link = "logit"), dados))), 1)
# round(exp(coef(multinom(PINCER ~ GRUPO -1 + LADO, dados))), 1)
# 
# round(exp(coef(glm(MISTO ~ GRUPO -1, binomial(link = "logit"), dados))), 1)
# round(exp(coef(multinom(MISTO ~ GRUPO -1 + LADO, dados))), 1)

## Desfecho Impacto

# Tipo de impacto
multi.imp.tor <- multinom(IMPACTO ~ TORCAO.alt, dados)
multi.imp.tor.dor <- multinom(IMPACTO ~ TORCAO + GRUPO, dados)

# Cada impacto
summary(glm(CAM ~ TORCAO.alt, binomial, dados))
summary(glm(PINCER ~ TORCAO.alt, binomial, dados))
summary(glm(MISTO ~ TORCAO.alt, binomial, dados))

summary(glm(CAM ~ TORCAO.cat, binomial, dados))
summary(glm(PINCER ~ TORCAO.cat, binomial, dados))
summary(glm(MISTO ~ TORCAO.cat, binomial, dados))

## Desfecho DOR

dor.cam <- multinom(GRUPO ~ CAM, dados)

summary(dor.cam)
exp(coef(dor.cam))

dor.pinc <- multinom(GRUPO ~ PINCER, dados)

summary(dor.pinc)
exp(coef(dor.pinc))

dor.mst <- multinom(GRUPO ~ MISTO, dados)

summary(dor.mst)
exp(coef(dor.mst))

mult.imp <- multinom(GRUPO ~ CAM + PINCER, dados)

summary(mult.imp)
exp(coef(mult.imp))

z <- summary(mult.imp)$coefficients/summary(mult.imp)$standard.errors
# z
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
p < 0.05

# exp(coef(mult.imp))

mult.imp2 <- multinom(GRUPO ~ CAM + PINCER -1 + LADO, dados)
summary(mult.imp2)

z2 <- summary(mult.imp2)$coefficients/summary(mult.imp2)$standard.errors
# z2
p2 <- (1 - pnorm(abs(z2), 0, 1)) * 2
p2
p2 < 0.05

exp(coef(mult.imp2))

mult.imp.sex <- multinom(GRUPO ~ CAM + PINCER + SEXO -1, dados)
summary(mult.imp.sex)

zs <- summary(mult.imp.sex)$coefficients/summary(mult.imp.sex)$standard.errors
# zs
ps <- (1 - pnorm(abs(zs), 0, 1)) * 2
ps
ps < 0.05

exp(coef(mult.imp.sex))

mult.imp.sex2 <- multinom(GRUPO ~ CAM + PINCER + SEXO + LADO, dados)
summary(mult.imp.sex2)

zs2 <- summary(mult.imp.sex2)$coefficients/summary(mult.imp.sex2)$standard.errors
# zs2
ps2 <- (1 - pnorm(abs(zs2), 0, 1)) * 2
ps2
ps2 < 0.05

exp(coef(mult.imp.sex2))

mult.cam <- multinom(GRUPO ~ CAM -1, dados)
summary(mult.cam)

zc <- summary(mult.cam)$coefficients/summary(mult.cam)$standard.errors
# zc
pc <- (1 - pnorm(abs(zc), 0, 1)) * 2
pc
pc < 0.05

exp(coef(mult.cam))

mult.cam2 <- multinom(GRUPO ~ CAM -1 + LADO, dados)
summary(mult.cam2)

zc2 <- summary(mult.cam2)$coefficients/summary(mult.cam2)$standard.errors
# zc2
pc2 <- (1 - pnorm(abs(zc2), 0, 1)) * 2
pc2
pc2 < 0.05

exp(coef(mult.cam2))
