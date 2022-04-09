# Assignment: ASSIGNMENT 4 Part 1
# Name: Jordan, Andrew
# Date: 2022-04-09


# A professor has recently taught two sections of the same course with only one difference between the sections. 
# In one section, he used only examples taken from sports applications, and in the other section, he used examples taken from a variety of application areas. 
# The sports themed section was advertised as such; so students knew which type of section they were enrolling in. 
# The professor has asked you to compare student performance in the two sections using course grades and total points earned in the course. 
# You will need to import the Scores.csv dataset that has been provided for you.

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Andrew/StatClass/dsc520")

## Load the `data/scores.csv` to
scores_df <- read.csv("data/scores.csv")

## Load the ggplot2 package
library(ggplot2)

# Use the appropriate R functions to answer the following questions:
# 1) What are the observational units in this study?
    ### The observational units in this study are the course grades and total points earned in the course by students. 

# 2) Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
    ### The variables mentioned in the above paragraph are: section(categorical), course grades(categorical), and total points(quantitative). 

# 3) Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
    scores_regular <- subset(scores_df,Section=="Regular")
    scores_sports <- subset(scores_df,Section=="Sports")
    scores_regular
    scores_sports
# 4)Use the Plot function to plot each Sections scores and the number of students achieving that score. 
#   Use additional Plot Arguments to label the graph and give each axis an appropriate label. 
    ggplot(scores_df, aes(x=Score, y=Count, color=Section)) + geom_point() + ggtitle("Student Scores") + xlab("Scores") + ylab("Number of Students") 

#   Once you have produced your Plots answer the following questions:

##   A) Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: 
##      Can you say that one section tended to score more points than the other? Justify and explain your answer.
        ### Though closely distributed, from the plot it appears that the students in the Regular section tended to score more points than those in the Sports. 
        ### While the highest score achieved was done so by students in the Sports Section, it happened only in the 10 count group, whereas the 20 and 30 count 
        ### groups had more students scoring highly from the Regular section.
    
##   B) Did every student in one section score more points than every student in the other section? 
##      If not, explain what a statistical tendency means in this context.
        ### The plot clearly shows that every student in one section did not score more points than every student in the other section.
        ### The plot shows that students in the Regular section scored more consistently, with a lower range of outcomes in their scores,
        ### whereas students in the Sports section had a wider range of score outcomes that included both the highest and lowest scores. 
    
##   C) What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
        ### One possible variable that could influence the point distributions is each student's major. Those taking the course as part of their chosen degree
        ### program may potentially perform better than those taking the course as an elective. 
