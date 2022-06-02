library(tidyverse)
library(rvest)

# Wikipedia article to scrape
url = "https://en.wikipedia.org/w/index.php?title=2009_swine_flu_pandemic_tables&oldid=950511922"

# Extract all tables in the page
tab = read_html(url) %>% html_nodes("table")

# Variable names to use for the table of case counts
case_names = c("by_date", "by_continent", "country", "first_case",
               "Apr", "May", "Jun", "Jul", "Aug", "latest")
# Variable names to use for the table of death counts
death_names = c("by_date", "by_continent", "country", "first_death",
                "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

cases_df = tab %>% .[1] %>% html_table %>% .[[1]] %>% setNames(case_names)
deaths_df = tab %>% .[2] %>% html_table %>% .[[1]] %>% setNames(death_names)

save(cases_df, deaths_df, file = "h1n1_wiki_tables.rData")
