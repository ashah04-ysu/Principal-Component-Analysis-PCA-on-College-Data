#PCA for College data
library(ISLR2)
College <- na.omit(College)
#formart data
x <- model.matrix(Apps ~ ., College)[, -1]
y <- College$Apps
###Random choose 80% data for training and 20% for testing
set.seed(1)
ind <- sample(2, nrow(College),
              replace = TRUE,
              prob = c(0.8, 0.2))
training <- x[ind==1,]
testing <- x[ind==2,]
ytraining <- y[ind==1]
ytesting <- y[ind==2]
###Plot corralation coefficient and graphs of predictors
#install.packages("psych")
library(psych)
pairs.panels(training,
             gap = 0,
             pch=21)
#### Run CPA for the whole predictor data
pca.fit=prcomp(x, center=TRUE, scale=TRUE)
summary(pca.fit)
pca.fit=prcomp(x, center=TRUE, scale=TRUE, tol=0.1)
summary(pca.fit)
pca.fit=prcomp(x, center=TRUE, scale=TRUE, rank.=7)
summary(pca.fit)
###  Run CPA for the training predictor data
pc <- prcomp(training,
             center = TRUE,
             scale. = TRUE)
attributes(pc)
summary(pc)
###Plot corralation coefficient and graphs of PCs
pairs.panels(pc$x,
             gap=0,
             pch=21)
#### Predict Apps using PCA method
trg <- predict(pc, training)
### check dimension of the prediction
dim(trg)
head(trg)
### Add ytraining to the predictor training data (don't need the step)
trg <- data.frame(trg, ytraining)
dim(trg)
head(trg)
### Add ytesting to the predictor testing data (don't need the step)
tst <- predict(pc, testing)
tst <- data.frame(tst, ytesting)
head(tst)
# Predict the Apps using the two first componients
lm.fit <- lm(ytraining ~PC1+PC2, data = trg)
summary(lm.fit)
AppsPre <- predict(lm.fit, trg)
Etrain=sqrt(mean(AppsPre-ytraining)^2)
Etrain 
AppsPre1<- predict(lm.fit, tst)
Etest=sqrt(mean(AppsPre1-ytesting)^2)
Etest
#### Predict the Apps using the 8 first componients
#at least 85% means all Cumulative Proportions  greater than 85%
#therefore PC8 to PC17
lm.fit <- lm(ytraining ~PC8+PC9+PC10+PC11+PC12+PC13+PC14+PC15+PC16+PC17, data = trg)
summary(lm.fit)
AppsPre <- predict(lm.fit, trg,ncomp=0.85)
Etrain=sqrt(mean(AppsPre-ytraining)^2)
Etrain 
AppsPre1<- predict(lm.fit, tst, ncomp=0.85)
Etest=sqrt(mean(AppsPre1-ytesting)^2)
Etest
