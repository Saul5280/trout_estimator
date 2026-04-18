# Colorado Trout Weight Estimator

A Shiny web application that estimates trout weight from length and gives a keeper/release verdict based on Colorado's 12-inch minimum.

## What It Does

Enter a fish length and select a species. The app calculates estimated weight using standard fisheries length-weight formulas and plots where your fish falls on the curve. Built around the kind of fishing I do at Montgomery Reservoir in Park County, CO.

## Species Supported

- Rainbow Trout
- Brown Trout
- Brook Trout

## How to Run Locally

```r
install.packages("shiny")
library(shiny)
runApp()
```

## Live App

[https://jbailey5280.shinyapps.io/trout_estimator/](https://jbailey5280.shinyapps.io/trout_estimator/)

## Files

- `ui.R` — layout and input widgets
- `server.R` — weight calculations and reactive plot
- `pitch.Rmd` — 5-slide reproducible pitch presentation

## Background

Built as the final course project for **Developing Data Products** (Johns Hopkins Data Science Specialization via Coursera). The course covers building interactive data products in R using Shiny, Plotly, Leaflet, and R Markdown. This app applies those tools to something I actually care about.
