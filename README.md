# drake-egg-rap

<!-- badges: start -->
[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/matt-dray/drake-egg-rap/master?urlpath=rstudio)
<!-- badges: end -->

## Purpose

[The {drake} package](https://github.com/ropensci/drake) by [Will Landau](https://wlandau.github.io/) 'is a [pipeline toolkit](https://github.com/pditommaso/awesome-pipeline) and a scalable, R-focused solution for reproducibility and high-performance computing.'

This repo contains a {drake} workflow for creating [a demo statistics publication](https://matt-dray.github.io/drake-egg-rap/egg-report.html) using the [latest UK egg statistics](https://www.gov.uk/government/statistics/egg-statistics) as its input.

[I've written a blog post](https://www.rostrum.blog/2019/07/23/can-drake-rap/) about how {drake} could be helpful for the UK government's [Reproducible Analytical Pipelines](https://ukgovdatascience.github.io/rap-website/) approach to producing statistical publications.

You can launch the contents of this repo in a live browser instance of RStudio by clicking the 'launch binder' badge above ([you can read more about this](https://www.rostrum.blog/2019/08/25/holepunch-drake/)).

## Execution

### tl;dr

In short: 

1. Run `make.R` to execute the workflow that createes the report (in the `docs/` folder).
1. Change stuff.
1. Run `make.R` again to bring everything up to date ({drake} only runs the things that are out-of-date).

### Full process

You need only run the contents of `make.R` to execute the workflow, which will create the output report in the `docs/` folder (intermediate objects are added to the hidden `.drake/` folder).

If you change part of the workflow (e.g. change the chart title in the `create_plot()` function of the `functions.R` script) you don't have to re-run everything, or try to remember exactly which files need to be re-run. {drake} does this for you.

Instead, you can redo `source(functions.R)` and `outdated(egg_plan)` will tell you the files that have been updated or impacted by that update. You can bring up to date by executing `make(egg_plan)` again.

A helpful addition is that you can [visualise the dependency network](https://matt-dray.github.io/drake-egg-rap/dependency-graph.html) (and its [outdated version](https://matt-dray.github.io/drake-egg-rap/dependency-graph-outdated.html)) by passing the `drake_config()` object to `vis_drake_graph()` (code is supplied for this in `make.R` file).

## File structure

For purposes of recreating this demo, the relevant file structure is as follows:

```
drake-egg-rap/
├── .drake/
├── R/
│   ├── functions.R
│   ├── packages.R
│   └── plan.R
├── data/
│   └── eggs-packers-02may19a.ods
├── docs/
├── drake-egg-rap.Rproj
├── egg-report.Rmd
└── make.R
```

All other files and folders are related to git, GitHub or Binder and can be ignored.

You can download a clean {drake} project template with `drake_example("main")`.