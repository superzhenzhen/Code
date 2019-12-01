setwd("/Users/SupremeZhenZhen/Desktop")
library(neuralnet)
library(tictoc)

dfTrain <- read.csv(file = "demo_failue_prediction_train.csv", header=TRUE, stringsAsFactors = FALSE, na.strings = "na" )
dfTest <- read.csv(file = "demo_failue_prediction_test.csv", header=TRUE, stringsAsFactors = FALSE, na.strings = "na" )
dim(dfTrain)
dfTrain[is.na(dfTrain)] <- 0
dfTest[is.na(dfTest)] <- 0

# Scale the Data
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

dfTrain[2:ncol(dfTrain)] <- lapply(dfTrain[2:ncol(dfTrain)], normalize)
dfTest[2:ncol(dfTest)] <- lapply(dfTest[2:ncol(dfTest)], normalize)
dfTrain[is.na(dfTrain)] <- 0
dfTest[is.na(dfTest)] <- 0
table(dfTrain$class)
dfTrain$class <- as.integer(dfTrain$class=="pos")
dfTest$class <- as.integer(dfTest$class=="pos")
table(dfTest$class)

param_nodes_hidden_layer <- c(5,4,6) 
param_max_iteration <- 1e5 
param_learning_rate <- 0.1  

dfTrainSub <- dfTrain
# combine the attributes name
names <- colnames(dfTrainSub)
f <- as.formula(paste("class ~", paste(names[!names %in% "class"], collapse = " + ")))
tic("Neural network training")

nnmodel <- neuralnet(f, data = dfTrainSub, hidden=param_nodes_hidden_layer, stepmax=param_max_iteration, learningrate = param_learning_rate, linear.output=FALSE) 
toc()
plot(nnmodel)

mypredict <- compute(nnmodel, dfTest[,2:ncol(dfTest)])$net.result
mypredict <- sapply(mypredict, round, digits=0)
results = data.frame(actual = dfTest$class, prediction = mypredict)
table(results)