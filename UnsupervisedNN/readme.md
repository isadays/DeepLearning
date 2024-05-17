- A restricted Boltzmann machine (RBM) is an Unsupervised Deep Learning technique. This architecture is a generative stochastic artificial neural network that can learn a probability distribution over its set of inputs.

- An autoencoder is a special type of neural network that is trained to copy its input to its output. 

Este script R utiliza uma Máquina de Boltzmann Restrita (RBM) para treinar um modelo no conjunto de dados Fashion MNIST. As bibliotecas principais utilizadas incluem RBM, dplyr, e ggplot2. O script carrega os dados, seleciona uma amostra dos dados de treino e teste, e treina um modelo RBM com 100 neurônios na camada oculta, 1000 iterações, e minibatches de tamanho 10.

O modelo é treinado para reconstruir imagens de roupas a partir do conjunto de dados Fashion MNIST, com resultados visualizados para avaliar o desempenho. A reconstrução de uma amostra de teste é mostrada para verificar a eficácia do modelo em capturar as características das imagens de entrada.

References: [1]. https://datasets.activeloop.ai/docs/ml/datasets/mnist/
            [2]. https://www.tensorflow.org/tutorials/generative/autoencoder
