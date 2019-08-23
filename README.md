# drake-egg-rap

<!-- badges: start -->
[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/matt-dray/drake-egg-rap/master?urlpath=rstudio)
<!-- badges: end -->

Read the accompanying blog: https://www.rostrum.blog/2019/07/23/can-drake-rap/

## Purpose

This repo is for testing [the {drake} package](https://github.com/ropensci/drake) by [Will Landau](https://wlandau.github.io/).

>drake is a pipeline toolkit (https://github.com/pditommaso/awesome-pipeline) and a scalable, R-focused solution for reproducibility and high-performance computing.

## So?

{drake} will probably be helpful for the UK government's [Reproducible Analytical Pipelines](https://ukgovdatascience.github.io/rap-website/) approach to producing statistical publications.

The repo contains a {drake} workflow for creating a demo statistics publication using the [latest UK egg statistics](https://www.gov.uk/government/statistics/egg-statistics) as its input.

## Outputs

The output is an [HTML publication](https://matt-dray.github.io/drake-egg-rap/). You can also see two dependency graphs: [one before changes](https://matt-dray.github.io/drake-egg-rap/dependency-graph.html), and [one after a change was made](https://matt-dray.github.io/drake-egg-rap/dependency-graph-outdated.html) to the plotting code.
