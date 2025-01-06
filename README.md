## Telecom-Customer-Churn-Analysis-using-R
# Overview
This project analyzes customer churn in a telecom dataset using R. The goal is to identify factors influencing customer churn and predict churn using logistic regression.

# Objectives
1. Data Cleaning: Handle missing values and prepare the dataset for analysis.
2. Feature Engineering: Encode categorical variables for modeling.
3. Exploratory Data Analysis (EDA): Visualize churn distribution and its relationship with key variables.
4. Modeling: Build a logistic regression model to predict churn probability.
5. Evaluation: Assess model performance using confusion matrix metrics.

# Dataset
The dataset includes various customer attributes such as demographic information, services subscribed to, and monthly charges. Key features include:
gender, Partner, Dependents
OnlineSecurity, TechSupport
TotalCharges, MonthlyCharges
Target variable: Churn

# Steps and Methods
1. Data Cleaning
Checked dataset structure and missing values.
Imputed missing TotalCharges values with the column mean.
2. Feature Engineering
Converted categorical variables (Churn, gender, Partner, etc.) to factors for analysis.
3. Data Splitting
Split the dataset into training (70%) and test (30%) sets for modeling and evaluation.
4. Logistic Regression
Built a logistic regression model on the training data.
Predicted churn probabilities on the test set.
Converted probabilities to binary outcomes with a threshold of 0.5.
5. Evaluation
Used a confusion matrix to evaluate the model.
Metrics include accuracy, sensitivity, and specificity.
6. Visualizations
Churn Distribution: Visualized the proportion of churned and non-churned customers.
Monthly Charges vs. Churn: Analyzed how monthly charges vary by churn status.

# Results
The logistic regression model provided insights into factors affecting churn and demonstrated predictive capability with reasonable accuracy.

# Key R Libraries
Libraries: tidyverse, caret

# Visualizations
1. Churn Distribution:
A bar chart shows the distribution of churned vs. non-churned customers.
2. Monthly Charges vs. Churn:
A boxplot visualizes differences in total charges by churn status.
