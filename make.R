# make.R

# Walkthrough: https://ropenscilabs.github.io/drake-manual/intro.html

# Load your packages and supporting functions into your session.
# If you use supporting scripts like the ones below,
# you will need to supply them yourself. Examples:
# https://github.com/wlandau/drake-examples/tree/master/main/R

source("R/packages.R")  # Load your packages, e.g. library(drake).
source("R/functions.R") # Define your custom code as a bunch of functions.
source("R/plan.R")      # Create your drake plan.

# Call make() to run your work.
# Your targets will be stored in a hidden .drake/ cache,
# and you can read them back into memory with loadd() and readd().

make(egg_plan)

# Make a config file of your plan

egg_config <- drake_config(egg_plan)

# Pass the config to a function for generating an interactive dependency graph 

dependency_graph <- vis_drake_graph(egg_config)

# Continue to work on your files, then source() them again
# outdated(egg_config) will print out-of-date files and impacted dependencies
# Recreate the dependency graph to see this visually