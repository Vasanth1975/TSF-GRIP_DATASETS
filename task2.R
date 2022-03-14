

#AUTHOR: D VASANTH KUMAR
#DATASET: IRIS DATA SET
#TASK 2 -PREDICT THE OPTIMUM NUMBER OF CLUSTERS AND REPRESENT IT VISUALLY


#LIBRARIES USED
#pkgs <- c("factoextra")
#install.packages(pkgs)

library(rvest)
library(utils)
library(dplyr)
library(ggplot2)
library(factoextra)

#PREPARING DATASET

#Importing dataset from iris dataset
data(iris)
#Viewing iris dataset
View(iris)
#summary of the dataset
summary(iris)
#To check the structure of the dataset
str(iris)

#Exploratory Data Analysis

#Elbow METHOD
#----------------

##Compute clustering algorithm (e.g., k-means clustering) for different values of k. 
  #For instance, by varying k from 1 to 10 clusters.
##For each k, calculate the total within-cluster sum of square (wss).
##Plot the curve of wss according to the number of clusters k.
##The location of a bend (knee) in the plot is generally considered as an indicator of the appropriate number of clusters.

#----------------

df <- iris[1:4] # Selecting only numerical values

# Fitting K-Means clustering Model 
# to training dataset
set.seed(240) # Setting seed

m<-10 # Let m be the Max number of clusters

new <-function(x){
  kmeans(df,x, nstart = 50)$tot.withinss
}

wss<- sapply(1:m,new)

#Plotting the graph for Wss 

plot(1:m,wss,type = "b",xlab = "Number of clusters K",ylab = "Total within-clusters sum of squares")+ abline(v=3,lty=3)


