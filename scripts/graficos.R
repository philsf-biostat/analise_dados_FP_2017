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
  geom_smooth(method = "lm", se = F, mapping = aes(col = `IMPACTO D`, shape = `IMPACTO D`)) +
  geom_smooth(method = "lm", col = "black")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom") +
  # geom_smooth(method = "lm", col = "black") +
  geom_smooth(method = "lm", se = F)

ggplot(dados, aes(`IMPACTO D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`IMPACTO E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`CAM D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`CAM E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`PINCER D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`PINCER E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`MISTO D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`MISTO E`)) + geom_bar(aes(fill = SEXO), position = "dodge")

ggplot(dados, aes(CAM)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0,nrow(dados)))
ggsave("figures/CAM.png")
ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0,nrow(dados)))
ggsave("figures/PINCER.png")
ggplot(dados, aes(MISTO)) + geom_bar(aes(fill = SEXO), position = "dodge") + scale_y_continuous(limits = c(0,nrow(dados)))
ggsave("figures/MISTO.png")
