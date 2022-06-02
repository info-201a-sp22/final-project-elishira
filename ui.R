youth_df <- read.csv("YSSBR DATA Small NA.csv")

library(plotly)
library("rsconnect")
library("bslib")
library("shinythemes")
library("markdown")

my_theme <- bs_theme(bg = "#FFEBCD",
                     fg = "#FA8072",
                     primary = "#DB7093",
                     base_font = font_google("Patrick Hand", local = TRUE))

# Home page tab
intro_side_tab <- sidebarPanel(
  # Title of tab
  "YSSBR DATA"
)
main_panel_table <- mainPanel(
  includeMarkdown("introduction.md")
)
intro_tab <- tabPanel(
  "Introduction Tab",
  sidebarLayout(
    main_panel_table,
    intro_side_tab
  )
)

main_panel_questions <- mainPanel(
  h2("Proportion of Teens Who Have..."),
  plotlyOutput(outputId = "question_viz")
)

sidebar_panel_dropdown <- sidebarPanel(
  
  selectInput(inputId = "user_selection", label = h3("Select Question"), 
              choices = c("What proportion of students have had sexual intercourse?" = "ever_sexual_intercourse",
                          "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
                          "What proportion of students currently use cigarettes?" = "current_cig_use",
                          "What proportion of students have attempted suicide?" = "attemped_suicide", 
                          "What proportion of studnets have ever used alcohol?" = "ever_alc_use",
                          "What proportion of students have ever used marijuana?" = "ever_marijuana_use",
                          "What proportion of students have ever used cocaine?" = "ever_cocaine_use"), 
              selected = "ever_sexual_intercourse", 
              multiple = T
  # True allows you to select multiple choices
   
  )
)

sidebar_city_panel_dropdown <- sidebarPanel(
  
  selectInput(
    inputId = "user_city_question_selection", 
    label = h3("Select a City in the United States"), 
    choices = c("Charlotte, NC" = "Charlott",
                "Chicago, IL" = "Chicago,",
                "Dallas, TX" = "Dallas,",
                "Houston, TX" = "Houston,",
                "Los Angeles, CA" = "Los Ange",
                "Milwaukee, WI" = "Milwauke",
                "San Bernardino, CA" = "San Bern",
                "San Francisco, CA" = "San Fran"), 
    selected = "Charlott",
    multiple = TRUE
  ),
  
  sliderInput(
    inputId = "year_selection",
    label = h3("Select Year Range"),
    min = 1995,
    max = 2019,
    sep = "",
    value = c(1995, 2019)
  )
  # True allows you to select multiple choices
)

Viz_tab <- tabPanel(
  "Filter Teen Activity by Question",
  includeMarkdown("tab1.md"),
  sidebarLayout(
    sidebar_panel_dropdown,
    main_panel_questions
  )
)

main_panel_bar_panel <- mainPanel(
  h2("Select a question and find out more about the YSSBR survey data!"),
  plotlyOutput(outputId = "age_bar_plot")
)

main_panel_city <- mainPanel(
  h2("Select a city and a year range to find out more about teen's cigarette usage in the US!"),
  plotlyOutput(outputId = "city_viz"),
)

sidebar_barplot_panel_dropdown <- sidebarPanel(
  
  selectInput(inputId = "user_bar_plot_selection", label = h3("Select Question"), 
              choices = c("What proportion of students have had sexual intercourse?" = "ever_sexual_intercourse",
                          "What proportion of students have ever used a cigarette?" = "ever_cig_use", 
                          "What proportion of students currently use cigarettes?" = "current_cig_use",
                          "What proportion of students have attempted suicide?" = "attemped_suicide", 
                          "What proportion of students have ever used alcohol?" = "ever_alc_use",
                          #"What proportion of students have ever carried a weapon?" = "weapon_carrying", 
                          "What proportion of students have ever been in a fight?" = "physical_fighting")
                          ), 
              selected = "ever_sexual_intercourse", 
              multiple = F
              # True allows you to select multiple choices
              
)

Bar_tab <- tabPanel(
  "Filter Teen Activity Corresponding to Age",
  includeMarkdown("tab2.md"),
  sidebarLayout(
    sidebar_barplot_panel_dropdown,
    main_panel_bar_panel
  )
)

filter_state_question_tab <- tabPanel(
  "Filter Teen Cigarette Usage by City",
  includeMarkdown("tab3.md"),
  sidebarLayout(
    sidebar_city_panel_dropdown,
    main_panel_city
  )
)

conclusion_tab <- tabPanel(
  "Conclusion Tab",
  includeMarkdown("conclusion.md"),
)

ui <- navbarPage(
  # Home page title
  "YSSBR Survey Data",
  theme = my_theme,
  intro_tab,
  Viz_tab,
  Bar_tab,
  filter_state_question_tab,
  conclusion_tab
)

