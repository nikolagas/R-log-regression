This dataset contains information about breast cancer tumors, including characteristics such as the size and shape of the tumors, as well as whether the tumor is malignant or benign. 

It contains 699 observations and 11 features. This dataset is also widely used for training machine learning models to classify breast cancer tumors as malignant or benign and it is also used as a benchmark dataset for comparing the performance of different algorithms.

In this case, I've run a logistic regression on it.

For more information on the dataset: "https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Original%29"

Alternatively, you can download it by running the following in RStudio: 

    url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
    data <- read.csv(url, header = FALSE)

The above code will download the dataset from the provided url and save it to a dataframe called data. You can then view the data by calling print(data).
