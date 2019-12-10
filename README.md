# drake-egg-rap

<!-- badges: start -->
[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/matt-dray/drake-egg-rap/master?urlpath=rstudio)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2019/07/23/can-drake-rap/)
<!-- badges: end -->

## Purpose

[The {drake} package](https://github.com/ropensci/drake) by [Will Landau](https://wlandau.github.io/) 'is a [pipeline toolkit](https://github.com/pditommaso/awesome-pipeline) and a scalable, R-focused solution for reproducibility and high-performance computing.' Tagline: 'what gets done stays done'.

This repo contains a {drake} workflow for creating [a demo statistics publication](https://matt-dray.github.io/drake-egg-rap/egg-report.html) using the [latest UK egg statistics](https://www.gov.uk/government/statistics/egg-statistics) as its input.

You can:

* read [my blog post](https://www.rostrum.blog/2019/07/23/can-drake-rap/) about how {drake} could be helpful for the UK government's [Reproducible Analytical Pipelines](https://ukgovdatascience.github.io/rap-website/) approach to producing statistical publications
* launch the contents of this repo in a live browser instance of RStudio by clicking the 'launch binder' badge above ([read another blog post about why this is awesome](https://www.rostrum.blog/2019/08/25/holepunch-drake/)
* take a look at [a presentation I gave about {drake}](https://github.com/matt-dray/drake-egg-rap/blob/master/docs/drake-presentation.pdf) at a couple of cross-government [Coffee & Coding](https://ukgovdatascience.github.io/rap-website/resource-coffee-and-coding.html) events
* download or clone this repo to serve as the basis for your own {drake} pipeline
* download a clean {drake} project template example with `drake::drake_example("main")`.

## Execution

### tl;dr

In short: 

1. Run `make.R` to execute the workflow that creates the report
1. Change stuff
1. Run `make.R` again to bring everything up to date ({drake} only runs the things that are out-of-date)

### Full process

You need only run the contents of `make.R` to execute the workflow, which will source files from `R/` and `Rmd/` folders and create the output report in the `Rmd/` folder (intermediate objects are added to the hidden `.drake/` folder).

If you change part of the workflow (e.g. change the chart title in the `create_plot()` function of the `functions.R` script) you don't have to re-run everything, or try to remember exactly which files need to be re-run. {drake} does this for you.

Instead, you can redo `source(functions.R)` and `outdated(egg_plan)` will tell you the files that have been updated or impacted by that update. You can bring up to date by executing `make(egg_plan)` again.

A helpful addition is that you can [visualise the dependency network](https://matt-dray.github.io/drake-egg-rap/dependency-graph.html) (and its [outdated version](https://matt-dray.github.io/drake-egg-rap/dependency-graph-outdated.html)) by passing the `drake_config()` object to `vis_drake_graph()` (code is supplied for this in `make.R` file).

## File structure

For purposes of recreating this demo, the relevant file structure is as follows:

```
drake-egg-rap/
├── .drake/
├── data/
│   └── eggs-packers-02may19a.ods
├── egg-report.Rmd
├── R/
│   ├── functions.R
│   ├── packages.R
│   └── plan.R
└── make.R
```

All other files and folders are related to git, GitHub or Binder and can be ignored. It might be helpful to use the 'drake-egg-rap.Rproj' file if you're familiar with RStudio Projects.
