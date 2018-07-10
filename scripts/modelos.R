source('scripts/input.R', encoding = 'UTF-8')

summary(lm(TORCAO ~ LADO, data = dados))
summary(lm(TORCAO ~ LADO, data = dados))
# summary(lm(TORCAO ~ ALFA + LADO - 1, data = dados))
# summary(lm(TORCAO ~ ALFA + LADO - 1, data = dados))
summary(lm(TORCAO ~ ALFA + LADO, data = dados))
summary(lm(TORCAO ~ ALFA + LADO, data = dados))

summary(lm(TORCAO ~ ALFA, data = dados))
summary(lm(TORCAO ~ ALFA + LADO, data = dados))

# summary(lm(IMC ~ LADO, data = dados))
summary(lm(IMC ~ CAM, data = dados))
summary(lm(IMC ~ PINCER, data = dados))
summary(lm(IMC ~ MISTO, data = dados))

summary(lm(IMC ~ CAM + LADO, data = dados))
summary(lm(IMC ~ PINCER + LADO, data = dados))
summary(lm(IMC ~ MISTO + LADO, data = dados))


# summary(lm(TORCAO ~ IMC, data = dados))
# summary(lm(TORCAO ~ IMC, data = dados))
# summary(lm(TORCAO ~ ALFA + IMC, data = dados))
# summary(lm(TORCAO ~ ALFA + IMC, data = dados))

summary(lm(ALFA ~ LADO, data = dados))
summary(lm(ALFA ~ LADO, data = dados))

summary(lm(ALFA ~ CAM, data = dados))
summary(lm(ALFA ~ CAM, data = dados))
summary(lm(ALFA ~ PINCER, data = dados))
summary(lm(ALFA ~ PINCER, data = dados))
summary(lm(ALFA ~ MISTO, data = dados))
summary(lm(ALFA ~ MISTO, data = dados))

summary(lm(ALFA ~ CAM+PINCER, data = dados))
summary(lm(ALFA ~ CAM+PINCER, data = dados))
summary(lm(ALFA ~ CAM*PINCER, data = dados))
summary(lm(ALFA ~ CAM*PINCER, data = dados))
summary(lm(ALFA ~ CAM+PINCER+LADO, data = dados))
summary(lm(ALFA ~ CAM+PINCER+LADO, data = dados))


# ## casos positivos
# summary(lm(ALFA ~ CAM, data = dados[CAM != "NORMAL"] ))
# summary(lm(ALFA ~ CAM, data = dados[CAM != "NORMAL"]))
# summary(lm(ALFA ~ PINCER, data = dados[PINCER != "N"]))
# summary(lm(ALFA ~ PINCER, data = dados[PINCER != "N"]))
# summary(lm(ALFA ~ MISTO, data = dados[MISTO != "Simples"]))
# summary(lm(ALFA ~ MISTO, data = dados[MISTO != "Simples"]))

## ANOVAs
# summary(aov(TORCAO ~  CAM, dados))
# TukeyHSD(aov(TORCAO ~  CAM, dados))
# 
# summary(aov(TORCAO ~  PINCER, dados))
# TukeyHSD(aov(TORCAO ~  PINCER, dados))
# 
# summary(aov(TORCAO ~  MISTO, dados))
# TukeyHSD(aov(TORCAO ~  MISTO, dados))

# correlação sem filtro ---------------------------------------------------

with(dados, cor.test(TORCAO , ALFA))

# correlação com filtro de lateralidade -----------------------------------

with(dados[LADO %in% c("D", "B")], cor.test(TORCAO , ALFA))
with(dados[LADO %in% c("E", "B")], cor.test(TORCAO , ALFA))


# desfecho categórico -----------------------------------------------------

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
impacto.subsetcols <- dados[, .(TORCAO, TORCAO, LADO, IMPACTO, IMPACTO, HHS)]

# Tipo de impacto
multi.imp.tor.d <- multinom(IMPACTO ~ TORCAO, dados)
multi.imp.tor.dor.d <- multinom(IMPACTO ~ TORCAO + LADO, dados)

multi.imp.tor.e <- multinom(IMPACTO ~ TORCAO, dados)
multi.imp.tor.dor.e <- multinom(IMPACTO ~ TORCAO + LADO, dados)

png("figures/painel_Tor_impacto.png")
par(mfrow = c(2,1))
with(dados, plot(TORCAO ~ IMPACTO, ylim = c(0, 40)))
abline(h=c(5,25), lty = 4)
stripchart(TORCAO ~ IMPACTO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
with(dados, plot(TORCAO ~ IMPACTO, ylim = c(0, 40)))
abline(h=c(5,25), lty = 4)
stripchart(TORCAO ~ IMPACTO, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
dev.off()

# HHS
lm.hhs.tor.d <- lm(HHS ~ TORCAO, dados)

lm.hhs.tor.dor.d <- lm(HHS ~ TORCAO + LADO, dados)

png("figures/painel_Tor_HHS.png")
par(mfrow = c(2,1))
with(dados, plot(TORCAO, HHS, xlim = c(1, 36)))
abline(v=c(5,25), lty = 4)
with(dados, plot(TORCAO, HHS, xlim = c(1, 36)))
abline(v=c(5,25), lty = 4)
dev.off()

## Desfecho DOR

dor.cam <- multinom(GRUPO ~ CAM, dados)
dor.cam.lat <- multinom(GRUPO ~ CAM + LADO, dados)

summary(dor.cam)
exp(coef(dor.cam))
summary(dor.cam.lat)
exp(coef(dor.cam.lat))

dor.pinc <- multinom(GRUPO ~ PINCER, dados)
dor.pinc.lat <- multinom(GRUPO ~ PINCER + LADO, dados)

summary(dor.pinc)
exp(coef(dor.pinc))
summary(dor.pinc.lat)
exp(coef(dor.pinc.lat))

dor.mst <- multinom(GRUPO ~ MISTO, dados)
dor.mst.lat <- multinom(GRUPO ~ MISTO + LADO, dados)

summary(dor.mst)
exp(coef(dor.mst))
summary(dor.mst.lat)
exp(coef(dor.mst.lat))

mult.imp <- multinom(GRUPO ~ CAM + PINCER, dados)
mult.imp.lat <- multinom(GRUPO ~ CAM + PINCER + LADO, dados)

summary(mult.imp)
exp(coef(mult.imp))
summary(mult.imp.lat)
exp(coef(mult.imp.lat))

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

