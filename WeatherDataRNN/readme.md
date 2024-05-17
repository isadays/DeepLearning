Este script R utiliza uma Rede Neural Recorrente (RNN) para prever a umidade relativa do ar utilizando o conjunto de dados weatherAUS. As bibliotecas principais utilizadas incluem rattle, rnn, ggplot2 e dplyr. O script carrega os dados, realiza o pré-processamento removendo valores ausentes, normaliza as variáveis e divide o conjunto de dados em treino e teste.

A rede neural é treinada com 15 neurônios na camada oculta, uma taxa de aprendizado de 0.01 e 100 épocas. O modelo é avaliado utilizando o coeficiente de determinação 
𝑅
2
R 
2
 , mostrando uma boa correlação entre os valores previstos e os reais. As visualizações geradas mostram a evolução do erro durante o treinamento e comparam os valores reais e previstos no conjunto de teste, permitindo avaliar o desempenho do modelo.
