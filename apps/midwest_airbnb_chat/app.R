# ISA 401 Midwest Airbnb chat: ask questions, get SQL, a table, or a chart back
library(shiny)
library(bslib)
library(querychat)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat(
  con, "listings",
  client             = client,
  tools              = c("filter", "query", "visualize"),
  greeting           = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)


#ChatISA helped me with this part as I couldn't find the source for the side-panel code from class 6.
ui = page_sidebar(
  title = "Midwest Airbnb Explorer",
  theme = bs_theme(preset = "flatly", primary = "#B4592C"),
  sidebar = qc$sidebar(),
  h4("About this app"),
  p("Data from Inside Airbnb: 14,887 listings in Chicago (2026-07-20), Columbus (2026-07-23), and the Twin Cities (2026-07-21). Built by Camryn Yoder for ISA 401."),
  qc$ui()
)

server = function(input, output, session) {
  qc$server()
}

shinyApp(ui, server)