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
  fluidPage(theme = shinytheme("simplex"),
  )
)
main_panel_table <- mainPanel(
  "Summary",
  h2("Something about the data"),
  
  h2("Table viz?"),
  plotlyOutput(outputId = "race_suicide_viz"),
  
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
  checkboxGroupInput(
    inputId = "user_selection",
    label = "Questions",
    choices = c("Sample Question 1", "#2", "#3", "#4", "#5"),
    # True allows you to select multiple choices
    selected = "Sample Question 1" 
  ),
  #sliderInput(inputId = "year_selection",
  #            label = h3("Slider"),
  #            min = min(climate_df$year),
  #            max = max(climate_df$year),
  #            sep = "",
  #            value = c(2010, 2020)
  #)
)

# Put a plot in the middle of the page
main_panel_plot <- mainPanel(
  #  plotOutput(outputId = "climate_plot")
  # Make plot interactive
  h2("Spacer"),
  plotlyOutput(outputId = "teen_suicide_viz"),
  h2("Sample"),
  plotlyOutput(outputId = "age_in_YRBSS_data")
  
)

# Plot Tab  - combine sidebar panel and main panel
Question_tab <- tabPanel(
  "Question Viz",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)


ui <- navbarPage(
  # Home page title
  "YSSBR Survey Data",
  intro_tab,
  Question_tab
)
