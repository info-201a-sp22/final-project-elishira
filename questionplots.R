youth_df <- read.csv("YSSBR DATA Small NA.csv")
library("reshape")
library(dplyr)
library(ggplot2)
#Proportion of Weapon Carrying
weapon_carrying <- youth_df %>% 
  group_by(Year) %>%
  summarise(weapon_carrying = (mean(q10...Weapon.Carrying. - 1, na.rm = TRUE)))
#Proportion of Physical Fighting
physical_fighting <- youth_df %>% 
  group_by(Year) %>%
  summarise(physical_fighting = (mean(q11..Physical.Fighting. - 1, na.rm = TRUE)))

#Proportion of kids attemped suicide question 16 
attemped_suicide <- youth_df %>% 
  group_by(Year) %>% 
  summarise(attemped_suicide = (mean(q16..Attempted.suicide. - 1, na.rm = T)))

#Proportion of kids ever used a cig question 17
cigarette_ever_use <- youth_df %>% 
  group_by(Year) %>% 
  summarise(ever_cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = T)))


#Proportion of kids ever using a cig question19
current_cigarette_use <- youth_df %>% 
  group_by(Year) %>%  
  summarise(current_cig_use = (mean(q19..Current.cigarette.use. - 1, na.rm = TRUE)))

current_cig_use_plot <- ggplot(data = youth_df) +
  geom_line(mapping = aes(x = Year, y = youth_df$ever_cig_use))
#ever_cig_use_plot
#Proportion ever alc usage question26
ever_alcohol_use <- youth_df %>% 
  group_by(Year) %>%  
  summarise(ever_alc_use = (mean(q26..Ever.alcohol.use. - 1, na.rm = TRUE)))
#Proportion ever marijuana usage question28, not great 
ever_marijuana_use <- youth_df %>% 
  group_by(Year) %>% 
  summarise(ever_marijuana_use = (mean(q28..Ever.marijuana.use. - 1, na.rm = TRUE)))

#Proportion ever use cocaine question 31, not great 
ever_cocaine_use <- youth_df %>% 
  group_by(Year) %>% 
  summarise(ever_cocaine_use = (mean(q31..Ever.cocaine.use. - 1, na.rm = TRUE)))

#Proportion ever sexual intercourse question 34, ok 
ever_sexual_intercourse <- youth_df %>% 
  group_by(Year) %>%
  summarise(ever_sexual_intercourse = (mean(q34..Ever.sexual.intercourse. - 1, na.rm = TRUE)))

#Proportion multiple sexual partners, ok 
multiple_sexual_partners <- youth_df %>% 
  group_by(Year) %>%
  summarise(ever_sexual_intercourse = (mean(q34..Ever.sexual.intercourse. - 1, na.rm = TRUE)))


#Merge
question_df <- merge(x = cigarette_ever_use, y = current_cigarette_use)
question_df <- merge(x = question_df, y = attemped_suicide)
question_df <- merge(x = question_df, y = ever_alcohol_use)
question_df <- merge(x = question_df, y = ever_marijuana_use)
question_df <- merge(x = question_df, y = ever_cocaine_use)
question_df <- merge(x = question_df, y = ever_sexual_intercourse)
question_df <- merge(x = question_df, y = multiple_sexual_partners)

question_df <- melt(question_df, id.vars= "Year")
question_df <- rename(question_df, c("variable" = "Question"))
question_df <- rename(question_df, c("value" = "Proportion"))

question_df_plot <- ggplot(data = question_df) +
  geom_line(mapping = aes(x = Year, y = Proportion, color = Question))
question_df_plot



  