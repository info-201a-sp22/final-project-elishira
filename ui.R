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
  plotlyOutput(outputId = "question_viz")
)
sidebar_panel_dropdown <- sidebarPanel(
  
  selectInput(inputId = "user_selection", label = h3("Select Question"), 
              choices = c("ever_sexual_intercourse", "ever_cig_use", "current_cig_use", "attemped_suicide", "ever_alc_use", "ever_marijuana_use", "ever_cocaine_use"), 
              selected = 1, 
              multiple = F
  # True allows you to select multiple choices
   
  )
)

Viz_tab <- tabPanel(
  "Viz tab",
  sidebarLayout(
    sidebar_panel_dropdown,
    main_panel_questions
  )
)

ui <- navbarPage(
  # Home page title
  "YSSBR Survey Data",
  intro_tab,
  Plot_tab,
  Viz_tab
)

