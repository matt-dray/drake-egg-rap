# make.R
# Walkthrough: https://ropenscilabs.github.io/drake-manual/walkthrough.html
# Download a project template (as used in this demo) with drake_example("main")


# 1. Make -----------------------------------------------------------------


# Load your packages and supporting functions into your session.
source("R/packages.R")  # Load packages
source("R/functions.R") # Custom functions used in the plan
source("R/plan.R")      # Create your drake plan

# Call make() to run your work
make(egg_plan)

# Your targets will be stored in a hidden .drake/ cache and you can read them
# back into memory with loadd() and readd()

# Generate a config file of your plan (a list object that stores info about
# your plan)
egg_config <- drake_config(egg_plan)


# 2. Visualise (optional) -------------------------------------------------


# Use the config file to generate a interactive dependency graph 
vis_drake_graph(egg_config)


# 3. Make changes ---------------------------------------------------------


# Continue to work on your files, then source() them again (section 1, above)

# Print out-of-date files and impacted dependencies
outdated(egg_config)

# Recreate the dependency graph to see this visually
vis_drake_graph(egg_config)

# Bring the workflow up to date
make(egg_plan)