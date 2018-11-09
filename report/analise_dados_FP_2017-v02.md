---
title: "Análise de dados de medidas de ângulos de torção femoral e impactos fêmoro-acetabulares"
author: '**De:** Felipe Figueiredo **Para:** Fernando Pina Cabral'
date: '**Data: ** dd/mm/aaaa'
output:
  html_document:
    fig_caption: yes
    fig_height: 6
    fig_width: 6
    keep_md: yes
    number_sections: yes
    toc: yes
  pdf_document:
    number_sections: yes
    toc: yes
  word_document:
    fig_caption: yes
    fig_height: 6
    fig_width: 6
    reference_docx: misc/style.docx
    toc: yes
subtitle: 'CÓDIGO: analise_dados_FP_2017-v02'
toc-title: "Sumário"
---



---

**Histórico do documento**


| Versão |                    Alterações                    |
|:------:|:------------------------------------------------:|
|   01   |                  Versão inicial                  |
|   02   | Análise qualitativa da torção femoral e impactos |

---

# Lista de abreviaturas

- CV -- Coeficiente de Variação
- DP -- Desvio padrão
- IC -- Intervalo de Confiança
- RC -- Razão de Chances
- r -- coeficiente de correlação linear de Pearson
- r2 -- Coeficiente de determinação

# Introdução

# Metodologia

## Algoritmo de classificação dos impactos nos quadris

As medidas obtidas por avaliação clínica e radiológica foram utilizadas para classificar sistematicamente o tipo de impacto.
Os três tipos de impacto (CAM, PINCER e MISTO) foram determinados a partir das mensurações obtidas, conforme os seguintes critérios:

- Impacto do tipo CAM
    - ângulo alfa maior que 50 graus.
- Impacto do tipo PINCER
    - índice acetabular negativo;
    - ângulo centro-borda acetabular maior que 39 graus;
    - índice de extrusão menor que 10 graus.
- Impacto do tipo MISTO
    - Identificação simultânea de impacto CAM e PINCER

As mensurações foram obtidas de forma independente para o quadril direito e esquerdo de cada participante (N = 26).
Com isso, estes critérios foram aplicados a cada quadril (N = 52).
Assim, um paciente com impacto CAM em um lado e PINCER no outro não teve classificação de impacto MISTO em nenhum dos lados.

### Exceções

Três participantes não tiveram todas as mensurações obtidas, o que inviabilizou a classificação de CAM ou PINCER com a metodologia acima descrita.
Estas exceções foram tratadas caso a caso, conforme descrito a seguir.

**CAM**

Um participante não teve seu ângulo alfa mensurado no lado direito, ele foi diagnosticado clinicamente como não possuindo impacto CAM.

**PINCER**

Um segundo participante não teve seu ângulo centro-borda acetabular mensurado no lado direito, e seu diagnóstico clínico foi de que não possuía PINCER.

Um terceiro participante não teve seus índices de extrusão mensurados em ambos os lados.
Seu diagnóstico clínico foi de que possuía PINCER apenas no quadril esquerdo.

## Análises estatísticas

Todas as análises foram realizadas utilizando-se o software `R` versão 3.4.4 (https://www.r-project.org/).
O critério de significância estatística foi p-valor < 0.05.

### Análise descritiva

As variáveis categóricas foram avaliadas quanto às suas ocorrências, sendo apresentadas em frequência e porcentagem.
As variáveis contínuas foram descritas com média e desvio padrão.
Para avaliar a diferença entre as variabilidades observadas no ângulo de torção femoral e no ângulo alfa, calculamos seus respectivos coeficientes de variação (desvio padrão relativo).

### Impactos fêmoro-acetabulares

As diferenças entre as ocorrências dos impactos foi testada com teste de proporções.
Associações entre duas variáveis categóricas foram avaliadas usando-se modelos de regressão logística, e apresentamos a razão de chance (RC) e o intervalo de confiança (IC) das variáveis comparadas.

### Torção femoral

As diferenças médias entre dois grupos de medidas foram avaliadas com o teste t de Student.

Avaliamos a associação entre o ângulo de torção femoral e o ângulo alfa com a correlação linear de Pearson e regressão linear simples.

<!-- Além dos testes de significância, diversos modelos estatísticos foram criados para avaliar hipóteses sobre a relação entre os desfechos de interesse e os ângulos mensurados, como torção. -->

<!-- Para avaliar se a dor ou o tipo de impacto influencia a relação entre o ângulo de torção femoral e o ângulo foi usado um modelo de regressão linear múltipla. -->
<!-- Esta abordagem permite investigar se estes fatores contribuem para a percepção do efeito observado, globalmente, na correlação e na regressão linear simples. -->

<!-- ### Quadris com ângulo de torção femoral alterada -->

<!-- Para as hipóteses em que o desfecho era uma variável categórica binária, foi utilizado o modelo de regressão logística. -->
<!-- Quando o desfecho era uma variável categórica com 3 ou mais categorias, como por exemplo o lado doloroso (direito, esquerdo ou bilateral) usou-se o modelo de regressão multinomial. -->

<!-- Esta estratégia de modelagem permite estimar a Razão de Chance de uma determinada combinação de fatores e medidas afetar a probabilidade de trocar de uma categoria para outra. -->
<!-- Por exemplo, o tipo de impacto que o participante apresenta pode aumentar a chance do participante sentir dor naquele lado, mas isso pode ocorrer de forma diferenciada para cada gênero, ou ser influenciada pelo ângulo de torção, IMC, etc. -->
<!-- Assim é possível controlar o efeito observado por outros fatores que possam estar relacionados. -->

# Resultados



## Análise descritiva

A Tabela 1 apresenta as características gerais dos participantes do estudo.


|        &nbsp;         | level |    Overall    |
|:---------------------:|:-----:|:-------------:|
|         **n**         |       |      26       |
| **IDADE (mean (sd))** |       | 35.00 (6.70)  |
|  **IMC (mean (sd))**  |       | 24.02 (4.15)  |
|     **SEXO (%)**      |   F   |   7 (26.9)    |
|                       |   M   |   19 (73.1)   |
|  **HHS (mean (sd))**  |       | 67.12 (13.25) |

Table: **Tabela 1** Descrição dos participantes do estudo (N = 26).
sd = Desvio padrão,
IMC = Índice de massa corpórea,
HHS = Harris hip score (modificado).
<!-- p = teste t de Student para variáveis contínuas, e teste exato de Fisher para DOR. -->

O IMC médio dos homens é significativamente maior que o das mulheres.
A idade média, lado doloroso e o Harris Hip Score dos participantes de cada gênero apresentou boa homogeneidade quanto aos gêneros.

A tabela 2 mostra as mensurações obtidas dos quadris classificados quanto aos grupos Doloroso e Controle.


|         &nbsp;         |   Controle    |   Doloroso    |   p   |
|:----------------------:|:-------------:|:-------------:|:-----:|
|         **n**          |      17       |      35       |       |
| **TORCAO (mean (sd))** | 14.76 (8.07)  | 14.49 (9.61)  | 0.918 |
|  **ALFA (mean (sd))**  | 53.25 (11.80) | 62.43 (13.55) | 0.024 |
|   **IA (mean (sd))**   |  0.94 (4.90)  |  1.06 (5.06)  | 0.938 |
|  **ACB (mean (sd))**   | 32.62 (9.06)  | 33.63 (7.97)  | 0.691 |
|   **IE (mean (sd))**   | 16.76 (13.91) | 13.67 (10.65) | 0.385 |

Table: **Tabela 2** Descrição das mensurações avaliadas e os tipos de impacto em cada grupo.
sd = Desvio padrão,
ALFA = ângulo alfa,
IA = índice acetabular,
ACB = ângulo centro-borda acetabular,
IE = índice de extrusão.
p = teste t de Student.

Observou-se que, na média, o ângulo alfa é aproximadamente 10 graus maior nos quadris dolorosos que nos quadris controle.
As outras mensurações são, na média, semelhantes em ambos os grupos.

A tabela 3 mostra a variabilidade relativa do ângulo de torção e do ângulo alfa, expressas em CV (coeficiente de variação), avaliados por grupo de estudo.
Observa-se que há grande diferença entre o CV do ângulo de torção (CV em torno de 60% tanto nos quadris dolorosos e nos quadris controle) e ângulo alfa (CV em torno 22% em ambos os grupos estudados).
Veremos o impacto desta diferença, na seção 4.3.2.


|  GRUPO   | %CV TORCAO | %CV ALFA |
|:--------:|:----------:|:--------:|
| Doloroso |   66.4%    |  21.7%   |
| Controle |   54.7%    |  22.2%   |

Table: **Tabela 3** Variabilidades relativas (%CV) do ângulo de torção femoral e do ângulo alfa em cada grupo de estudo.

## Impactos fêmoro-acetabulares

### Ocorrência dos tipos de impacto fêmoro-acetabular

A figura 38 mostra a frequência com que cada tipo de impacto ocorreu nos quadris estudados.

![**Figura 38** Número de quadris com cada tipo de impacto fêmoro-acetabular, sendo dividivos quanto ao tipo de impacto (N total de quadris = 50).](../figures/impacto_freq.png)

Os três tipos de impactos parecem ocorrer com proporções semelhantes
(p = 0.432, teste de homogeneidade de proporções)
.

<!-- Uma hipótese na literatura é de que a ocorrência de MISTO (CAM+PINCER) é o mais comum. -->
<!-- Isto não foi observado neste estudo. -->
<!-- Quadris com impacto MISTO por outro lado são significativamente menores que os impactos CAM -->
<!-- (p = ) -->
<!-- e PINCER -->
<!-- (p = ) -->
<!-- . -->
<!-- Os quadris com impacto MISTO são os menos frequentes na amostra aqui estudada. -->

### Associação da ocorrência do impacto fêmoro-acetabular por gênero e por grupo de estudo

Avaliamos a diferença entre as prevalências dos impactos do tipo CAM e Pincer em cada um dos gêneros (Tabela 4).


| &nbsp; | CAM | MISTO | PINCER |
|:------:|:---:|:-----:|:------:|
| **F**  |  1  |   5   |   8    |
| **M**  | 19  |  11   |   6    |

Table: **Tabela 4** Frequências observadas para os impactos por gênero.

Tomando o gênero feminino como referência, criamos um modelo de regressão logística para a razão de chance do gênero masculino apresentar cada tipo de impacto (Tabela 5).
Nossos dados indicam que impacto do tipo CAM realmente acomete mais homens que mulheres.
Em nossa amostra, o CAM é
19.00
vezes mais frequente em homens que em mulheres
(RC: 19.00, IC: [2.54, 141.91])
.
Não há evidências em nossa amostra de que há diferença entre homens e mulheres nas ocorrências de impacto do tipo Pincer
(IC: [0.26, 2.16])
, nem impacto do tipo Misto
(IC: [0.76, 6.33])
.


|    &nbsp;    |  RC   |       IC       |
|:------------:|:-----:|:--------------:|
|  **CAM M**   | 19.00 | [2.54, 141.91] |
| **MISTO M**  | 2.20  |  [0.76, 6.33]  |
| **PINCER M** | 0.75  |  [0.26, 2.16]  |

Table: **Tabela 5** Regressão logística entre os tipos de impacto e o gênero.

Analisamos também a relação da dor com cada tipo de impacto (Tabela 6).


|    &nbsp;    | CAM | MISTO | PINCER |
|:------------:|:---:|:-----:|:------:|
| **Controle** |  6  |   2   |   7    |
| **Doloroso** | 14  |  14   |   7    |

Table: **Tabela 6** Frequências observadas para os impactos por grupo.

Tomando o grupo Controle como referência, criamos um modelo de regressão logística para a razão de chance do grupo Doloroso apresentar cada tipo de impacto (Tabela 7).
Observamos que a presença do impacto do tipo Misto foi
7.00
vezes mais frequente nos quadris dolorosos
(RC: 7.00, IC: [1.59, 30.80])
que no grupo controle.
Não houve diferença significativa nas ocorrências para CAM
(IC: [0.90, 6.07])
e Pincer
(IC: [0.35, 2.85])
.


|       &nbsp;        |  RC  |      IC       |
|:-------------------:|:----:|:-------------:|
|  **CAM Doloroso**   | 2.33 | [0.90, 6.07]  |
| **MISTO Doloroso**  | 7.00 | [1.59, 30.80] |
| **PINCER Doloroso** | 1.00 | [0.35, 2.85]  |

Table: **Tabela 7** Regressão logística entre os tipos de impacto e o grupo.

A figura 39 mostra os resultados de ambas as análises.

![**Figura 39** Número de quadris estratificados por gênero e por grupo de estudo com diferentes tipos de impacto fêmoro-acetabular e manifestações clínicas (N = 50).](../figures/painel_sex_grupo.png)

## Torção femoral

### Associação entre a torção femoral e os tipos de impacto fêmoro-acetabular



A torção média dos quadris dolorosos que possuem impacto do tipo CAM não apresentou diferença estatisticamente significativa quando comparada com os quadris controle
(p= 0.234)
.
Já no impacto tipo Pincer, a torção média dos quadris dolorosos foi de
16.63
graus, enquanto que a torção média dos controles foi de
11.77
graus
(p= 0.0455)
.
A torção média dos quadris dolorosos que possuem impacto do tipo Misto não foi significativa quando comparada com os controles
(p= 0.314)
.

### Correlação entre a torção femoral e o ângulo alfa

Na avaliação global dos quadris estudados, o ângulo de torção demonstrou ser inversamente proporcional ao ângulo alfa
(r = -0.30
,
p = 0.0364, teste de correlação)
,
como podemos observar na reta de regressão que associa as mensurações destes ângulos (figura 40).

<!-- [FIXME: observar que esta correlação é global] -->

![**Figura 40** Regressão linear entre torção femoral e o ângulo alfa.](../figures/painel_AlfTor_global.png)

O modelo de regressão linear apresentado na figura 40 representa como o ângulo de torção femoral varia em função do ângulo alfa.
Para cada aumento de um grau no ângulo alfa, há uma diminuição de aproximadamente
0.20
graus no ângulo de torção
(p = 0.036, teste t de Student)
.
O ângulo alfa sozinho, no entanto, explica apenas $r^2=$
9.0%
da variabilidade observada no ângulo de torção femoral.
Considerando cada grupo de estudo (quadris dolorosos e quadris controle), este resultado é inconsistente.
O ângulo de torção é negativamente correlacionado com o ângulo alfa
(r = -0.65
,
p = 0.0117, teste de correlação)
no grupo controle, mas a correlação não é significativa no grupo de quadris dolorosos
(r = -0.21
,
p = 0.233, teste de correlação)
(Figura 41).
Sob a hipótese de uma associação linear entre o ângulo de torção femoral como função do ângulo alfa, ajustaram-se modelos de regressão linear para cada grupo.
A correlação negativa tem efeito menos marcante no grupo de quadris dolorosos que no grupo controle.
Controlando pelo grupo de estudo, a associação permanece significativamente negativa no grupo controle
(p = 0.012, teste t de Student)
.
Este modelo indica que para cada aumento de um grau no ângulo alfa, há uma diminuição de aproximadamente
0.39
graus no ângulo de torção.
Uma relação linear não pode mais ser detectada no grupo de quadris dolorosos
(p = 0.23, teste t de Student)
.

![**Figura 41** Regressões lineares entre o ângulo de torção femoral e o ângulo alfa, para cada grupo de estudo (quadris dolorosos e quadris controle).](../figures/painel_AlfTor_grupo.png)

<!-- ```{r echo=FALSE, warning=FALSE, fig.cap="**Figura xx** Correlação entre Torção e Alfa, por grupo"} -->
<!-- alftor.grupo.imp -->
<!-- ``` -->

Quando controlamos a análise pelo tipo de impacto, não foi possível identificar associação com o ângulo de torção.
Isto pode ter sido afetado pela diferença entre as variabilidades relativas entre o ângulo de torção (CV aproximado 60%) e o ângulo alfa (CV aproximado 22%) (Figura 42).

<!-- FIXME: mover para a DISCUSSÃO -->
<!-- Esta aparente correlação negativa no grupo controle parece ter sido afetada pelo baixo número de pacientes com impacto misto - há apenas 2 pacientes nesta categoria. -->
<!-- Isto impede uma estimativa representativa para este cenário em particular, e perturba a estimativa o modelo global. -->

<!-- Obs: na verdade, retirar todos os pacientes MISTO não impacta nos resultados e conclusões. -->

![**Figura 42** Regressões lineares entre o ângulo de torção femoral e o ângulo alfa, para cada grupo de estudo (quadris dolorosos e quadris controle e para cada tipo de impacto fêmoro-acetabular.](../figures/painel_AlfTor_imp_grupo.png)

<!-- ### Quadris com ângulo de torção femoral alterada -->

<!-- FIXME: Análise qualitativa -->

<!-- - torção femoral alterada x tipos de impacto (regressão logística) -->
<!-- - tipos de alteração de torção x tipos de impacto (regressão multinomial) -->

# Conclusões

# Referências

# Apêndice

