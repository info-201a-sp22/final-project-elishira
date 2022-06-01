youth_df <- read.csv("YSSBR DATA Small NA.csv")

library(plotly)
library("rsconnect")
library("bslib")
library("shinythemes")
library("markdown")





# Home page tab
intro_side_tab <- sidebarPanel(
  # Title of tab
  "Introduction",
  fluidPage(theme = shinytheme("simplex")
  )
)
main_panel_table <- mainPanel(
  "Summary",
  includeMarkdown("introduction.md"),
  h2("Something about the data"),
  
  h2("Table viz?"),
  
)
intro_tab <- tabPanel(
  "Intro Tab",
  sidebarLayout(
    intro_side_tab,
    main_panel_table
  )
)
# We want our next tab to have a sidebar layout
# So we're going to create a sidebarPanel() and a mainPanel() and then add them together

# Create sidebar panel for widget
sidebar_panel_widget <- sidebarPanel(
  
  selectInput("select", label = h3("Select box"), 
              choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
              selected = 1),
    # True allows you to select multiple choices
    selected = "Sample Question 1" 
  )
  #sliderInput(inputId = "year_selection",
  #            label = h3("Slider"),
  #            min = min(climate_df$year),
  #            max = max(climate_df$year),
  #            sep = "",
  #            value = c(2010, 2020)
  #)


# Put a plot in the middle of the page
main_panel_plot <- mainPanel(
  #  plotOutput(outputId = "climate_plot")
  # Make plot interactive
  h2("Spacer"),
  plotlyOutput(outputId = "teen_suicide_viz"),
  h2("Sample"),
  plotlyOutput(outputId = "age_in_YRBSS_data"),
  plotlyOutput(outputId = "race_suicide_viz")
  
)

# Plot Tab  - combine sidebar panel and main panel
Plot_tab <- tabPanel(
  "Plot`s` tab",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)
main_panel_questions <- mainPanel(
  "Test",
  h2("Proportion of "),
  plotlyOutput(outputId = "question_viz")
)

sidebar_panel_dropdown <- sidebarPanel(
  
  selectInput(inputId = "user_selection", label = h3("Select Question"), 
              choices = c("What proportion of students have had sexual Intercourse?" = "ever_sexual_intercourse",
                          "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
                          "What proportion of students currently use cigarettes?" = "current_cig_use",
                          "What proportion of students have attemped suicide?" = "attemped_suicide", 
                          "What proportion of studnets have ever used alcohol?" = "ever_alc_use",
                          "What proportion of students have ever used alcohol?" = "ever_marijuana_use",
                          "What proportion of students have evver used alcohol?" = "ever_cocaine_use"), 
              selected = "ever_sexual_intercourse", 
              multiple = T
  # True allows you to select multiple choices
   
  )
)

sidebar_city_panel_dropdown <- sidebarPanel(
  
  selectInput(
    inputId = "user_city_question_selection", 
    label = h3("Select City in California"), 
    choices = c("Orange County" = "Orange C",
                "San Diego" = "San Dieg,",
                "San Francisco" = "San Fran",
                "Los Angeles" = "Los Ange",
                "San Bernardino" = "San Bern"), 
  multiple = TRUE
  ),
  
  selectInput(inputId = "user_question_selection", label = h3("Select Question"), 
              choices = c("What proportion of students have had sexual Intercourse?" = "ever_sexual_intercourse",
                          "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
                          "What proportion of students currently use cigarettes?" = "current_cig_use",
                          "What proportion of students have attemped suicide?" = "attemped_suicide", 
                          "What proportion of students have ever used alcohol?" = "ever_alc_use",
                          "What proportion of students have ever carried a weapon?" = "weapon_carrying", 
                          "What proportion of students have ever been in a fight?" = "physical_fighting")
  ), 
  multiple = F
  # True allows you to select multiple choices
)

Viz_tab <- tabPanel(
  "Viz tab",
  sidebarLayout(
    sidebar_panel_dropdown,
    main_panel_questions
  )
)

main_panel_bar_panel <- mainPanel(
  "Test",
  h2("Select a question and find out more about the YSSBR survey data!"),
  plotlyOutput(outputId = "age_bar_plot")
)

main_panel_city <- mainPanel(
  h2("Select a question and a city to find out more about YSSBR data in California!"),
  plotlyOutput(outputId = "city_viz"),
)

sidebar_barplot_panel_dropdown <- sidebarPanel(
  
  selectInput(inputId = "user_bar_plot_selection", label = h3("Select Question"), 
              choices = c("What proportion of students have had sexual Intercourse?" = "ever_sexual_intercourse",
                          "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
                          "What proportion of students currently use cigarettes?" = "current_cig_use",
                          "What proportion of students have attemped suicide?" = "attemped_suicide", 
                          "What proportion of students have ever used alcohol?" = "ever_alc_use",
                          "What proportion of students have ever carried a weapon?" = "weapon_carrying", 
                          "What proportion of students have ever been in a fight?" = "physical_fighting")
                          ), 
              selected = "ever_sexual_intercourse", 
              multiple = F
              # True allows you to select multiple choices
              
)
# 
# city_tab_question_dropdown <- sidebarPanel(
#   
#   selectInput(inputId = "user_question_selection", label = h3("Select Question"), 
#               choices = c("What proportion of students have had sexual Intercourse?" = "ever_sexual_intercourse",
#                           "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
#                           "What proportion of students currently use cigarettes?" = "current_cig_use",
#                           "What proportion of students have attemped suicide?" = "attemped_suicide", 
#                           "What proportion of students have ever used alcohol?" = "ever_alc_use",
#                           "What proportion of students have ever carried a weapon?" = "weapon_carrying", 
#                           "What proportion of students have ever been in a fight?" = "physical_fighting")
#   ), 
#   selected = "ever_sexual_intercourse", 
#   multiple = F
#   # True allows you to select multiple choices
#   
# )

# 
# sidebar_barplot_panel_dropdown <- sidebarPanel(
# 
#   selectInput(
#     inputId = "city_selection",
#     label = "Select City in California",
#     choices = c("Orange County" = "Orange C",
#                 "San Diego" = "San Dieg,",
#                 "San Francisco" = "San Fran",
#                 "Los Angeles" = "Los Ange",
#                 "San Bernardino" = "San Bern",)
#   ),
# 
#   selected = "ever_sexual_intercourse",
#   multiple = F
#   # True allows you to select multiple choices
# 
# )

Bar_tab <- tabPanel(
  "Bar Plot tab",
  sidebarLayout(
    sidebar_barplot_panel_dropdown,
    main_panel_bar_panel
  )
)

filter_state_question_tab <- tabPanel(
  "Filter by City in California",
  
  sidebarLayout(
    sidebar_city_panel_dropdown,
    main_panel_city
  )
)

conclusion_tab <- tabPanel(
  "Conclusion Tab"
)

my_theme %>% bs_add_rules(sass::sass_file("my_style.css"))


ui <- navbarPage(
  # Home page title
  "YSSBR Survey Data",
  intro_tab,
  Plot_tab,
  Viz_tab,
  Bar_tab,
  filter_state_question_tab,
  conclusion_tab
)

