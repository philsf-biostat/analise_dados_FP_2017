source('scripts/input.R', encoding = 'UTF-8')

library(ggplot2)

# set.seed(1)

# alftor <- ggplot(dados, aes(ALFA, TORCAO, col = GRUPO)) +
#   geom_point() + theme(legend.position = "bottom") +
#   # geom_smooth(method = "lm", se = F)
#   geom_smooth(method = "lm", se = F, mapping = aes(col = GRUPO))
# ggsave("figures/AlfTor_grupo.png")

# tor.imp <- ggplot(dados.impacto, aes(IMPACTO, TORCAO, col = IMPACTO)) +
#   geom_hline(yintercept = c(5, 25), lty = 4, col = "red") +
#   geom_boxplot() + geom_jitter(height = 0.01, width = .05, alpha = .4) +
#   xlab("Tipo de impacto") + ylab("Ângulo de torção") +
#   theme(legend.position = "none")

# alftor.var <- ggplot(tidyr::gather(dados.impacto[,.(TORCAO, ALFA)], Angulo, Valor), aes(Angulo, Valor)) +
#   # geom_hline(yintercept = c(5, 25), lty = 4, col = "red") +
#   geom_boxplot() + geom_jitter(height = 0.01, width = .05, alpha = .4) +
#   ggtitle("Variabilidade dos ângulos alfa e torção femoral") +
#   xlab("Ângulo alfa") + ylab("Ângulo de torção") +
#   theme(legend.position = "none")

alftor.global <- ggplot(dados, aes(ALFA, TORCAO)) +
  theme(legend.position = "bottom") +
  xlab("Ângulo alfa") + ylab("Ângulo de torção") +
  geom_point() +
  # geom_point(aes(col = IMPACTO)) + # protótipo, col por impacto
  geom_smooth(method = "lm", se = FALSE)

alftor.grupo <- alftor.global + facet_grid(~ GRUPO)

# alftor.grupo.imp <- ggplot(dados.impacto, aes(ALFA, TORCAO, col = GRUPO)) +
#   theme(legend.position = "bottom", legend.title = element_blank()) +
#   xlab("Ângulo alfa") + ylab("Ângulo de torção") +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) +
#   facet_grid(~ IMPACTO)

# alftor.grupo.imp.full <- ggplot(dados.impacto, aes(ALFA, TORCAO)) +
#   theme(legend.position = "bottom", legend.title = element_blank()) +
#   xlab("Ângulo alfa") + ylab("Ângulo de torção") +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) +
#   facet_grid(IMPACTO ~ GRUPO, margins = "IMPACTO")

alftor.imp.grupo <- ggplot(dados.impacto, aes(ALFA, TORCAO, col = IMPACTO)) +
  # theme_bw() +
  theme(legend.position = "bottom", legend.title = element_blank()) +
  xlab("Ângulo alfa") + ylab("Ângulo de torção") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # scale_color_brewer(palette = "Paired") +
  facet_grid(~ GRUPO)

# ggplot(dados.impacto, aes(IMPACTO)) +
#   ggtitle("Impactos por gênero") +
#   ylab("Participantes") +
#   geom_bar(aes(fill = SEXO), position = "dodge") +
#   theme(legend.position = "bottom")
# ggsave("figures/impacto_sex.png")

# ggplot(dados.impacto, aes(IMPACTO, fill = SEXO)) +
#   ggtitle("Impactos por gênero") +
#   ylab("Participantes") +
#   geom_bar(aes(y = (..count..)/sum(..count..))) + #facet_grid(~ TIPO) +
#   scale_y_continuous(labels = scales::percent, limits = c(0, .5)) +
#   xlab("") + ylab("") +
#   theme(legend.position = "bottom")
# ggsave("figures/impacto_sex.png")

bar.imp.sex.grupo <- ggplot(dados.impacto, aes(IMPACTO, fill = GRUPO)) +
  # ggtitle("Impactos por gênero") +
  geom_bar() + facet_grid(~ SEXO) +
  scale_y_continuous(limits = c(0, 20)) +
  xlab("") + ylab("N") +
  theme(legend.position = "bottom", legend.title = element_blank())

bar.imp <- ggplot(dados.impacto, aes(IMPACTO)) +
  geom_bar() +
  xlab("") + ylab("Quadris por tipo de impacto (N = 50)") +
  theme(legend.position = "bottom")
