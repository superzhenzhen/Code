pacman::p_load(tidyverse, caret, corrplot, car, broom, ggpubr, MASS,relaimpo, car, e1071,interplot )
setwd("/Users/SupremeZhenZhen/Desktop")

cars = read.csv('cars.csv')
head(cars,4)
str(cars)
summary(cars)

colnames(cars)
cols = c('MetColor', 'Automatic')
cars[,cols] = sapply(cars[,cols], factor)
unique(cars$Doors)
cars$Doors = factor(cars$Doors, levels = c(2,3,4,5), ordered = TRUE)
str(cars)

options(repr.plot.width=6, repr.plot.height=4)
theme_set(
  theme_bw() +
    theme(legend.position = "top")
  )
options(repr.plot.width=9, repr.plot.height=6)

p1 = cars %>%
    ggplot( aes(y=Price)) + geom_boxplot()

p2 = cars %>%
     ggplot(aes(Price)) + geom_histogram()  

p3 = cars %>%
     ggplot(aes(log(Price))) + geom_histogram()

ggarrange(p1, p2, p3 + rremove("x.text"), 
          labels = c("A", "B", "C"),
          ncol = 2, nrow = 2)

skewness(cars$Price)
skewness(log(cars$Price))

outliers = cars %>%
filter((abs(Price - median(Price)) > 2*sd(Price)))
dim(outliers)
cars_new = cars %>%
filter(!(abs(Price - median(Price)) > 2*sd(Price)))
dim(cars_new)
skewness(cars_new$Price)

options(repr.plot.width=6, repr.plot.height=4)

p1 = cars_new %>%
    ggplot( aes(y=Price)) + geom_boxplot()

p2 = cars_new %>%
     ggplot(aes(Price)) + geom_histogram()

ggarrange(p1, p2 , 
          labels = c("A", "B"),
          ncol = 2, nrow = 2)


options(repr.plot.width=4, repr.plot.height=3)
df = cars_new
corrplot::corrplot(cor(df[, sapply(df, is.numeric)],
             use="complete.obs"), method = "number", type='lower')

# test the linearity with the continuous independent variables (IV)
# Age, KM, HP, CC, Weight
options(repr.plot.width=8, repr.plot.height=4)

p1 = ggplot(cars_new, aes(x = Age, y = Price)) + geom_point()+ geom_smooth(method = "loess")
p2 = ggplot(cars_new, aes(x = KM, y = Price)) + geom_point()+ geom_smooth(method = "loess")
p3 = ggplot(cars_new, aes(x = HP, y = Price)) + geom_point()+ geom_smooth(method = "loess")
p4 = ggplot(cars_new, aes(x = CC, y = Price)) + geom_point()+ geom_smooth(method = "loess")
p5 = ggplot(cars_new, aes(x = Weight, y = Price)) + geom_point()+ geom_smooth(method = "loess")

ggarrange(p1, p2, p3, p4, p5 + rremove("x.text"), 
          labels = c("A", "B", "C", 'D', 'E'),
          ncol = 3, nrow = 2)

# transformations
options(repr.plot.width=8, repr.plot.height=4)
p1 = ggplot(cars_new, aes(x = log(Age), y= Price)) + geom_point()+ geom_smooth(method = "loess")
p2 = ggplot(cars_new, aes(x = log(KM), y = Price)) + geom_point()+ geom_smooth(method = "loess")

ggarrange(p1, p2 + rremove("x.text"), 
          labels = c("A", "B", "C", 'D', 'E'),
          ncol = 3, nrow = 1)

# transformations
options(repr.plot.width=8, repr.plot.height=4)
p1 = ggplot(cars_new, aes(x = sqrt(Age), y= Price)) + geom_point()+ geom_smooth(method = "loess")
p2 = ggplot(cars_new, aes(x = sqrt(KM), y = Price)) + geom_point()+ geom_smooth(method = "loess")

ggarrange(p1, p2 + rremove("x.text"), 
          labels = c("A", "B", "C", 'D', 'E'),
          ncol = 3, nrow = 1)

# put the transformations in the cars data frame
cols_old = c('Age', 'KM')
cols = c('s_Age', 's_KM')
cars_new[, cols] = sapply(cars_new[, cols_old], sqrt)
head(cars_new,2)
corrplot(cor(cars_new[, sapply(cars, is.numeric)],
             use="complete.obs"), method = "number", type='lower')

# initial model without the transformed variables
model1 = lm(Price ~. -s_Age - s_KM, data = cars_new)
summary(model1)
car::vif(model1)
options(repr.plot.width=8, repr.plot.height=6)
par(mfrow = c(2, 2))
plot(model1)
model_stats = augment(model1)
head(model_stats)

# histogram of residuals
options(repr.plot.width=4, repr.plot.height=3)
ggplot(model_stats, aes(.resid)) + geom_histogram()

# set initial seed
set.seed(123)

inds = createDataPartition(cars_new$Price, p=0.7, list=FALSE,times=1)
train_set = cars_new[inds,]
nrow(train_set)/nrow(df)
dim(train_set)
test_set = cars_new[-inds,]
nrow(test_set)/nrow(df)

# initial model with the transformed variables
model2 = lm(Price ~. -Age - KM, data = train_set)
summary(model2)
summary(train_set)
sd(train_set$s_Age)
sd(train_set$s_KM)

# relative importance 
options(repr.plot.width=12, repr.plot.height=4)
plot(calc.relimp(model2,rela=TRUE))

# more detailed importance values
imp = as.data.frame(varImp(model2))
imp = data.frame(overall = imp$Overall, names   = rownames(imp))
imp[order(imp$overall,decreasing = T),]

# VIF
vif(model2)

# remove HP from the model2
model3 = lm(Price ~. -Age - KM -HP, data = train_set)
summary(model3)
vif(model3)

# remove MetColor from the model3
model4 = lm(Price ~. -Age - KM -HP -MetColor, data = train_set)
summary(model4)

# remove Doors from the model3
model5 = lm(Price ~. -Age - KM -HP -MetColor -Doors, data = train_set)
summary(model5)

# relative importance of various predictors in predicting alcohol
options(repr.plot.width=9, repr.plot.height=4)
plot(calc.relimp(model5,rela=TRUE))
options(repr.plot.width=8, repr.plot.height=6)
par(mfrow = c(2, 2))
plot(model5)
colnames(train_set)

# . -Age - KM -HP -MetColor -Doors
model6 = lm(Price ~ s_Age + s_KM+ FuelType+ Automatic+ CC+ Weight +
            FuelType:Automatic+ Weight:FuelType+ CC:FuelType + s_KM:FuelType , data = train_set)
summary(model6)

# using coplot
options(repr.plot.width=7, repr.plot.height=6)
coplot(Price ~  s_KM|FuelType, rows = 1, data = train_set, col = 'red')
model_stat = augment(model6)

# histogram of residuals
options(repr.plot.width=4, repr.plot.height=3)
ggplot(model_stat, aes(.resid)) + geom_histogram()

# test the learned model on test data
predictTest = predict(model6, newdata=test_set)
SSE = sum((test_set$Price - predictTest)^2)
SST = sum((test_set$Price - mean(df$Price))^2)
R_Sq= 1 - (SSE / SST)
round(R_Sq,4)

model6 = stepAIC(model2)
summary(model6)

# test the learned model on test data
predictTest = predict(model6, newdata=test_set)
SSE = sum((test_set$Price - predictTest)^2)
SST = sum((test_set$Price - mean(df$Price))^2)
R_Sq= 1 - (SSE / SST)
round(R_Sq,4)

model7 = lm(log(Price) ~. -lg_Age - lg_KM, data = train_set)
summary(model7)
model7 = stepAIC(model7)
summary(model7)
options(repr.plot.width=8, repr.plot.height=6)
par(mfrow = c(2, 2))
plot(model7)

# test the learned model on test data
predictTest = predict(model7, newdata=test_set)
SSE = sum((log(test_set$Price) - predictTest)^2)
SST = sum((log(test_set$Price) - mean(log(df$Price)))^2)
R_Sq= 1 - (SSE / SST)
round(R_Sq,4)