source("scripts/graficos.R")

ggsave("figures/impacto_freq.png", bar.imp, h = 4.1, w = 4.1)
ggsave("figures/painel_sex_grupo.png", bar.imp.sex.grupo, h = 4.1, w = 4.1)
ggsave("figures/painel_AlfTor_global.png", alftor.global, h = 4.1, w = 4.1)
ggsave("figures/painel_AlfTor_grupo.png", alftor.grupo, h = 4.1, w = 5.5)
ggsave("figures/painel_AlfTor_imp_grupo.png", alftor.imp.grupo, h = 4.1, w = 5.5)

# ggsave("figures/torcao_impacto.png", tor.imp, h = 4.1, w = 4.1)
# ggsave("figures/painel_AlfTor_grupo_imp.png", alftor.grupo.imp, h = 4.1, w = 4.1)
# ggsave("figures/painel_AlfTor_grupo_imp_full.png", alftor.grupo.imp.full, h = 4.1, w = 4.1)
