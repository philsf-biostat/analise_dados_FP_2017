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

# Introdução

## Objetivos

## Recepção e tratamento dos dados

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

As diferenças entre as ocorrências dos impactos foi testada com teste de proporções, aplicando a correção de múltiplos p-valores de Bonferroni.
Associações entre duas variáveis categóricas foram avaliadas usando-se o teste exato de Fisher, e apresentamos a razão de chance das associações significativas.

### Torção femoral

As diferenças médias entre dois grupos de medidas foram avaliadas com o teste t de Student.

Avaliamos a associação entre o ângulo de torção femoral e o ângulo alfa com a correlação linear de Pearson e regressão linear simples.

<!-- Além dos testes de significância, diversos modelos estatísticos foram criados para avaliar hipóteses sobre a relação entre os desfechos de interesse e os ângulos mensurados, como torção. -->

Para avaliar se a dor ou o tipo de impacto influencia a relação entre o ângulo de torção femoral e o ângulo foi usado um modelo de regressão linear múltipla.
Esta abordagem permite investigar se estes fatores contribuem para a percepção do efeito observado, globalmente, na correlação e na regressão linear simples.

<!-- ### Quadris com ângulo de torção femoral alterada -->

<!-- Para as hipóteses em que o desfecho era uma variável categórica binária, foi utilizado o modelo de regressão logística. -->
<!-- Quando o desfecho era uma variável categórica com 3 ou mais categorias, como por exemplo o lado doloroso (direito, esquerdo ou bilateral) usou-se o modelo de regressão multinomial. -->

<!-- Esta estratégia de modelagem permite estimar a Razão de Chance de uma determinada combinação de fatores e medidas afetar a probabilidade de trocar de uma categoria para outra. -->
<!-- Por exemplo, o tipo de impacto que o participante apresenta pode aumentar a chance do participante sentir dor naquele lado, mas isso pode ocorrer de forma diferenciada para cada gênero, ou ser influenciada pelo ângulo de torção, IMC, etc. -->
<!-- Assim é possível controlar o efeito observado por outros fatores que possam estar relacionados. -->

# Resultados



## Análise descritiva

A Tabela 1 apresenta as características gerais dos participantes do estudo.


|        &nbsp;         | level |       F       |       M       |   p    |
|:---------------------:|:-----:|:-------------:|:-------------:|:------:|
|         **n**         |       |       7       |      19       |        |
| **IDADE (mean (sd))** |       | 35.00 (6.38)  | 35.00 (6.98)  | 1.000  |
|  **IMC (mean (sd))**  |       | 19.54 (2.44)  | 25.67 (3.36)  | <0.001 |
|      **DOR (%)**      |   D   |   4 ( 57.1)   |   9 ( 47.4)   | 0.415  |
|                       |   E   |   0 (  0.0)   |   4 ( 21.1)   |        |
|                       |   B   |   3 ( 42.9)   |   6 ( 31.6)   |        |
|  **HHS (mean (sd))**  |       | 73.71 (14.58) | 64.68 (12.23) | 0.125  |

Table: **Tabela 1** Descrição dos participantes do estudo (N = 26).
sd = Desvio padrão,
IMC = Índice de massa corpórea,
HHS = Harris hip score (modificado),
p = teste t de Student para variáveis contínuas, e teste exato de Fisher para DOR.

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

A figura 32 mostra a frequência com que cada tipo de impacto ocorreu nos quadris estudados.

![**Figura 32** Número de quadris com cada tipo de impacto fêmoro-acetabular (N total de quadris = 52)](../figures/impacto_freq.png)



Os impactos do tipo CAM e PINCER parecem ocorrer com frequências semelhantes (p = 0.9258).

Uma hipótese na literatura é de que a ocorrência de MISTO (CAM+PINCER) é o mais comum.
Isto não foi observado neste estudo.
Quadris com impacto MISTO por outro lado são significativamente menores que os impactos CAM (p = <0.001) e PINCER (p = 0.0308).
Os quadris com impacto MISTO são os menos frequentes na amostra aqui estudada.

### Associação da ocorrência do impacto fêmoro-acetabular por gênero e por grupo de estudo



Os impactos ocorreram de forma diferenciada por gênero (p = 0.00266).
Avaliamos a diferença entre as prevalências dos impactos do tipo CAM e Pincer em cada um dos gêneros.
A prevalência do impacto tipo CAM foi maior no gênero masculino e o impacto do tipo Pincer foram observados principalmente em indivíduos do gênero feminino.
Tomando o gênero feminino como referência, demostramos os resultados relativos para os homens.
Nossos dados indicam que impacto do tipo CAM realmente acomete mais homens.
Em nossa amostra, o CAM é 3.8 vezes mais frequente em homens que em mulheres (p = 0.019).

Nossa amostra também indica que impacto do tipo Pincer é 93%  menos frequente em homens que em mulheres (p = 0.00174).
Isso confirma que a maior prevalência de Pincer é em mulheres.

Não há evidências em nossa amostra de que um impacto do tipo Misto acometa mais homens que mulheres (p = 0.738).



Nós analisamos também a relação da dor com cada tipo de impacto fêmoro-acetabular.
Observamos que a presença de CAM é 3.4 vezes mais frequente nos quadris dolorosos (p = 0.025) que no grupo controle.
Não houve diferença significativa nas ocorrências para Pincer (p = 0.767) e misto (p = 0.0554) (Figura 33).

![**Figura 33** Número de quadris, por gênero e por grupo de estudo, com cada tipo de impacto fêmoro-acetabular (N = 52)](../figures/painel_sex_grupo.png)

## Torção femoral

### Associação entre a torção femoral e os tipos de impacto fêmoro-acetabular



A torção média dos quadris que possuem impacto do tipo CAM não é significativamente dos controles (p= 0.234).

A torção média dos quadris que possuem impacto do tipo PINCER observada foi de 16.63, maior que a média dos controles de 11.77 (p= 0.0455).

A torção média dos quadris que possuem impacto do tipo MISTO não é significativamente dos controles (p= 0.314).

### Correlação entre a torção femoral e o ângulo alfa

O ângulo de torção é negativamente correlacionado com o ângulo alfa (r = -0.31, p = 0.0289).
A figura 34 mostra a reta de regressão que associa as mensurações destes ângulos.

<!-- [FIXME: observar que esta correlação é global] -->

![**Figura 34** Regressão linear entre o ângulo de torção femoral e o ângulo alfa](../figures/painel_AlfTor_global.png)

O modelo de regressão linear apresentado na figura 34 representa como o ângulo de torção femoral varia em função do ângulo alfa.
Para cada aumento de um grau no ângulo alfa, há uma diminuição de aproximadamente 0.20 graus no ângulo de torção (p = 0.029).
O ângulo alfa sozinho, no entanto, explica apenas $r^2=$ 9.4% da variabilidade observada no ângulo de torção femoral.
É necessário investigar outros fatores que possam ajudar a explicar esta variabilidade observada.

Considerando cada grupo de estudo (quadris dolorosos e quadris controle), este resultado é inconsistente (figura 33).
O ângulo de torção é negativamente correlacionado com o ângulo alfa (r = -0.63, p = 0.00933) no grupo controle, mas a correlação não é significativa no grupo de quadris dolorosos
(r = -0.21, p = 0.233).

Sob a hipótese de uma associação linear entre o ângulo de torção femoral como função do ângulo alfa, ajustou-se modelos de regressão linear para cada grupo.
A correlação negativa tem efeito menos marcante no grupo de quadris dolorosos que no grupo controle (figura 35).
Controlando pelo grupo de estudo, a associação permanece significativamente negativa no grupo controle (p = 0.0093).
Este modelo indica que para cada aumento de um grau no ângulo alfa, há uma diminuição de aproximadamente 0.40 graus no ângulo de torção.
Uma relação linear não pode mais ser detectada no grupo de quadris dolorosos (p = 0.23).

![**Figura 35** Regressões lineares entre o ângulo de torção femoral e o ângulo alfa, para cada grupo de estudo (quadris dolorosos e quadris controle)](../figures/painel_AlfTor_grupo.png)

<!-- ```{r echo=FALSE, warning=FALSE, fig.cap="**Figura xx** Correlação entre Torção e Alfa, por grupo"} -->
<!-- alftor.grupo.imp -->
<!-- ``` -->

Quando controlamos pelo tipo de impacto, não é mais possível identificar associação entre os ângulos (figura 36).
Isto pode ter sido afetado pela diferença entre as variabilidades relativas entre os ângulos estudados (tabela 3).

<!-- FIXME: mover para a DISCUSSÃO -->
<!-- Esta aparente correlação negativa no grupo controle parece ter sido afetada pelo baixo número de pacientes com impacto misto - há apenas 2 pacientes nesta categoria. -->
<!-- Isto impede uma estimativa representativa para este cenário em particular, e perturba a estimativa o modelo global. -->

<!-- Obs: na verdade, retirar todos os pacientes MISTO não impacta nos resultados e conclusões. -->

![**Figura 36** Regressões lineares entre o ângulo de torção femoral e o ângulo alfa, para cada grupo de estudo (quadris dolorosos e quadris controle e para cada tipo de impacto fêmoro-acetabular](../figures/painel_AlfTor_imp_grupo.png)

<!-- ### Quadris com ângulo de torção femoral alterada -->

<!-- FIXME: Análise qualitativa -->

<!-- - torção femoral alterada x tipos de impacto (regressão logística) -->
<!-- - tipos de alteração de torção x tipos de impacto (regressão multinomial) -->

# Conclusões

# Referências

# Apêndice

