source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)

alftor <- ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
  geom_point() + theme(legend.position = "bottom") +
  # geom_smooth(method = "lm", se = F)
  geom_smooth(method = "lm", se = F, mapping = aes(col = GRUPO))
ggsave("figures/AlfTor_grupo.png")

alftor.cam <- ggplot(dados[CAM == TRUE], aes(ALFA, TORCAO)) +
  ggtitle("CAM") +
  geom_point() + theme(legend.position = "none") +
  geom_smooth(method = "lm", se = F)
ggsave("figures/AlfTor_CAM.png")

alftor.pincer <- ggplot(dados[PINCER == TRUE], aes(ALFA, TORCAO)) +
  ggtitle("PINCER") +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F)
ggsave("figures/AlfTor_PINCER.png")

alftor.misto <- ggplot(dados[MISTO == TRUE], aes(ALFA, TORCAO)) +
  ggtitle("MISTO") +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F)
ggsave("figures/AlfTor_MISTO.png")

# SEPARADO POR IMPACTO
alftor.imp <- ggplot(dados[IMPACTO != "AUSENTE"], aes(ALFA, TORCAO, col = IMPACTO, shape = IMPACTO)) +
  geom_point(size = 2) +
  theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, size = .6)
ggsave("figures/AlfTor_IMPACTO.png")

# paineis por lado

ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_dor.png")

# ggplot(d.num[d$CAM != "N",], aes(ALFA, TORCAO, col = CAM)) +
ggplot(dados, aes(ALFA, TORCAO, col = CAM)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_CAM.png")

# ggplot(d.num[d$PINCER != "N",], aes(ALFA, TORCAO, col = PINCER)) +
ggplot(d.num, aes(ALFA, TORCAO, col = PINCER)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ LADO)
ggsave("figures/painel_AlfTor_PINCER.png")

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
