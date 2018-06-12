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

Esta análise foi realizada utilizando-se o software `R` versão 3.4.3.

<!-- The exact confidence intervals (CIs) of binomial proportions were calculated using package `exactci` (version 1.3.3). -->

# Resultados



## Descritivas

### Tabela básica


|           &nbsp;           |  level  |    Overall    |
|:--------------------------:|:-------:|:-------------:|
|           **n**            |         |      26       |
|        **SEXO (%)**        |    F    |   7 (26.9)    |
|                            |    M    |   19 (73.1)   |
|   **IDADE (mean (sd))**    |         | 35.00 (6.70)  |
|       **RAÃA (%)**        | Outros  |   7 (26.9)    |
|                            | Branca  |   19 (73.1)   |
|    **IMC (mean (sd))**     |         | 24.09 (4.22)  |
|      **LADO DOR (%)**      |    D    |   13 (50.0)   |
|                            |    E    |   4 (15.4)    |
|                            |    B    |   9 (34.6)    |
|    **HHS (mean (sd))**     |         | 67.12 (13.25) |
| **TORÃÃO D (mean (sd))** |         | 14.15 (10.30) |
| **TORÃÃO E (mean (sd))** |         | 15.00 (7.81)  |
|      **TONNIS D (%)**      |    0    |   9 (34.6)    |
|                            |    1    |   14 (53.8)   |
|                            |    2    |   3 (11.5)    |
|      **TONNIS E (%)**      |    0    |   11 (42.3)   |
|                            |    1    |   11 (42.3)   |
|                            |    2    |   4 (15.4)    |
|   **ACB D (mean (sd))**    |         | 34.68 (8.93)  |
|   **ACB E (mean (sd))**    |         | 32.00 (7.48)  |
|    **IA D (mean (sd))**    |         |  1.42 (4.94)  |
|    **IA E (mean (sd))**    |         |  0.73 (5.33)  |
|   **ACD D (mean (sd))**    |         | 135.77 (5.55) |
|   **ACD E (mean (sd))**    |         | 134.19 (5.06) |
|   **ALFA D (mean (sd))**   |         | 63.84 (14.03) |
|   **ALFA E (mean (sd))**   |         | 55.42 (12.04) |
| **I. EXTRU D (mean (sd))** |         | 14.52 (10.76) |
| **I. EXTRU E (mean (sd))** |         | 14.92 (13.00) |
|        **CAM (%)**         |    N    |   4 (15.4)    |
|                            |    D    |   6 (23.1)    |
|                            |    E    |   2 ( 7.7)    |
|                            |    B    |   14 (53.8)   |
|       **PINCER (%)**       |    N    |   9 (34.6)    |
|                            |    D    |   4 (15.4)    |
|                            |    E    |   3 (11.5)    |
|                            |    B    |   10 (38.5)   |
|       **MISTO (%)**        | Simples |   15 (57.7)   |
|                            |    D    |   4 (15.4)    |
|                            |    E    |   2 ( 7.7)    |
|                            |    B    |   5 (19.2)    |

Table: Tabela descritiva básica (univariada) - EXCLUIR linhas relativas a colunas da tabela que  não foram usadas!

### Tabelas estratificadas


|         &nbsp;         | level  |       D       |       E       |   p    |
|:----------------------:|:------:|:-------------:|:-------------:|:------:|
|         **n**          |        |      26       |      26       |        |
|      **LADO (%)**      |   D    |  26 (100.0)   |   0 (  0.0)   | <0.001 |
|                        |   E    |   0 (  0.0)   |  26 (100.0)   |        |
|      **SEXO (%)**      |   F    |   7 ( 26.9)   |   7 ( 26.9)   | 1.000  |
|                        |   M    |  19 ( 73.1)   |  19 ( 73.1)   |        |
|      **RAÇA (%)**      | Outros |   7 ( 26.9)   |   7 ( 26.9)   | 1.000  |
|                        | Branca |  19 ( 73.1)   |  19 ( 73.1)   |        |
|      **DOR (%)**       |   D    |  13 ( 50.0)   |  13 ( 50.0)   | 1.000  |
|                        |   E    |   4 ( 15.4)   |   4 ( 15.4)   |        |
|                        |   B    |   9 ( 34.6)   |   9 ( 34.6)   |        |
| **TORCAO (mean (sd))** |        | 14.15 (10.30) | 15.00 (7.81)  | 0.740  |
|  **ALFA (mean (sd))**  |        | 63.84 (14.03) | 55.42 (12.04) | 0.026  |
|      **CAM (%)**       |   N    |   4 ( 15.4)   |   4 ( 15.4)   | 1.000  |
|                        |   D    |   6 ( 23.1)   |   6 ( 23.1)   |        |
|                        |   E    |   2 (  7.7)   |   2 (  7.7)   |        |
|                        |   B    |  14 ( 53.8)   |  14 ( 53.8)   |        |
|     **PINCER (%)**     |   N    |   9 ( 34.6)   |   9 ( 34.6)   | 1.000  |
|                        |   D    |   4 ( 15.4)   |   4 ( 15.4)   |        |
|                        |   E    |   3 ( 11.5)   |   3 ( 11.5)   |        |
|                        |   B    |  10 ( 38.5)   |  10 ( 38.5)   |        |
|    **IMPACTO (%)**     | NORMAL |  11 ( 42.3)   |   9 ( 34.6)   | 0.532  |
|                        |  CAM   |   9 ( 34.6)   |   7 ( 26.9)   |        |
|                        | PINCER |   1 (  3.8)   |   4 ( 15.4)   |        |
|                        | MISTO  |   5 ( 19.2)   |   6 ( 23.1)   |        |

Table: Tabela por lado da medição


|        &nbsp;         |  level  |      F       |      M       |   p    |
|:---------------------:|:-------:|:------------:|:------------:|:------:|
|         **n**         |         |      7       |      19      |        |
|     **SEXO (%)**      |    F    |  7 (100.0)   |  0 (  0.0)   | <0.001 |
|                       |    M    |  0 (  0.0)   |  19 (100.0)  |        |
| **IDADE (mean (sd))** |         | 35.00 (6.38) | 35.00 (6.98) | 1.000  |
|     **RAÇA (%)**      | Outros  |  0 (  0.0)   |  7 ( 36.8)   | 0.134  |
|                       | Branca  |  7 (100.0)   |  12 ( 63.2)  |        |
|  **IMC (mean (sd))**  |         | 19.54 (2.44) | 25.86 (3.35) | <0.001 |
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

Table: Tabela por genero


|        &nbsp;         |  level  |      D       |      E       |      B       |   p    |
|:---------------------:|:-------:|:------------:|:------------:|:------------:|:------:|
|         **n**         |         |      13      |      4       |      9       |        |
|     **SEXO (%)**      |    F    |  4 ( 30.8)   |  0 (  0.0)   |  3 ( 33.3)   | 0.603  |
|                       |    M    |  9 ( 69.2)   |  4 (100.0)   |  6 ( 66.7)   |        |
| **IDADE (mean (sd))** |         | 35.23 (8.08) | 33.75 (6.24) | 35.22 (5.17) | 0.927  |
|     **RAÇA (%)**      | Outros  |  3 ( 23.1)   |  2 ( 50.0)   |  2 ( 22.2)   | 0.697  |
|                       | Branca  |  10 ( 76.9)  |  2 ( 50.0)   |  7 ( 77.8)   |        |
|  **IMC (mean (sd))**  |         | 24.40 (5.03) | 24.35 (2.76) | 23.57 (3.91) | 0.904  |
|      **DOR (%)**      |    D    |  13 (100.0)  |  0 (  0.0)   |  0 (  0.0)   | <0.001 |
|                       |    E    |  0 (  0.0)   |  4 (100.0)   |  0 (  0.0)   |        |
|                       |    B    |  0 (  0.0)   |  0 (  0.0)   |  9 (100.0)   |        |
|      **CAM (%)**      |    N    |  2 ( 15.4)   |  1 ( 25.0)   |  1 ( 11.1)   | 0.147  |
|                       |    D    |  4 ( 30.8)   |  0 (  0.0)   |  2 ( 22.2)   |        |
|                       |    E    |  0 (  0.0)   |  2 ( 50.0)   |  0 (  0.0)   |        |
|                       |    B    |  7 ( 53.8)   |  1 ( 25.0)   |  6 ( 66.7)   |        |
|    **PINCER (%)**     |    N    |  4 ( 30.8)   |  1 ( 25.0)   |  4 ( 44.4)   | 0.711  |
|                       |    D    |  3 ( 23.1)   |  1 ( 25.0)   |  0 (  0.0)   |        |
|                       |    E    |  1 (  7.7)   |  1 ( 25.0)   |  1 ( 11.1)   |        |
|                       |    B    |  5 ( 38.5)   |  1 ( 25.0)   |  4 ( 44.4)   |        |
|     **MISTO (%)**     | Simples |  6 ( 46.2)   |  3 ( 75.0)   |  6 ( 66.7)   | 0.237  |
|                       |    D    |  4 ( 30.8)   |  0 (  0.0)   |  0 (  0.0)   |        |
|                       |    E    |  1 (  7.7)   |  1 ( 25.0)   |  0 (  0.0)   |        |
|                       |    B    |  2 ( 15.4)   |  0 (  0.0)   |  3 ( 33.3)   |        |

Table: Tabela por lado da dor


|        &nbsp;         |  level  |    Outros    |    Branca    |   p    |
|:---------------------:|:-------:|:------------:|:------------:|:------:|
|         **n**         |         |      7       |      19      |        |
|     **SEXO (%)**      |    F    |  0 (  0.0)   |  7 ( 36.8)   | 0.134  |
|                       |    M    |  7 (100.0)   |  12 ( 63.2)  |        |
| **IDADE (mean (sd))** |         | 37.57 (7.41) | 34.05 (6.36) | 0.243  |
|     **RAÇA (%)**      | Outros  |  7 (100.0)   |  0 (  0.0)   | <0.001 |
|                       | Branca  |  0 (  0.0)   |  19 (100.0)  |        |
|  **IMC (mean (sd))**  |         | 27.43 (2.92) | 23.04 (4.06) | 0.023  |
|      **DOR (%)**      |    D    |  3 ( 42.9)   |  10 ( 52.6)  | 0.697  |
|                       |    E    |  2 ( 28.6)   |  2 ( 10.5)   |        |
|                       |    B    |  2 ( 28.6)   |  7 ( 36.8)   |        |
|      **CAM (%)**      |    N    |  1 ( 14.3)   |  3 ( 15.8)   | 0.909  |
|                       |    D    |  1 ( 14.3)   |  5 ( 26.3)   |        |
|                       |    E    |  1 ( 14.3)   |  1 (  5.3)   |        |
|                       |    B    |  4 ( 57.1)   |  10 ( 52.6)  |        |
|    **PINCER (%)**     |    N    |  4 ( 57.1)   |  5 ( 26.3)   | 0.615  |
|                       |    D    |  1 ( 14.3)   |  3 ( 15.8)   |        |
|                       |    E    |  0 (  0.0)   |  3 ( 15.8)   |        |
|                       |    B    |  2 ( 28.6)   |  8 ( 42.1)   |        |
|     **MISTO (%)**     | Simples |  5 ( 71.4)   |  10 ( 52.6)  | 1.000  |
|                       |    D    |  1 ( 14.3)   |  3 ( 15.8)   |        |
|                       |    E    |  0 (  0.0)   |  2 ( 10.5)   |        |
|                       |    B    |  1 ( 14.3)   |  4 ( 21.1)   |        |

Table: Tabela por raça

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

Há 2 pacientes que tem simultaneamente CAM e PINCER, mas em lados diferentes (1 paciente tem CAM D e PINCER E, e o outro tem CAM E e PINCER D).
Por isso, não são contabilizados como casos de impacto MISTO.

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


## Por lado de dor

O impacto é um bom preditor para em que lado o paciente sente dor?

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

<!-- # Exceções e Desvios do teste -->

# Conclusões


# Referências

# Apêndice

