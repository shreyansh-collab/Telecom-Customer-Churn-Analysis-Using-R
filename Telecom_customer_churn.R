# Load required libraries 
library(tidyverse)
library(caret)
## Data Cleaning
# Check dataset structure
str(Telecom_customer_churn)
# Check for missing values
colSums(is.na(Telecom_customer_churn))
#Fill missing values
Telecom_customer_churn$TotalCharges[
  is.na(Telecom_customer_churn$TotalCharges)]=mean(
    Telecom_customer_churn$TotalCharges, na.rm = TRUE
  )
## Encode Categorical Variables
Telecom_customer_churn$Churn=as.factor(Telecom_customer_churn$Churn)
Telecom_customer_churn$gender=as.factor(Telecom_customer_churn$gender)
Telecom_customer_churn$Partner=as.factor(Telecom_customer_churn$Partner)
Telecom_customer_churn$Dependents=as.factor(Telecom_customer_churn$Dependents)
Telecom_customer_churn$OnlineSecurity=as.factor(Telecom_customer_churn$OnlineSecurity)
Telecom_customer_churn$TechSupport=as.factor(Telecom_customer_churn$TechSupport)
## Split the dataset
# Set seed for reproducibility
set.seed(123)
# Split data
trainIndex=createDataPartition(Telecom_customer_churn$Churn,
                                p=0.7,list=FALSE)
train=Telecom_customer_churn[trainIndex,]
test=Telecom_customer_churn[-trainIndex,]
## Logistic Regression
logistic_model=glm(Churn~.,data=train,family = binomial)
summary(logistic_model)
# Predict on test data
test$predict=predict(logistic_model,newdata=test,type='response')
# Convert probabilities to binary outcomes
test$predicted_class=ifelse(test$predict>0.5,"yes","No")
# Evaluate model
confusionMatrix(as.factor(test$predicted_class),test$Churn)
##Visualizations
# Distribution of churn
ggplot(Telecom_customer_churn,aes(x = Churn))+
  geom_bar(fill="skyblue")+
  theme_minimal()+
  labs(title = "Churn Distribution")
# Monthly Charges vs Churn
ggplot(Telecom_customer_churn,aes(x=Churn,y=TotalCharges))+
  geom_boxplot()+
  theme_minimal()+
  labs(title="Monthly Charges by Churn")

