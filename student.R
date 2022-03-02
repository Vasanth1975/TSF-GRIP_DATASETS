# D VASANTH KUMAR
# TASK-1
### PREDICTION USING SUPERVISED LEARNING##


#LIBRARIES USED
library(rvest)
library(utils)
library(dplyr)
library(ggplot2)


#PREDICT THE PERCENTAGE OF A STUDENT BASED ON THE NUMBER OF STUDY HOURS

#URL
df<- data.frame(read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv"));
View(df)


#AFTER CHECKING THE DATASET NO OUTLIERS OR EMPTY CELLS FOUNG
is.na(df)


#EXPLORATORY DATA ANALYSIS

#Scatter plot for hours and scores
pl <- ggplot(df,aes(Hours,Scores)) + geom_point() +geom_smooth(method = "lm",col="black")+theme_bw()
print(pl)

#Building the Model using Linear Regression

model <- lm(Scores~Hours,data=df);
summary(model)

#Prediction
#Let the student studies for 9.25hrs/day
new<-9.25
if(new>=0)
{
  p <- predict(model,newdata=data.frame(Hours=new))
  print(paste0("The predicted Score for",new,"hours/day is,",p))
}

