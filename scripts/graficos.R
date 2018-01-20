source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)
ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom")



ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `LADO DOR`))

ggplot(dados, aes(`ALFA D`, `TORÇÃO D`)) +
  geom_point(aes(`ALFA D`, `TORÇÃO D`, col = `LADO DOR`)) + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, mapping = aes(col = `LADO DOR`)) +
  geom_smooth(method = "lm", col = "black")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) +
  geom_point() + theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F)

ggplot(dados, aes(`CAM D`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(`CAM E`)) + geom_bar(aes(fill = SEXO), position = "dodge")
ggplot(dados, aes(PINCER)) + geom_bar(aes(fill = SEXO), position = "dodge")
