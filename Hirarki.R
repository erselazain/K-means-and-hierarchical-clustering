library(tidyverse)  
library(cluster)    # Algoritma klastering
library(factoextra) # Algoritma klastering dan visualisasi

data <- read.csv("covid19.csv", header = TRUE, sep=",")
data <- data[1:1000,4:11]
head(data)

str(data) 
summary(data)
datafix <- scale(data)

jarak <- dist(datafix, method = 'euclidean')
jarak

set.seed(240) # Setting seed
#model <- agnes(jarak, method = "average")
#model <- agnes(jarak, method = "single")
model <- agnes(jarak, method = "complete")

#model <- diana(datafix)
#model$dc
model

plot(model)
abline(h = 110, col = "green")

fit <- cutree(model, k = 2 )
fit

table(fit)
rect.hclust(model, k = 2, border = "green")



