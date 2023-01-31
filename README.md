# Principal Component Analysis (PCA) on College Data
This script applies PCA on College data from the ISLR2 library in R to predict the number of applications received. The script contains the following steps:

1. Data preparation and splitting: The College data is first treated for missing values, and then divided into training (80%) and testing (20%) datasets.

2. Exploratory analysis: A correlation matrix of predictors is visualized using the pairs.panels function from the psych library.

3. PCA on all predictors: PCA is applied on the complete predictor data using the prcomp function. The summary function is used to view the results of the PCA.

4. PCA on training predictors: PCA is applied on the training data using the prcomp function. The resulting principal components (PCs) are stored in an object pc. A correlation matrix of PCs is visualized using the pairs.panels function.

5. Model fitting: Linear regression models are fit on the PCs and the response variable Apps. The first model uses the first two PCs (PC1 and PC2), while the second model uses the first 8 PCs that account for at least 85% of the variance. The prediction error (RMSE) is calculated on both the training and testing datasets.

## Note: 
The script assumes that the user has the ISLR2 library installed and loaded.
