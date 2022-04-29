# Assignment: ASSIGNMENT 3 Part2
# Name: Jordan, Andrew
# Date: 2022-04-02

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Andrew/StatClass/dsc520")

## Load the `acs-14-1yr-s0201.csv` to
survey_df <- read.csv("data/acs-14-1yr-s0201.csv")

# 1. What are the elements in your data (including the categories and data types)?
str(survey_df)
# ID - Character
# ID2 - Integer
# Geography - Character
# PopGroupID - Integer
# POPGROUP.display.label - Character
# RacesReporte - Integer
# HSDegree - Numeric
# BachDegree - Numeric
survey_df
# 2. Please provide the output from the following functions: str(); nrow(); ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)
# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
ggplot(survey_df, aes(HSDegree)) + geom_histogram()
  # Set a bin size for the Histogram.
ggplot(survey_df, aes(HSDegree)) + geom_histogram(bins=30)
  # Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(survey_df, aes(HSDegree)) + geom_histogram(bins=30) + ggtitle("High School Degree Holder Distribution") + 
  xlab("High School Degree Percentage") + ylab("County Counts")
# 4. Answer the following questions based on the Histogram produced:
  # Based on what you see in this histogram, is the data distribution unimodal?
    ## Based on the singular peak in the histogram, the data distribution appears to be unimodal. 
  # Is it approximately symmetrical?
mean(survey_df$HSDegree)
median(survey_df$HSDegree)
    ## As the mean is 87.6 and the median is 88.7, I believe these number to be close enough to consider
    ## the histogram to be approximately symmetrical
  # Is it approximately bell-shaped?
sd(survey_df$HSDegree)
    ##As the standard deviation is 5.12, it is too far from 1 to be considered approximately bell-shaped
  # Is it approximately normal?
    ## The histogram shows a dataset that is NOT distributed normally. 
  # If not normal, is the distribution skewed? If so, in which direction?
    ## The distribution is skewed to the right, thus is is negatively skewed. 
  # Include a normal curve to the Histogram that you plotted.
ggplot(survey_df, aes(x=HSDegree)) + geom_histogram(aes(y=..density..,bins=30)) + ggtitle("High School Degree Holder Distribution") + 
  xlab("High School Degree Percentage") + ylab("County Counts") + 
  stat_function(fun = dnorm, color="blue", args=list(mean=mean(survey_df$HSDegree), sd=sd(survey_df$HSDegree)))  
# Explain whether a normal distribution can accurately be used as a model for this data.
    ## As this dataset is not distributed normally, and skews negatively, a normal distribution can not accurately be used. 
# 5. Create a Probability Plot of the HSDegree variable.
library(qqplotr)
ggplot(survey_df, aes(sample=HSDegree)) + stat_qq_point(color="blue") + stat_qq_line(color="red")
# 6. Answer the following questions based on the Probability Plot: 
  # Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
    ## As the line of points is not a straight diagonal line, the distribution can not be considered approximately normal. 
  # If not normal, is the distribution skewed? If so, in which direction? Explain how you know
    ## As the plotted points bend up and to the left of the normal line, it is skewed to the right. 
# 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. 
# Include a screen capture of the results produced.
library(pastecs)
stat.desc(survey_df$HSDegree)
