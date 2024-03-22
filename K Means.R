#install.packages("tidyverse")
#install.packages("cluster")
#install.packages("factoextra")
library(tidyverse)  
library(cluster)    # Algoritma klastering
library(factoextra) # Algoritma klastering dan visualisasi

data <- read.csv("covid19.csv", header = TRUE, sep=",")
data <- data[1:1000,4:11]
head(data)

str(data) 
summary(data)
datafix <- scale(data)

#model <- kmeans(datafix, centers = 2, nstart = 25)
model <- pam(datafix, 2)
str(model)
model$cluster

print(model)

fviz_cluster(model, data = datafix)





