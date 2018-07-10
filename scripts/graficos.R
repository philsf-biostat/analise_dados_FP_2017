source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)

alftor <- ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
  geom_point() + theme(legend.position = "bottom") +
  # geom_smooth(method = "lm", se = F)
  geom_smooth(method = "lm", se = F, mapping = aes(col = GRUPO))
ggsave("figures/AlfTor_grupo.png")

# SEPARADO POR IMPACTO
alftor.imp <- ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = IMPACTO, shape = IMPACTO)) +
  geom_point(size = 2) +
  theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, size = .6)

# paineis por lado

ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)

ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = GRUPO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ IMPACTO)
ggsave("figures/painel_AlfTor_IMPACTO.png")

ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(IMPACTO ~ GRUPO, margins = "IMPACTO")
ggsave("figures/painel_AlfTor_IMPACTO2.png")

ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = IMPACTO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_IMPACTO3.png")

bar.imp.sex <- ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO)) +

# gg.bar.freq <- scale_y_continuous(limits = c(0, ceiling(nrow(impacto)/10)*10)) +
#   theme(legend.position = "bottom", legend.title = element_blank()) +
#   ylab("Participantes")
# gg.bar.prop <- scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO, fill = SEXO)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + #facet_grid(~ TIPO) +
  scale_y_continuous(labels = scales::percent) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_sex.png")

ggplot(dados[IMPACTO != "AUSENTE"], aes(IMPACTO, fill = GRUPO)) +
  ggtitle("Tipos de Impacto") +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ SEXO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .5)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_sex_grupo.png")
