# plan.R

egg_plan <- drake_plan(  # Create a drake_plan object called egg_plan
  
  # 1. Read the dataset
  raw_data = read_ods(
    path = "data/eggs-packers-02may19a.ods",
    sheet = "Packers_Annual",
    skip = 8
  ),  # separate each function with a comma
  
  # 2. Prepare the data with a bespoke function
  # from the functions.R file
  data = clean_data(raw_data),
  
  # 3. Generate a plot using a bespoke function
  # from the functions.R file
  plot = create_plot(data),
  
  # 4. Finally, render the R Markdown report
  # drake::knitr_in() marks the .Rmd file as a dependency
  # drake::file_out() marks the .HTML as an output
  report = rmarkdown::render(
    knitr_in("egg-report.Rmd"),
    output_file = file_out("docs/egg-report.html"),
    quiet = TRUE
  )
  
)
