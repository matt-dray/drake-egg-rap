# plan.R

plan <- drake_plan(
  
  raw_data = read_ods(
    path = "data/eggs-packers-02may19a.ods",
    sheet = "Packers_Annual",
    skip = 8
  ),
  
  data = clean_data(raw_data),
  
  plot = create_plot(data),
  
  report = render(
    knitr_in("egg-report.Rmd"),
    output_file = file_out("docs/egg-report.html"),
    quiet = TRUE
  )

)
