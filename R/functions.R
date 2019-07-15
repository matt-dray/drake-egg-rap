# functions.R

clean_data <- function(raw_data) {
  
  clean_data <- raw_data %>% 
    clean_names() %>% 
    select(year, enriched, barn, free_range, organic) %>% 
    slice(1:23) %>%
    mutate(year = as.numeric(year)) %>% 
    gather(key = "production_method", value = "thousand_cases", -year) %>% 
    as_tibble()
  
  return(clean_data)
  
}

create_plot <- function(data) {
  
  plot <- data %>% 
    mutate(label = if_else(year == max(year), production_method, NA_character_)) %>% 
    ggplot(aes(x = year, y = thousand_cases, color = production_method)) +
    geom_line(show.legend = FALSE, size = 1.5, na.rm = TRUE) +
    geom_text(aes(x = 2010, y = 16000, label = "Enriched (intensive)", color = "enriched"), check_overlap = TRUE, show.legend = FALSE) + 
    geom_text(aes(x = 2013, y = 10000, label = "Free range", color = "free_range"), check_overlap = TRUE, show.legend = FALSE) + 
    geom_text(aes(x = 2004, y = 3000, label = "Barn", color = "barn"), check_overlap = TRUE, show.legend = FALSE) + 
    geom_text(aes(x = 2012, y = 3000, label = "Organic", color = "organic"), check_overlap = TRUE, show.legend = FALSE) + 
    labs(
      title = "UK egg throughput by production method",
      subtitle = "Free range has overtaken enriched throughput",
      x = "",
      y = "Thousand cases"
    ) +
    theme_minimal()
  
  print(plot)
  
}
