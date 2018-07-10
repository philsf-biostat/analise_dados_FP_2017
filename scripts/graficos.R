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

ggplot(dados[CAM == TRUE], aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
ggsave("figures/painel_AlfTor_CAM.png")

ggplot(dados[PINCER == TRUE], aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(~ GRUPO)
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

# ggplot(gather(dados[, .(SEXO, IMPACTO, IMPACTO)], LADO, IMPACTO, IMPACTO, IMPACTO, -SEXO), aes(IMPACTO)) + geom_bar(aes(fill = SEXO))
# ggplot(dados, aes(IMPACTO)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(IMPACTO)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge")

# ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggplot(dados, aes(CAM)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggsave("figures/CAM.png")

# ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggplot(dados, aes(PINCER)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggsave("figures/PINCER.png")

# ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggplot(dados, aes(MISTO)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggplot(dados, aes(MISTO)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggsave("figures/MISTO.png")

# ggplot(dados[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos1.png")

# ggplot(dados[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos2.png")

# ggplot(dados[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos3.png")

ggplot(dados, aes(SEXO, CAM)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/CAM_sex_lat.png")

ggplot(dados, aes(GRUPO, CAM)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = GRUPO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Grupo") +
  ylab("Participantes")
ggsave("figures/CAM_dor_lat.png")

# ggplot(data.table(gather(dados[, .(SEXO, CAM, CAM)], CAM, IMPACTO, -SEXO))[IMPACTO == "CAM"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggsave("figures/CAM_pos.png")

# ggplot(dados[PINCER != "N"], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggplot(dados[PINCER != "N"], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[PINCER %in% c("D", "E"), .(SEXO, PINCER, PINCER)], PINCER, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggsave("figures/PINCER_pos.png")

ggplot(dados[PINCER == TRUE], aes(SEXO, PINCER)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/PINCER_sex_lat.png")

ggplot(dados[PINCER == TRUE], aes(GRUPO, PINCER)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = GRUPO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Dor") +
  ylab("Participantes")
ggsave("figures/PINCER_dor_lat.png")

# ggplot(dados[MISTO != "Simples"], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(dados[MISTO != "Simples"], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[MISTO != "B", .(SEXO, MISTO, MISTO)], MISTO, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[, .(SEXO, MISTO, MISTO)], MISTO, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ggtitle("Casos positivos")

# ggsave("figures/MISTO_pos_lat.png")

ggplot(dados[MISTO == TRUE], aes(SEXO, MISTO)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/MISTO_sex_lat.png")

ggplot(dados[MISTO == TRUE], aes(GRUPO, MISTO)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = GRUPO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Dor") +
  ylab("Participantes")
ggsave("figures/MISTO_dor_lat.png")

# gg.bar.freq <- scale_y_continuous(limits = c(0, ceiling(nrow(impacto)/10)*10)) +
#   theme(legend.position = "bottom", legend.title = element_blank()) +
#   ylab("Participantes")
# gg.bar.prop <- scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

# ggplot(impacto, aes(SEXO)) +
#   ggtitle("Impacto CAM") +
#   geom_bar(aes(fill = CAM), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(impacto)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
#   xlab("Gênero") + ylab("Participantes")

ggplot(dados[CAM == TRUE], aes(SEXO)) +
  ggtitle("Impacto CAM") +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
  xlab("Gênero") + ylab("Participantes")

# ggplot(impacto, aes(CAM)) +
#   ggtitle("Impacto CAM") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

# ggplot(impacto, aes(CAM)) +
#   ggtitle("Impacto CAM") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

ggsave("figures/CAM_sex.png")

# ggplot(impacto, aes(SEXO)) +
#   ggtitle("Impacto PINCER") +
#   geom_bar(aes(fill = PINCER), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(impacto)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
#   xlab("Gênero") + ylab("Participantes")

ggplot(dados[PINCER == TRUE], aes(SEXO)) +
  ggtitle("Impacto PINCER") +
  # geom_bar(aes(y = (..count..)/sum(..count..), fill = PINCER), position = "dodge") +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
  xlab("Gênero") + ylab("Participantes")

# ggplot(impacto, aes(PINCER)) +
#   ggtitle("Impacto PINCER") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

# ggplot(impacto, aes(PINCER)) +
#   ggtitle("Impacto PINCER") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

ggsave("figures/PINCER_sex.png")

# ggplot(impacto, aes(SEXO)) +
#   ggtitle("Impacto MISTO") +
#   geom_bar(aes(fill = MISTO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(impacto)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
#   xlab("Gênero") + ylab("Participantes")

ggplot(dados[MISTO == TRUE], aes(SEXO)) +
  ggtitle("Impacto MISTO") +
  # geom_bar(aes(y = (..count..)/sum(..count..), fill = MISTO), position = "dodge") +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Impacto") +
  xlab("Gênero") + ylab("Participantes")

# ggplot(impacto, aes(MISTO)) +
#   ggtitle("Impacto MISTO") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

# ggplot(impacto, aes(MISTO)) +
#   ggtitle("Impacto MISTO") +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   xlab("") + ylab("Participantes")

ggsave("figures/MISTO_sex.png")

library(tidyr)
# impacto.m <- gather(impacto[, 2:6], TIPO, IMPACTO, CAM, PINCER, MISTO)
# impacto.m$IMPACTO <- factor(impacto.m$IMPACTO)
# levels(impacto.m$IMPACTO) <- c("Ausente", "Presente", "Presente", "Presente", "Ausente")
# impacto.m$TIPO <- factor(impacto.m$TIPO, levels = c("CAM", "PINCER", "MISTO"))
# 
# impacto.m.lat <- gather(dados[, 2:6], TIPO, IMPACTO, CAM, PINCER, MISTO)
# impacto.m.lat$IMPACTO <- factor(impacto.m.lat$IMPACTO)
# levels(impacto.m.lat$IMPACTO) <- c("B", "D", "E", "N", "N")
# impacto.m.lat$IMPACTO <- relevel(impacto.m.lat$IMPACTO, "N")
# impacto.m.lat$TIPO <- factor(impacto.m.lat$TIPO, levels = c("CAM", "PINCER", "MISTO"))

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
