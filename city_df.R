youth_df <- read.csv("YSSBR DATA Small NA.csv")
library("reshape")
library(dplyr)
library(ggplot2)

city_df <- youth_df %>% 
  select(Year, City, q17..Ever.cigarette.use.) %>% 
  group_by(Year) %>% 
  summarise(cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = TRUE, NaN.rm = TRUE)), City = City)

# 
# 
# 
