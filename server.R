youth_df <- read.csv("YSSBR DATA Small NA.csv")
library(tidyverse)
library(dplyr)
library("shiny")
library("reshape")
library(ggplot2)
library("thematic")
thematic_shiny(font = "auto")

server <- function(input, output) {

  output$age_in_YRBSS_data <- renderPlotly({
    # create dataframe of ages and add 10 years to all ages
    #   so that they are accurate
    ages_df <- youth_df %>% 
      summarize(age..1..10.years..7.16..years.old. + 10)
    
    # makes the ages into a vector 
    Ages <- ages_df$`age..1..10.years..7.16..years.old. + 10`
    
    # plot the ages against the count of students taking the survey
    ages_in_YSSBR <- ggplot(data = youth_df, aes(x =  Ages)) +
      geom_bar(stat = "bin", color = "blue", fill = "blue", bins = 7) +
      ggtitle("Ages Represented in YRBSS Data") +
      ylab("Number of Survey-Takers") +
      xlab("Age of Survey-Taker") 
    ages_in_YSSBR
    return(ages_in_YSSBR)
    
  })
  output$teen_suicide_viz <- renderPlotly({
    result <- youth_df %>% 
      group_by(Year) %>% 
      summarise(avg_suicide = (mean(q16..Attempted.suicide. - 1, na.rm = TRUE)))
    
    teen_suicide_plot <- result %>% 
      ggplot(aes(x = Year, y = avg_suicide)) +
      geom_line() +
      geom_point() +
      ylab("Proportion of Teens Attempting Suicide 
       0 = not attempted
       1 = attempted") + 
      ggtitle("Proportion of Teens Attempting Suicide Over the Years")
    teen_suicide_plot
    return(teen_suicide_plot)
  })
  
  output$race_suicide_viz <- renderPlotly({
    result_NA <- youth_df %>% 
      group_by(race4..4.level.race.variable.) %>% 
      summarise(avg_suicide = (mean(q14..Suicide.consideration. -1, na.rm = T)))
    result <- head(result_NA, -1)
    
    proportion_race_suicide_viz <- result %>% 
      ggplot(aes(x = race4..4.level.race.variable., y = avg_suicide, color = avg_suicide ,fill = avg_suicide,)) +
      geom_bar(stat='identity') +
      ylab("Proportion of Teens Attempting Suicide 
       1 = White
       2 = Black
       3 = Hispanic
       4 = All other Races") + 
      ggtitle("Proportion of Teens Attempting Suicide by Race")
    return(proportion_race_suicide_viz)
  })
  
  output$age_bar_plot <- renderPlotly({
    
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
    
    filtered_age_df <- age_df %>% 
      filter(Question %in% input$user_bar_plot_selection)
    
    ggplot(data = filtered_age_df, aes(x = age..1..10.years..7.16..years.old. + 10, y = 100 - Proportion * 100)) +
      geom_bar(color = "blue", fill = "blue", stat = "identity") +
      ylab("Percent of Survey Base") +
      xlab("Age of Students") 
    
  })
  
  output$question_viz <- renderPlotly({
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
    
    filtered_df <- question_df %>% 
      filter(Question %in% input$user_selection)
    
    question_plot <- ggplot(data = filtered_df, aes(x = Year, 
                                                   y = 100 - Proportion * 100, 
                                                   color = Question)) + 
      geom_line() +
      ylab("Percent of Survey Base")
   return(question_plot)
    
  })
  
  
  
  output$city_viz <- renderPlotly({
    
    city_df <- youth_df %>% 
      select(Year, City, q17..Ever.cigarette.use.) %>% 
      group_by(Year) %>% 
      summarise(cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = TRUE)), City = City)
    
    city_df <- na.omit(city_df)
    
    filtered_city_df <- city_df %>% 
      filter(City %in% input$user_city_question_selection) %>% 
      filter(Year >= input$year_selection[1] & Year <= input$year_selection[2])
    
    city_plot <- ggplot(data = filtered_city_df, aes(x = Year, y = 100 - cig_use * 100, color = City)) +
      geom_line() +
      xlab("Year") +
      ylab("Percent of Survey Base") +
      ggtitle("Proportion of Teens Who Have Ever Used a Cigarette Over the Years")
    return(city_plot)
    
  })
  
}
