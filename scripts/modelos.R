summary(lm(`TORÇÃO D` ~ `ALFA D` + `LADO DOR` - 1, data = dados))
summary(lm(`TORÇÃO E` ~ `ALFA E` + `LADO DOR` - 1, data = dados))

summary(lm(`TORÇÃO D` ~ `ALFA D` + `LADO DOR`, data = dados))
summary(lm(`TORÇÃO E` ~ `ALFA E` + `LADO DOR`, data = dados))


# correlação sem filtro ---------------------------------------------------

with(dados, cor.test(`TORÇÃO D` , `ALFA D`))
with(dados, cor.test(`TORÇÃO E` , `ALFA E`))


# correlação com filtro de lateralidade -----------------------------------

with(dados[`LADO DOR` %in% c("D", "B")], cor.test(`TORÇÃO D` , `ALFA D`))
with(dados[`LADO DOR` %in% c("E", "B")], cor.test(`TORÇÃO E` , `ALFA E`))
