- A restricted Boltzmann machine (RBM) is an Unsupervised Deep Learning technique. This architecture is a generative stochastic artificial neural network that can learn a probability distribution over its set of inputs.

- An autoencoder is a special type of neural network that is trained to copy its input to its output. 

This R script uses a Restricted Boltzmann Machine (RBM) to train a model on the Fashion MNIST dataset. The main libraries used include RBM, dplyr, and ggplot2. The script loads the data, selects a sample of the training and testing data, and trains an RBM model with 100 neurons in the hidden layer, 1000 iterations, and minibatches of size 10.

The model is trained to reconstruct images of clothing from the Fashion MNIST dataset, with results visualized to evaluate performance. The reconstruction of a test sample is shown to verify the model's effectiveness in capturing the characteristics of the input images.


Este script R utiliza uma Máquina de Boltzmann Restrita (RBM) para treinar um modelo no conjunto de dados Fashion MNIST. As bibliotecas principais utilizadas incluem RBM, dplyr, e ggplot2. O script carrega os dados, seleciona uma amostra dos dados de treino e teste, e treina um modelo RBM com 100 neurônios na camada oculta, 1000 iterações, e minibatches de tamanho 10.

O modelo é treinado para reconstruir imagens de roupas a partir do conjunto de dados Fashion MNIST, com resultados visualizados para avaliar o desempenho. A reconstrução de uma amostra de teste é mostrada para verificar a eficácia do modelo em capturar as características das imagens de entrada.

References: [1]. https://datasets.activeloop.ai/docs/ml/datasets/mnist/
            [2]. https://www.tensorflow.org/tutorials/generative/autoencoder
