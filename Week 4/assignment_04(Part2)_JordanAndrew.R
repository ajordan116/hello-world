# Assignment: ASSIGNMENT 4 Part 2
# Name: Jordan, Andrew
# Date: 2022-04-09

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Andrew/StatClass/dsc520")

## Load the `data/scores.csv` to
scores_df <- read.csv("data/scores.csv")
scores_df
# Use the apply function on a variable in your dataset
apply(scores_df,2,length)
# Use the aggregate function on a variable in your dataset
aggregate(Score ~ Section, scores_df, mean)
# Use the plyr function on a variable in your dataset - more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
library("plyr")
ddply(scores_df,.(Section),transform)
# Check distributions of the data

# Identify if there are any outliers

# Create at least 2 new variables
