source('scripts/input.R', encoding = 'UTF-8')

summary(lm(`TORCAO D` ~ `LADO DOR`, data = dados))
summary(lm(`TORCAO E` ~ `LADO DOR`, data = dados))
# summary(lm(`TORCAO D` ~ `ALFA D` + `LADO DOR` - 1, data = dados))
# summary(lm(`TORCAO E` ~ `ALFA E` + `LADO DOR` - 1, data = dados))
summary(lm(`TORCAO D` ~ `ALFA D` + `LADO DOR`, data = dados))
summary(lm(`TORCAO E` ~ `ALFA E` + `LADO DOR`, data = dados))

summary(lm(`TORCAO D` ~ `ALFA D`, data = dados))
summary(lm(`TORCAO E` ~ `ALFA E`, data = dados))

# summary(lm(IMC ~ `LADO DOR`, data = dados))
summary(lm(IMC ~ CAM, data = dados))
summary(lm(IMC ~ PINCER, data = dados))
summary(lm(IMC ~ MISTO, data = dados))

summary(lm(IMC ~ CAM + `LADO DOR`, data = dados))
summary(lm(IMC ~ PINCER + `LADO DOR`, data = dados))
summary(lm(IMC ~ MISTO + `LADO DOR`, data = dados))


# summary(lm(`TORCAO D` ~ IMC, data = dados))
# summary(lm(`TORCAO E` ~ IMC, data = dados))
# summary(lm(`TORCAO D` ~ `ALFA D` + IMC, data = dados))
# summary(lm(`TORCAO E` ~ `ALFA E` + IMC, data = dados))

summary(lm(`ALFA D` ~ `LADO DOR`, data = dados))
summary(lm(`ALFA E` ~ `LADO DOR`, data = dados))

summary(lm(`ALFA D` ~ CAM, data = dados))
summary(lm(`ALFA E` ~ CAM, data = dados))
summary(lm(`ALFA D` ~ PINCER, data = dados))
summary(lm(`ALFA E` ~ PINCER, data = dados))
summary(lm(`ALFA D` ~ MISTO, data = dados))
summary(lm(`ALFA E` ~ MISTO, data = dados))

summary(lm(`ALFA D` ~ CAM+PINCER, data = dados))
summary(lm(`ALFA E` ~ CAM+PINCER, data = dados))
summary(lm(`ALFA D` ~ CAM*PINCER, data = dados))
summary(lm(`ALFA E` ~ CAM*PINCER, data = dados))
summary(lm(`ALFA D` ~ CAM+PINCER+`LADO DOR`, data = dados))
summary(lm(`ALFA E` ~ CAM+PINCER+`LADO DOR`, data = dados))


# ## casos positivos
# summary(lm(`ALFA D` ~ CAM, data = dados[CAM != "NORMAL"] ))
# summary(lm(`ALFA E` ~ CAM, data = dados[CAM != "NORMAL"]))
# summary(lm(`ALFA D` ~ PINCER, data = dados[PINCER != "N"]))
# summary(lm(`ALFA E` ~ PINCER, data = dados[PINCER != "N"]))
# summary(lm(`ALFA D` ~ MISTO, data = dados[MISTO != "Simples"]))
# summary(lm(`ALFA E` ~ MISTO, data = dados[MISTO != "Simples"]))

## ANOVAs
summary(aov(`TORCAO D` ~  CAM, dados))
TukeyHSD(aov(`TORCAO D` ~  CAM, dados))

summary(aov(`TORCAO D` ~  PINCER, dados))
TukeyHSD(aov(`TORCAO D` ~  PINCER, dados))

summary(aov(`TORCAO D` ~  MISTO, dados))
TukeyHSD(aov(`TORCAO D` ~  MISTO, dados))

# correlação sem filtro ---------------------------------------------------

with(dados, cor.test(`TORCAO D` , `ALFA D`))
with(dados, cor.test(`TORCAO E` , `ALFA E`))


# correlação com filtro de lateralidade -----------------------------------

with(dados[`LADO DOR` %in% c("D", "B")], cor.test(`TORCAO D` , `ALFA D`))
with(dados[`LADO DOR` %in% c("E", "B")], cor.test(`TORCAO E` , `ALFA E`))


# desfecho categórico -----------------------------------------------------

library(nnet)

# summary(glm(CAM ~ SEXO -1, binomial(link = "logit"), impacto))
# cam.sex.coef <- round(exp(coef(glm(CAM ~ SEXO -1, binomial(link = "logit"), impacto))), 1)
# OR.M.CAM <- cam.sex.coef[1]/cam.sex.coef[2]
# 
# summary(glm(PINCER ~ SEXO -1, binomial(link = "logit"), impacto))
# pinc.sex.coef <- round(exp(coef(glm(PINCER ~ SEXO -1, binomial(link = "logit"), impacto))), 1)
# OR.F.pinc <- pinc.sex.coef[2]/pinc.sex.coef[1]
# 
# summary(glm(MISTO ~ SEXO -1, binomial(link = "logit"), impacto))
# mst.sex.coef <- round(exp(coef(glm(MISTO ~ SEXO -1, binomial(link = "logit"), impacto))), 1)
# OR.M.misto <- mst.sex.coef[1]/mst.sex.coef[2]
#   
# summary(glm(CAM ~ DOR, binomial(link = "logit"), impacto))
# summary(glm(PINCER ~ DOR, binomial(link = "logit"), impacto))
# summary(glm(MISTO ~ DOR, binomial(link = "logit"), impacto))
# 
# round(exp(coef(glm(CAM ~ DOR, binomial(link = "logit"), impacto))), 1)
# round(exp(coef(multinom(CAM ~ DOR, impacto.lat))), 1)
# 
# round(exp(coef(glm(PINCER ~ DOR, binomial(link = "logit"), impacto))), 1)
# round(exp(coef(multinom(PINCER ~ DOR -1, impacto.lat))), 1)
# 
# round(exp(coef(glm(MISTO ~ DOR -1, binomial(link = "logit"), impacto))), 1)
# round(exp(coef(multinom(MISTO ~ DOR -1, impacto.lat))), 1)

## Desfecho Impacto
impacto.subsetcols <- dados[, .(`TORCAO D`, `TORCAO E`, `LADO DOR`, `IMPACTO D`, `IMPACTO E`, HHS)]

# Tipo de impacto
multi.imp.tor.d <- multinom(`IMPACTO D` ~ `TORCAO D`, dados)
multi.imp.tor.dor.d <- multinom(`IMPACTO D` ~ `TORCAO D` + `LADO DOR`, dados)

multi.imp.tor.e <- multinom(`IMPACTO E` ~ `TORCAO E`, dados)
multi.imp.tor.dor.e <- multinom(`IMPACTO E` ~ `TORCAO E` + `LADO DOR`, dados)

png("figures/painel_Tor_impacto.png")
par(mfrow = c(2,1))
with(dados, plot(`TORCAO D` ~ `IMPACTO D`, ylim = c(0, 40)))
abline(h=c(5,25), lty = 4)
stripchart(`TORCAO D` ~ `IMPACTO D`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
with(dados, plot(`TORCAO E` ~ `IMPACTO E`, ylim = c(0, 40)))
abline(h=c(5,25), lty = 4)
stripchart(`TORCAO E` ~ `IMPACTO E`, data = dados, method = "stack", vertical = TRUE, ylim = c(0, 40), pch = 19, add = TRUE)
dev.off()

# HHS
lm.hhs.tor.d <- lm(HHS ~ `TORCAO D`, dados)
lm.hhs.tor.e <- lm(HHS ~ `TORCAO E`, dados)

lm.hhs.tor.dor.d <- lm(HHS ~ `TORCAO D` + `LADO DOR`, dados)
lm.hhs.tor.dor.e <- lm(HHS ~ `TORCAO E` + `LADO DOR`, dados)

png("figures/painel_Tor_HHS.png")
par(mfrow = c(2,1))
with(dados, plot(`TORCAO D`, HHS, xlim = c(1, 36)))
abline(v=c(5,25), lty = 4)
with(dados, plot(`TORCAO E`, HHS, xlim = c(1, 36)))
abline(v=c(5,25), lty = 4)
dev.off()

## Desfecho DOR

dor.cam <- multinom(DOR ~ CAM, impacto)
dor.cam.lat <- multinom(DOR ~ CAM, impacto.lat)

summary(dor.cam)
exp(coef(dor.cam))
summary(dor.cam.lat)
exp(coef(dor.cam.lat))

dor.pinc <- multinom(DOR ~ PINCER, impacto)
dor.pinc.lat <- multinom(DOR ~ PINCER, impacto.lat)

summary(dor.pinc)
exp(coef(dor.pinc))
summary(dor.pinc.lat)
exp(coef(dor.pinc.lat))

dor.mst <- multinom(DOR ~ MISTO, impacto)
dor.mst.lat <- multinom(DOR ~ MISTO, impacto.lat)

summary(dor.mst)
exp(coef(dor.mst))
summary(dor.mst.lat)
exp(coef(dor.mst.lat))

mult.imp <- multinom(DOR ~ CAM + PINCER, impacto)
mult.imp.lat <- multinom(DOR ~ CAM + PINCER, impacto.lat)

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

mult.imp2 <- multinom(DOR ~ CAM + PINCER -1, impacto.lat)
summary(mult.imp2)

z2 <- summary(mult.imp2)$coefficients/summary(mult.imp2)$standard.errors
# z2
p2 <- (1 - pnorm(abs(z2), 0, 1)) * 2
p2
p2 < 0.05

exp(coef(mult.imp2))

mult.imp.sex <- multinom(DOR ~ CAM + PINCER + SEXO -1, impacto)
summary(mult.imp.sex)

zs <- summary(mult.imp.sex)$coefficients/summary(mult.imp.sex)$standard.errors
# zs
ps <- (1 - pnorm(abs(zs), 0, 1)) * 2
ps
ps < 0.05

exp(coef(mult.imp.sex))

mult.imp.sex2 <- multinom(DOR ~ CAM + PINCER + SEXO, impacto.lat)
summary(mult.imp.sex2)

zs2 <- summary(mult.imp.sex2)$coefficients/summary(mult.imp.sex2)$standard.errors
# zs2
ps2 <- (1 - pnorm(abs(zs2), 0, 1)) * 2
ps2
ps2 < 0.05

exp(coef(mult.imp.sex2))


mult.cam <- multinom(DOR ~ CAM -1, impacto)
summary(mult.cam)

zc <- summary(mult.cam)$coefficients/summary(mult.cam)$standard.errors
# zc
pc <- (1 - pnorm(abs(zc), 0, 1)) * 2
pc
pc < 0.05

exp(coef(mult.cam))

mult.cam2 <- multinom(DOR ~ CAM -1, impacto.lat)
summary(mult.cam2)

zc2 <- summary(mult.cam2)$coefficients/summary(mult.cam2)$standard.errors
# zc2
pc2 <- (1 - pnorm(abs(zc2), 0, 1)) * 2
pc2
pc2 < 0.05

exp(coef(mult.cam2))

