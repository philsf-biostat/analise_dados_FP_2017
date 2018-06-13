---
title: "Análise Estatística de ..."
author: '**De:** Felipe Figueiredo **Para:** ___'
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
subtitle: 'CÓDIGO: analise_dados_FP_2017'
toc-title: "Sumário"
---



---

**Histórico do documento**


| Versão |   Alterações   |
|:------:|:--------------:|
|   01   | Versão inicial |

---

# Lista de abreviaturas

# Introdução

## Objetivos

## Recepção e tratamento dos dados

# Metodologia

## Diagnóstico sistemático

As medidas obtidas por avaliação clínica e radiológica foram utilizadas para classificar sistematicamente o tipo de impacto.
Foram considerados impactos CAM aqueles participantes que tinham ângulo alfa maior que 50 graus.
Para classificar o impacto do tipo PINCER foi considerada qualquer uma das seguintes medidas:

- índice acetabuar maior que 10 graus;
- ângulo centro-borda acetabular maior que 39 graus;
- índice de extrusão menor que 10 graus.

Participantes que possuíam tanto impacto CAM quanto PINCER no mesmo lado do quadril foram posteriormente classificados como impacto MISTO.
Observe que isto não considera um paciente com CAM em um lado e PINCER no outro como um paciente de impacto MISTO.

### Exceções

**CAM**

Um participante não teve seu ângulo alfa mensurado no lado direito, ele foi diagnosticado clinicamente como não possuindo impacto CAM.

**PINCER**

Um segundo participante não teve seu ângulo centro-borda cetabular mensurado no lado direito, e seu diagnóstico clínico foi de que não possuía PINCER.
Um terceiro participante não teve seus índices de extrusão mensurados em ambos os lados.
Seu diagnóstico clínico foi de que possuía PINCER apenas no quadril esquerdo.

## Análises estatísticas

As variáveis categóricas foram avaliadas quanto às suas frequências, sendo apresentadas em porcentagem.
Associações entre duas variáveis categóricas foram avaliadas usando-se o teste exato de Fisher.
As variáveis contínuas foram descritas com médias e desvio padrão.
As diferenças médias entre dois grupos de medidas foram avaliadas com o teste t de Student.

Além dos testes de significância, diversos modelos estatísticos foram criados para avaliar hipóteses sobre a relação entre os desfechos de interesse e os ângulos mensurados, como torção.

<!-- Para as hipóteses em que o desfecho era uma variável categórica binária, foi utilizado o modelo de regressão logística. -->
Quando o desfecho era uma variável categória com 3 ou mais categorias, como por exemplo o lado doloroso (direito, esquerdo ou bilateral) usou-se o modelo de regressão multinomial.

Esta estratégia de modelagem permite estimar a Razão de Chance de uma determinada combinação de fatores e medidas afetar a probabilidade de trocar de uma categoria para outra.
Por exemplo, o tipo de impacto que o participante apresenta pode aumentar a chance do participante sentir dor naquele lado, mas isso pode ocorrer de forma diferenciada para cada gênero, ou ser influenciada pelo ângulo de torção, IMC, etc.
Assim é possível controlar o efeito observado por outros fatores que possam estar relacionados.

Para avaliar a influência de diversos fatores na medida do ângulo de torção, foram usados modelos de regressão linear múltipla, o que permite controlar a observação do efeito por fatores adicionais que possivelmente influenciam no valor deste ângulo.

Todas as análises foram realizadas utilizando-se o software `R` versão 3.4.3.

<!-- The exact confidence intervals (CIs) of binomial proportions were calculated using package `exactci` (version 1.3.3). -->

# Resultados



## Descrição dos participantes do estudo

A Tabela 1 apresenta as características gerais dos participantes do estudo.


|        &nbsp;         | level  |    Overall    |
|:---------------------:|:------:|:-------------:|
|         **n**         |        |      26       |
|     **SEXO (%)**      |   F    |   7 (26.9)    |
|                       |   M    |   19 (73.1)   |
| **IDADE (mean (sd))** |        | 35.00 (6.70)  |
|     **RACA (%)**      | Outros |   7 (26.9)    |
|                       | Branca |   19 (73.1)   |
|  **IMC (mean (sd))**  |        | 24.02 (4.15)  |
|   **LADO DOR (%)**    |   D    |   13 (50.0)   |
|                       |   E    |   4 (15.4)    |
|                       |   B    |   9 (34.6)    |
|  **HHS (mean (sd))**  |        | 67.12 (13.25) |

Table: **Tabela 1** Descrição dos participantes do estudo (N = 26).
sd = Desvio padrão,
IMC = Índice de massa corpórea,
HHS = Harris hip score (modificado).


|         &nbsp;         | level  |       D       |       E       |   p   |
|:----------------------:|:------:|:-------------:|:-------------:|:-----:|
| **TORCAO (mean (sd))** |        | 14.15 (10.30) | 15.00 (7.81)  | 0.740 |
|  **ALFA (mean (sd))**  |        | 63.84 (14.03) | 55.42 (12.04) | 0.026 |
|   **IA (mean (sd))**   |        |  1.42 (4.94)  |  0.73 (5.33)  | 0.629 |
|  **ACB (mean (sd))**   |        | 34.68 (8.93)  | 32.00 (7.48)  | 0.250 |
| **EXTRU (mean (sd))**  |        | 14.52 (10.76) | 14.92 (13.00) | 0.906 |
|    **IMPACTO (%)**     | NORMAL |  11 ( 42.3)   |   9 ( 34.6)   | 0.532 |
|                        |  CAM   |   9 ( 34.6)   |   7 ( 26.9)   |       |
|                        | PINCER |   1 (  3.8)   |   4 ( 15.4)   |       |
|                        | MISTO  |   5 ( 19.2)   |   6 ( 23.1)   |       |

Table: **Tabela 2** Descrição das mensurações avaliadas e os tipos de impacto em cada lado do quadril.
sd = Desvio padrão,
ALFA = ângulo alfa,
IA = índice acetabular,
ACB = ângulo centro-borda acetabular,
EXTRU = índice de extrusão.
p = teste t de Student para variáveis contínuas, e teste exato de Fisher para impacto.

Observou-se que, na média, o ângulo alfa foi significativamente maior no lado direito dos pacientes que o medido no lado esquerdo (Tabela 2).
As outras mensurações parecem ser homogeneamente distribuídas em ambos os lados.
O mesmo ocorre com a distribuição de frequências doso tipos de impacto em ambos os quadris de cada paciente.

<!-- ## Características de cada gênero -->


|        &nbsp;         |  level  |      F       |      M       |   p    |
|:---------------------:|:-------:|:------------:|:------------:|:------:|
|         **n**         |         |      7       |      19      |        |
| **IDADE (mean (sd))** |         | 35.00 (6.38) | 35.00 (6.98) | 1.000  |
|  **IMC (mean (sd))**  |         | 19.54 (2.44) | 25.67 (3.36) | <0.001 |
|      **DOR (%)**      |    D    |  4 ( 57.1)   |  9 ( 47.4)   | 0.603  |
|                       |    E    |  0 (  0.0)   |  4 ( 21.1)   |        |
|                       |    B    |  3 ( 42.9)   |  6 ( 31.6)   |        |
|      **CAM (%)**      |    N    |  3 ( 42.9)   |  1 (  5.3)   | 0.112  |
|                       |    D    |  2 ( 28.6)   |  4 ( 21.1)   |        |
|                       |    E    |  0 (  0.0)   |  2 ( 10.5)   |        |
|                       |    B    |  2 ( 28.6)   |  12 ( 63.2)  |        |
|    **PINCER (%)**     |    N    |  1 ( 14.3)   |  8 ( 42.1)   | 0.044  |
|                       |    D    |  0 (  0.0)   |  4 ( 21.1)   |        |
|                       |    E    |  0 (  0.0)   |  3 ( 15.8)   |        |
|                       |    B    |  6 ( 85.7)   |  4 ( 21.1)   |        |
|     **MISTO (%)**     | Simples |  4 ( 57.1)   |  11 ( 57.9)  | 0.909  |
|                       |    D    |  1 ( 14.3)   |  3 ( 15.8)   |        |
|                       |    E    |  0 (  0.0)   |  2 ( 10.5)   |        |
|                       |    B    |  2 ( 28.6)   |  3 ( 15.8)   |        |

Table: **Tabela 3** Mensurações avaliadas e tipos de impacto observados por gênero.
sd = Desvio padrão,
IMC = Índice de massa corpórea,
p = teste t de Student para variáveis contínuas, e teste exato de Fisher para impacto.

O IMC médio dos homens é significativamente maior que o das mulheres (tabela 3).
A idade média, lado doloroso e o tipo de impacto dos participantes de cada gênero apresentou boa homogeneidade.

<!-- ## Características pelo lado doloroso -->


|        &nbsp;         |  level  |      D       |      E       |      B       |   p   |
|:---------------------:|:-------:|:------------:|:------------:|:------------:|:-----:|
|         **n**         |         |      13      |      4       |      9       |       |
| **IDADE (mean (sd))** |         | 35.23 (8.08) | 33.75 (6.24) | 35.22 (5.17) | 0.927 |
|  **IMC (mean (sd))**  |         | 24.24 (4.85) | 24.35 (2.76) | 23.57 (3.91) | 0.925 |
|      **CAM (%)**      |    N    |  2 ( 15.4)   |  1 ( 25.0)   |  1 ( 11.1)   | 0.147 |
|                       |    D    |  4 ( 30.8)   |  0 (  0.0)   |  2 ( 22.2)   |       |
|                       |    E    |  0 (  0.0)   |  2 ( 50.0)   |  0 (  0.0)   |       |
|                       |    B    |  7 ( 53.8)   |  1 ( 25.0)   |  6 ( 66.7)   |       |
|    **PINCER (%)**     |    N    |  4 ( 30.8)   |  1 ( 25.0)   |  4 ( 44.4)   | 0.711 |
|                       |    D    |  3 ( 23.1)   |  1 ( 25.0)   |  0 (  0.0)   |       |
|                       |    E    |  1 (  7.7)   |  1 ( 25.0)   |  1 ( 11.1)   |       |
|                       |    B    |  5 ( 38.5)   |  1 ( 25.0)   |  4 ( 44.4)   |       |
|     **MISTO (%)**     | Simples |  6 ( 46.2)   |  3 ( 75.0)   |  6 ( 66.7)   | 0.237 |
|                       |    D    |  4 ( 30.8)   |  0 (  0.0)   |  0 (  0.0)   |       |
|                       |    E    |  1 (  7.7)   |  1 ( 25.0)   |  0 (  0.0)   |       |
|                       |    B    |  2 ( 15.4)   |  0 (  0.0)   |  3 ( 33.3)   |       |

Table: **Tabela 4** Descrição dos participantes quanto ao lado doloroso.
sd = Desvio padrão,
IMC = Índice de massa corpórea,
p = teste t de Student para variáveis contínuas, e teste exato de Fisher para impacto.

Não houve associação significativa entre idade, IMC ou a dsitribuição dos tipos de impacto e o lado doloroso (Tabela 4).

Além disso, os participantes brancos e de outras raças tem distribuições semelhantes de gênero
(p = 0.1338),
idade 
(p = 0.2929).
Os participantes brancos tem IMC ligeiramente menor que de outras raças
(p = 0.03479).
Não houve diferença entre os participants brancos e de outras raças quanto à observação de CAM
(p = 0.9087),
PINCER
(p = 0.6153)
ou impacto MISTO
(p = 1).

## Frequências dos impactos


|   &nbsp;    | Ausente | PINCER |
|:-----------:|:-------:|:------:|
| **Ausente** |    0    |   4    |
|   **CAM**   |    9    |   13   |

Table: Impactos CAM x PINCER, p-value = 0.2631


| &nbsp; | N | D | E | B |
|:------:|:-:|:-:|:-:|:-:|
| **N**  | 0 | 0 | 0 | 4 |
| **D**  | 2 | 2 | 1 | 1 |
| **E**  | 1 | 1 | 0 | 0 |
| **B**  | 6 | 1 | 2 | 5 |

Table: Impactos CAM x PINCER, levando em conta lateralidade p-value = 0.1918

Há 2 participantes que tem simultaneamente CAM e PINCER, mas em lados diferentes (1 participante tem CAM D e PINCER E, e o outro tem CAM E e PINCER D).
Por isso, não são contabilizados como casos de impacto MISTO.

![](../figures/painel_dor.png)

## Por sexo

Os impactos ocorrem de forma diferenciada por sexo?

### Geral


|   &nbsp;    | F | M  |
|:-----------:|:-:|:--:|
| **Ausente** | 3 | 1  |
|   **CAM**   | 4 | 18 |

Table: CAM p-value = 0.04682


|   &nbsp;    | F | M  |
|:-----------:|:-:|:--:|
| **Ausente** | 1 | 8  |
| **PINCER**  | 6 | 11 |

Table: PINCER p-value = 0.3574


|   &nbsp;    | F | M  |
|:-----------:|:-:|:--:|
| **SIMPLES** | 4 | 11 |
|  **MISTO**  | 3 | 8  |

Table: MISTO p-value = 1.000

### Controlado pelo lado do impacto


| &nbsp; | F | M  |
|:------:|:-:|:--:|
| **N**  | 0 | 0  |
| **D**  | 2 | 4  |
| **E**  | 0 | 2  |
| **B**  | 2 | 12 |

Table: CAM p-value = 0.7014


| &nbsp; | F | M |
|:------:|:-:|:-:|
| **N**  | 0 | 0 |
| **D**  | 0 | 4 |
| **E**  | 0 | 3 |
| **B**  | 6 | 4 |

Table: PINCER p-value = 0.06238


|   &nbsp;    | F | M  |
|:-----------:|:-:|:--:|
| **Simples** | 4 | 11 |
|    **D**    | 1 | 3  |
|    **E**    | 0 | 2  |
|    **B**    | 2 | 3  |

Table: MISTO p-value = 1.000

![](../figures/painel_sex_lat.png)


## Por lado de dor

O impacto é um bom preditor para em que lado o participante sente dor?

### Geral


|   &nbsp;    | D  | E | B |
|:-----------:|:--:|:-:|:-:|
| **Ausente** | 2  | 1 | 1 |
|   **CAM**   | 11 | 3 | 8 |

Table: CAM p-value =  1.000


|   &nbsp;    | D | E | B |
|:-----------:|:-:|:-:|:-:|
| **Ausente** | 4 | 1 | 4 |
| **PINCER**  | 9 | 3 | 5 |

Table: PINCER p-value = 0.8616


|   &nbsp;    | D | E | B |
|:-----------:|:-:|:-:|:-:|
| **SIMPLES** | 6 | 3 | 6 |
|  **MISTO**  | 7 | 1 | 3 |

Table: MISTO p-value = 0.5662

### Controlado pelo lado do impacto


| &nbsp; | D | E | B |
|:------:|:-:|:-:|:-:|
| **N**  | 0 | 0 | 0 |
| **D**  | 4 | 0 | 2 |
| **E**  | 0 | 2 | 0 |
| **B**  | 7 | 1 | 6 |

Table: CAM p-value = 0.07675


| &nbsp; | D | E | B |
|:------:|:-:|:-:|:-:|
| **N**  | 0 | 0 | 0 |
| **D**  | 3 | 1 | 0 |
| **E**  | 1 | 1 | 1 |
| **B**  | 5 | 1 | 4 |

Table: PINCER p-value = 0.5243


|   &nbsp;    | D | E | B |
|:-----------:|:-:|:-:|:-:|
| **Simples** | 6 | 3 | 6 |
|    **D**    | 4 | 0 | 0 |
|    **E**    | 1 | 1 | 0 |
|    **B**    | 2 | 0 | 3 |

Table: MISTO p-value = 0.1333

![](../figures/painel_dor_lat.png)

<!-- # Exceções e Desvios do teste -->

# Conclusões


# Referências

# Apêndice

