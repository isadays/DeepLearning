Este script R demonstra o uso de uma rede neural recorrente (RNN) para prever o preço de fechamento das ações da PETR4. Utilizando bibliotecas como rnn, dplyr, ggplot2 e rattle, o script processa os dados históricos, normaliza-os e os divide em conjuntos de treino e teste. A rede neural é treinada com 20 neurônios na camada oculta, uma taxa de aprendizado de 0.05 e 1000 épocas.

O modelo atinge um coeficiente de determinação 
𝑅
2
R 
2
  satisfatório tanto no conjunto de treino quanto no conjunto de teste, indicando uma boa correlação entre os valores previstos e os reais. As visualizações geradas com ggplot2 mostram as previsões da rede neural em comparação com os valores reais, permitindo avaliar o desempenho do modelo.
