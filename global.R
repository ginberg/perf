library(ggplot2)
library(tidyverse)
library(DT)

# Slider properties
SLIDER_MIN_VALUE <- 0
SLIDER_MAX_VALUE <- 300
SLIDER_INIT_VALUE <- 50

FREQ_SLIDER_MIN_VALUE <- 1
FREQ_SLIDER_MAX_VALUE <- 10
FREQ_SLIDER_INIT_VALUE <- 3

# Datatable properties
MAX_ITEMS_PER_PAGE <- SLIDER_INIT_VALUE
TABLE_PAGING <- TRUE
LENGTH_MENU <- c(5, 10, 15, 20, 25, 50, 75, 100, 200, 300)