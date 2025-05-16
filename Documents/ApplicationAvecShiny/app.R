library(shiny)
library(dplyr)
library(lubridate)
library(tidyr)
library(ggplot2)
library(plotly)
library(readr)

getwd()


df <- read.csv("ProgrammingLanguages.csv")

df <- df %>%
  mutate(timestamp = my(Date)) %>%
  select(-Date)

df_long <- df %>%
  pivot_longer(cols = -timestamp, names_to = "language", values_to = "popularity")

language_choices <- unique(df_long$language)
date_start <- min(df_long$timestamp)
date_end <- max(df_long$timestamp)

# UI
ui <- fluidPage(
  titlePanel("Most Popular Programming Languages"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("language", "Language", 
                  choices = language_choices, 
                  selected = c("Python", "R"), 
                  multiple = TRUE),
      dateRangeInput("date_range", "Date Range", 
                     start = date_start, 
                     end = date_end)
    ),
    
    mainPanel(
      plotlyOutput("plot_popularity"),
      plotlyOutput("plot_average_popularity")
    )
  )
)

# Server
server <- function(input, output) {
  
  output$plot_popularity <- renderPlotly({
    req(input$language, input$date_range)
    
    plot_data <- df_long %>%
      filter(language %in% input$language,
             timestamp >= input$date_range[1],
             timestamp <= input$date_range[2])
    
    p <- ggplot(plot_data, aes(x = timestamp, y = popularity, color = language)) +
      geom_line(size = 1.2) +
      labs(title = "Popularity Over Time",
           x = "Date", y = "Popularity") +
      theme_minimal()
    
    ggplotly(p)
  })
  
  output$plot_average_popularity <- renderPlotly({
    req(input$language, input$date_range)
    
    avg_data <- df_long %>%
      filter(language %in% input$language,
             timestamp >= input$date_range[1],
             timestamp <= input$date_range[2]) %>%
      group_by(language) %>%
      summarise(average_popularity = mean(popularity, na.rm = TRUE))
    
    p <- ggplot(avg_data, aes(x = reorder(language, average_popularity), y = average_popularity, fill = language)) +
      geom_col(show.legend = FALSE) +
      coord_flip() +
      labs(title = "Average Popularity",
           x = "Language", y = "Average Popularity") +
      theme_minimal()
    
    ggplotly(p)
  })
}

# Run app
shinyApp(ui = ui, server = server)
