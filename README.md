# DeepLearning
Bias x Variance
UnderFitting and OverFitting

- Stock Price Prediction
Objective: Predict the closing price of PETR4 stocks.

Libraries: rnn, dplyr, ggplot2, rattle.
Method: Preprocess data, normalize, train a recurrent neural network (RNN) with 20 hidden neurons.
Results: Model performance evaluated with R^2, showing good correlation between predicted and actual values.
- Fashion MNIST Image Reconstruction
Objective: Reconstruct images of clothing items from the Fashion MNIST dataset.

Libraries: RBM, dplyr, ggplot2.
Method: Train a Restricted Boltzmann Machine (RBM) with 100 hidden neurons and 1000 iterations.
Results: Successfully reconstructs images, demonstrating the model's ability to capture features of the input images.
-  Weather Data Prediction
Objective: Predict relative humidity using weather data.

Libraries: rnn, dplyr, ggplot2, rattle.
Method: Preprocess data, normalize, train a recurrent neural network (RNN) with 15 hidden neurons.
Results: Evaluated using R^2, indicating good correlation between predicted and actual humidity values.
- Housing Price Prediction
Objective: Predict median housing prices using the Boston dataset.

Libraries: MASS, neuralnet, rpart.
Method: Preprocess data, train an ANOVA-based regression tree and a neural network with layers (5, 4, 3, 2 neurons).
Results: Both models evaluated with mean squared error (MSE), showing effective prediction of housing prices.
Conclusion
Across various domains including finance, stock prediction, image processing, weather forecasting, and real estate, the provided R scripts demonstrate the use of advanced machine learning techniques such as neural networks (including RNNs), decision trees, and Restricted Boltzmann Machines. These techniques are applied to preprocess data, train models, and evaluate performance using metrics like accuracy, mean squared error, and R^2 . The results indicate strong predictive capabilities and effective data modeling, showcasing the versatility and power of machine learning in R.
