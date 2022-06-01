youth_df <- read.csv("YSSBR DATA Small NA.csv")
library(tidyverse)
library(dplyr)
library("shiny")
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
      ggtitle("Proportion of Teens attempting Suicide by Race")
    return(proportion_race_suicide_viz)
  })
  output$age_bar_plot <- renderPlotly({
    filtered_age_df <- age_df %>% 
      filter(Question %in% input$user_bar_plot_selection)
    
    ggplot(data = filtered_age_df, aes(x = age..1..10.years..7.16..years.old. + 10, y = Proportion * 100)) +
      geom_bar(color = "blue", fill = "blue", stat = "identity") +
      ggtitle(input$user_bar_plot_selection) +
      ylab("Percent of survery base") +
      xlab("Age of Students") 
    
  })
  output$question_viz <- renderPlotly({
    filtered_df <- question_df %>% 
      filter(Question %in% input$user_selection)
    
    question_plot <- ggplot(data = filtered_df) + 
      geom_line(aes(x = Year, 
                    y = Proportion, 
                    color = Question))
   return(question_plot)
    
  })
  
  output$city_viz <- renderPlotly({
    
    city_df <- youth_df %>% 
      select(Year, City, q17..Ever.cigarette.use.) %>% 
      group_by(Year) %>% 
      summarise(cig_use = (mean(q17..Ever.cigarette.use. - 1, na.rm = TRUE)), City = City)
    
    filtered_city_df <- city_df %>% 
      filter(City %in% input$user_city_question_selection)
    
    
    city_plot <- ggplot(data = filtered_city_df, aes(x = Year, y = cig_use, color = City)) +
      geom_line() +
      xlab("Year") +
      ylab("Proporation of teens who have ever used a cigarette") +
      ggtitle("Proporation of Teens who have Ever Used a Cigarette over the Years in California")
    return(city_plot)
    
  })
  
}
