youth_df <- read.csv("YSSBR DATA Small NA.csv")
library("reshape")
library(dplyr)

#Age of weapon carrying
Age.When.The.Student.Started.Carrying.A.Weapon <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%
  summarise(weapon_carrying = (mean(q10...Weapon.Carrying. - 1, na.rm = TRUE)))
#Age of Physical Fighting
Age.When.The.Student.Fought <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%
  summarise(physical_fighting = (mean(q11..Physical.Fighting. - 1, na.rm = TRUE)))

#Age of kids attemped suicide question 16 
Age.When.Student.Attemped.Suicide <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>% 
  summarise(attemped_suicide = (mean(q16..Attempted.suicide. - 1, na.rm = T)))


#Age of kids ever used a cig question 17
Age.Of.First.Cigarette.Use <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>% 
  summarise(ever_cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = T)))


#Age of kids ever using a cig question19
Age.Of.Constant.Cigarette.Use <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%  
  summarise(current_cig_use = (mean(q19..Current.cigarette.use. - 1, na.rm = TRUE)))

#Age of ever alc usage question26
Age.Of.First.Sip.Of.Alchol <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%  
  summarise(ever_alc_use = (mean(q26..Ever.alcohol.use. - 1, na.rm = TRUE)))


#Age of ever sexual intercourse question 34, ok 
Age.Of.First.Sexual.Intercourse <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%
  summarise(ever_sexual_intercourse = (mean(q34..Ever.sexual.intercourse. - 1, na.rm = TRUE)))

#Age multiple sexual partners, ok 
Age.Of.Multiple.Partners <- youth_df %>% 
  group_by(age..1..10.years..7.16..years.old.) %>%
  summarise(ever_sexual_intercourse = (mean(q34..Ever.sexual.intercourse. - 1, na.rm = TRUE)))


#Merge
age_df <- merge(x = Age.Of.First.Cigarette.Use, y = Age.Of.Constant.Cigarette.Use)
age_df <- merge(x = age_df, y = Age.When.Student.Attemped.Suicide)
age_df <- merge(x = age_df, y = Age.Of.First.Sip.Of.Alchol)
age_df <- merge(x = age_df, y = Age.When.The.Student.Fought)
age_df <- merge(x = age_df, y = Age.When.The.Student.Started.Carrying.A.Weapon)
age_df <- merge(x = age_df, y = Age.Of.First.Sexual.Intercourse)
age_df <- merge(x = age_df, y = Age.Of.Multiple.Partners)

#Get the column names (age_ever_alcohol_use, etc.) into one column to be able to create a chart
age_df <- melt(age_df, id.vars= "age..1..10.years..7.16..years.old.")
age_df <- rename(age_df, c("variable" = "Question"))
age_df <- rename(age_df, c("value" = "Proportion"))


  