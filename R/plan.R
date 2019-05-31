# plan.R

plan <- drake_plan(
  
  raw_data = read_ods(
    path = "eggs-packers-02may19a.ods",
    sheet = "Packers_Annual",
    skip = 8
  ),
  
  data = clean_data(raw_data),
  
  plot = create_plot(data),
  
  report = rmarkdown::render(
    knitr_in("index.Rmd"),
    output_file = file_out("index.html"),
    quiet = TRUE
  )

)
