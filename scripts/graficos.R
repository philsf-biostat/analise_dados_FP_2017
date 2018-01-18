library(ggplot2)
ggplot(dados, aes(`ALFA D`, `TORÇÃO D`, col = `LADO DOR`)) + geom_point() + theme(legend.position = "bottom")

ggplot(dados, aes(`ALFA E`, `TORÇÃO E`, col = `LADO DOR`)) + geom_point() + theme(legend.position = "bottom")
