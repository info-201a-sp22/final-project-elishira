youth_df <- read.csv("YSSBR DATA Small NA.csv")
library("reshape")
library(dplyr)
library(ggplot2)

#Proportion of kids ever used a cig question 17
city_cigarette_ever_use <- youth_df %>% 
  select(Year, City, q17..Ever.cigarette.use.) %>% 
  group_by(Year) %>% 
  summarise(cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = TRUE)), City = City)

#Merge
city_df <- city_cigarette_ever_use
# 
# city_df <- ggplot(data = city_df) +
#   geom_line(mapping = aes(x = Year, y = cig_use, color = City))
# city_df
# 
# 
# 
