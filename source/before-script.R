## To be loaded before each chapter
rm(list = ls(all = TRUE))
library(knitr)
library(tidyverse)

knitr::opts_chunk$set(
  comment = "#R>",
  collapse = TRUE,
  cache = TRUE,
  fig.align="center",
  fig.pos="t",
  strip.white = TRUE
)
set.seed(2016)
# options(digits = 4)
options(dplyr.print_min = 4, dplyr.print_max = 4)
