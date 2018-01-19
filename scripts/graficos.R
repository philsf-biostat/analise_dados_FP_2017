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
