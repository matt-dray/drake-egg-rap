# make.R

# Walkthrough: https://ropenscilabs.github.io/drake-manual/walkthrough.html
# Download a project template (as used in this demo) with drake_example("main")


# Make --------------------------------------------------------------------


# Load your packages and supporting functions into your session.
source("R/packages.R")  # Load your packages, e.g. library(drake).
source("R/functions.R") # Define your custom code as a bunch of functions.
source("R/plan.R")      # Create your drake plan.

# Call make() to run your work.
# Your targets will be stored in a hidden .drake/ cache,
# and you can read them back into memory with loadd() and readd().
make(egg_plan)


# Visualise ---------------------------------------------------------------


# Optionally, you can visualise the dependency network interactively

# Make a config file of your plan (this creates egg_config$graph for plotting)
# egg_config <- drake_config(egg_plan)

# Use the config file to generate a interactive dependency graph 
# dependency_graph <- vis_drake_graph(egg_config)


# Make changes ------------------------------------------------------------


# Continue to work on your files, then source() them again
# outdated(egg_config) will print out-of-date files and impacted dependencies
# Recreate the dependency graph to see this visually
# Run make(egg_plan) again to bring the workflow up to date