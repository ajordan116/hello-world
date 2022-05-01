# Assignment: ASSIGNMENT 5
# Name: Jordan, Andrew
# Date: 2022-04-17

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Andrew/StatClass/dsc520")

## Load the `data/week-7-housing.xlsx` to
library(readxl)
library(dplyr)
library(stringr)
housing_df <- read_excel("data/week-7-housing.xlsx", sheet=1)
housing_df

## Filter
housing_df %>% filter(square_feet_total_living<=2500)
## Arrange
housing_df %>% arrange(desc('Sale Price'))
## Select
housing_df %>% select('Sale Price',zip5,bedrooms)
## Mutate
housing_df_mutated <- mutate(housing_df,square_meters_total_living = square_feet_total_living*.0929)
housing_df_mutated %>% select(square_meters_total_living)
## Summarize
housing_df %>% summarize(mean(sq_ft_lot,na.rm=TRUE))
## GroupBy
housing_df %>% group_by(year_built)
##cbind + rbing
location <- select(housing_df,zip5)
size <- select(housing_df,square_feet_total_living)
rooms <- select(housing_df,bedrooms)
houses1 <- cbind(location,size,rooms)
colnames(houses1)<-c("location","size","rooms")
head(houses1)
location <- select(housing_df,ctyname)
size <- select(housing_df,sq_ft_lot)
rooms <- select(housing_df,bath_full_count)
houses2 <- cbind(location,size,rooms)
colnames(houses2)<-c("location","size","rooms")
head(houses2)
houses12 <- rbind(houses1,houses2)
head(houses12)
tail(houses12)
## Split+Concatenate Sting
smallhouses <- str_extract(housing_df$bedrooms,pattern="2")
smallhouses
largehouses <- str_extract(housing_df$bedrooms,pattern="6")
largehouses
paste(smallhouses,largehouses)
