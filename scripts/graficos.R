source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)
ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom")

ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `CAM D`)) +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `CAM D`))

ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `PINCER D`)) +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `PINCER D`))

ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `MISTO D`)) +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `MISTO D`))

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`)) +
  geom_point(aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) + theme(legend.position = "bottom") +
  # geom_smooth(method = "lm", se = F, mapping = aes(col = `LADO DOR`)) +
  geom_smooth(method = "lm", col = "black")


# SEPARADO POR IMPACTO
ggplot(dados, aes(`ALFA D`, `TORÇÃO D`)) +
  geom_point(aes(`ALFA D`, `TORÇÃO D`, col = `IMPACTO D`, shape = `IMPACTO D`)) + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `IMPACTO D`)) +
  geom_smooth(method = "lm", col = "black")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom") +
  # geom_smooth(method = "lm", col = "black") +
  geom_smooth(method = "lm", se = F)

# ggplot(gather(dados[, .(SEXO, `IMPACTO D`, `IMPACTO E`)], LADO, IMPACTO, `IMPACTO D`, `IMPACTO E`, -SEXO), aes(IMPACTO)) + geom_bar(aes(fill = SEXO))
# ggplot(dados, aes(`IMPACTO D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`IMPACTO E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`CAM D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`CAM E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`PINCER D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`PINCER E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`MISTO D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
# ggplot(dados, aes(`MISTO E`)) + geom_bar(aes(fill = SEXO), position = "dodge")

ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
ggplot(dados, aes(CAM)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
# ggsave("figures/CAM.png")

ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
ggplot(dados, aes(PINCER)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggsave("figures/PINCER.png")

ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO)) + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ylab("Participantes")
ggplot(dados, aes(MISTO)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
ggplot(dados, aes(MISTO)) + geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) + scale_y_continuous(labels = percent, limits = c(0, 1)) + ylab("Participantes")
# ggsave("figures/MISTO.png")

# ggplot(impacto.lat[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos1.png")

# ggplot(impacto.lat[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos2.png")

# ggplot(impacto.lat[CAM != "N"], aes(CAM)) +
#   geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO), position = "dodge") +
#   scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")
# ggsave("figures/CAM_pos3.png")

ggplot(impacto.lat, aes(CAM)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/CAM_sex_lat.png")

ggplot(impacto.lat, aes(CAM)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = DOR)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Dor") +
  ylab("Participantes")
ggsave("figures/CAM_dor_lat.png")
  
# ggplot(data.table(gather(dados[, .(SEXO, `CAM D`, `CAM E`)], CAM, IMPACTO, -SEXO))[IMPACTO == "CAM"], aes(CAM)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggsave("figures/CAM_pos.png")

# ggplot(impacto.lat[PINCER != "N"], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggplot(impacto.lat[PINCER != "N"], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[PINCER %in% c("D", "E"), .(SEXO, `PINCER D`, `PINCER E`)], PINCER, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(PINCER)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ylab("Participantes") + ggtitle("Casos positivos")

# ggsave("figures/PINCER_pos.png")

ggplot(impacto.lat, aes(PINCER)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/PINCER_sex_lat.png")

ggplot(impacto.lat, aes(PINCER)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = DOR)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Dor") +
  ylab("Participantes")
ggsave("figures/PINCER_dor_lat.png")

# ggplot(impacto.lat[MISTO != "Simples"], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(impacto.lat[MISTO != "Simples"], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[MISTO != "B", .(SEXO, `MISTO D`, `MISTO E`)], MISTO, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(MISTO)) +
#   geom_bar(aes(fill = SEXO)) +
#   scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) +
#   theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
#   ggtitle("Casos positivos")

# ggplot(data.table(gather(dados[, .(SEXO, `MISTO D`, `MISTO E`)], MISTO, IMPACTO, -SEXO))[IMPACTO == TRUE], aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0, ceiling(nrow(dados)/10)*10)) + ggtitle("Casos positivos")

# ggsave("figures/MISTO_pos_lat.png")

ggplot(impacto.lat, aes(MISTO)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = SEXO)) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  theme(legend.position = "bottom") + scale_fill_discrete(name = "Genero") +
  ylab("Participantes")
ggsave("figures/MISTO_sex_lat.png")

ggplot(impacto.lat, aes(MISTO)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = DOR)) +
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

ggplot(impacto, aes(SEXO)) +
  ggtitle("Impacto CAM") +
  # geom_bar(aes(y = (..count..)/sum(..count..), fill = CAM), position = "dodge") +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = CAM)) +
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

ggplot(impacto, aes(SEXO)) +
  ggtitle("Impacto PINCER") +
  # geom_bar(aes(y = (..count..)/sum(..count..), fill = PINCER), position = "dodge") +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = PINCER)) +
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

ggplot(impacto, aes(SEXO)) +
  ggtitle("Impacto MISTO") +
  # geom_bar(aes(y = (..count..)/sum(..count..), fill = MISTO), position = "dodge") +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = MISTO)) +
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

impacto.m <- gather(impacto[, 2:6], TIPO, IMPACTO, CAM, PINCER, MISTO)
impacto.m$IMPACTO <- factor(impacto.m$IMPACTO)
levels(impacto.m$IMPACTO) <- c("Ausente", "Presente", "Presente", "Presente", "Ausente")
impacto.m$TIPO <- factor(impacto.m$TIPO, levels = c("CAM", "PINCER", "MISTO"))

impacto.m.lat <- gather(impacto.lat[, 2:6], TIPO, IMPACTO, CAM, PINCER, MISTO)
impacto.m.lat$IMPACTO <- factor(impacto.m.lat$IMPACTO)
levels(impacto.m.lat$IMPACTO) <- c("B", "D", "E", "N", "N")
impacto.m.lat$IMPACTO <- relevel(impacto.m.lat$IMPACTO, "N")
impacto.m.lat$TIPO <- factor(impacto.m.lat$TIPO, levels = c("CAM", "PINCER", "MISTO"))

ggplot(impacto.m, aes(IMPACTO, fill = SEXO)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ TIPO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .3)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_sex.png")

ggplot(impacto.m, aes(IMPACTO, fill = DOR)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ TIPO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .3)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_dor.png")

ggplot(impacto.m.lat, aes(IMPACTO, fill = SEXO)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ TIPO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .3)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_sex_lat.png")

ggplot(impacto.m.lat, aes(IMPACTO, fill = DOR)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + facet_grid(~ TIPO) +
  scale_y_continuous(labels = scales::percent, limits = c(0, .3)) +
  xlab("") + ylab("") +
  theme(legend.position = "bottom")
ggsave("figures/painel_dor_lat.png")
