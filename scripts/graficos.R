source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)

# alftor <- ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
#   geom_point() + theme(legend.position = "bottom") +
#   # geom_smooth(method = "lm", se = F)
#   geom_smooth(method = "lm", se = F, mapping = aes(col = GRUPO))
# ggsave("figures/AlfTor_grupo.png")

# paineis por grupo

alftor.grupo <- ggplot(dados, aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_grupo.png")

alftor.grupo.imp <- ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = GRUPO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ IMPACTO)
ggsave("figures/painel_AlfTor_grupo_imp.png")

alftor.grupo.imp.full <- ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(IMPACTO ~ GRUPO, margins = "IMPACTO")
ggsave("figures/painel_AlfTor_grupo_imp_full.png")

alftor.imp.grupo <- ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = IMPACTO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_imp_grupo.png")

# ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO)) +
#   ggtitle("Impactos por gênero") +
#   ylab("Participantes") +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   theme(legend.position = "bottom")
# ggsave("figures/impacto_sex.png")

# ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO, fill = SEXO)) +
#   ggtitle("Impactos por gênero") +
#   ylab("Participantes") +
#   geom_bar(aes(y = (..count..)/sum(..count..))) + #facet_grid(~ TIPO) +
#   scale_y_continuous(labels = scales::percent, limits = c(0, .5)) +
#   xlab("") + ylab("") +
#   theme(legend.position = "bottom")
# ggsave("figures/impacto_sex.png")

bar.imp.sex.grupo <- ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO, fill = GRUPO)) +
  ggtitle("Impactos por gênero") +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ SEXO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .5)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_sex_grupo.png")
