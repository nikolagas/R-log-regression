wisconsin <- read.csv("wisconsin.csv")

# Check for missing values
which(is.na(wisconsin), arr.ind = TRUE)

# Remove missing values
wisconsin_clean <- na.omit(wisconsin)

summary(wisconsin_clean)
str(wisconsin_clean)

round(prop.table(table(wisconsin_clean$Class)), 3)


install.packages("corrplot")
library(corrplot)

cor(wisconsin_clean)

cor_matrix <- cor(wisconsin_clean)
corrplot(cor_matrix)

install.packages("Hmisc")
library(Hmisc)
hist.data.frame(wisconsin_clean)


# Load the base package
library(base)


# Split the dataset into a training set and a test set
split = sample(c(TRUE, FALSE), nrow(wisconsin_clean), replace = TRUE, prob = c(0.7, 0.3))
train = wisconsin_clean[split, ]
test = wisconsin_clean[!split, ]

# Change the levels of Class to benign and malignant
train$Class <- as.factor(train$Class)
levels(train$Class) <- c("Benign", "Malignant")


install.packages("caret")
library(caret)

# Set the seed for reproducibility
set.seed(123)

# Fit a logistic regression model
model <- train(
  Class ~ .,
  data = train,
  method = "glm",
  trControl = trainControl(method = "cv", classProbs = TRUE),
  metric = "ROC"
)


# Predict class labels for the test set
predictions <- predict(model, newdata = test)

# Convert data and reference to factors with the same levels
predictions <- as.factor(predictions)
reference <- as.factor(test$Class)
levels(predictions) <- levels(reference)

# Compute the confusion matrix
confusion_matrix <- confusionMatrix(predictions, reference)

# Print the confusion matrix
confusion_matrix

install.packages("pROC")
library(pROC)

# Predict the class probabilities for the test set
probs <- predict(model, newdata = test, type = "prob")

# Calculate the ROC curve
roc_obj <- roc(response = test$Class, predictor = probs[, 1])

# Calculate the AUC
auc <- auc(roc_obj)

# Print the AUC
auc
