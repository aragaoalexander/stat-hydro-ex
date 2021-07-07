## This script was developed by Alexander Aragão (aragao.alexander@gmail.com)
## as a statistical hydrology exercise in R.
## The goal of this script is to answer statistical hydrology questions related
## to a synthetic timeseries of flow rate in a fictitious river.
## sections: 
## 0. Setup
## 1. Statistical Hydrology
## 1.1. Annual Totals Series (ATS) Analysis
## 1.2. Annual Maximums Series (AMS) Analysis
## 2. Flow regularization
## 2.1. Long period mean
## 2.2. Surface discharge table
## 2.3. SD Permanence Curve
## 2.4. Reservoir Working Volume
## 3. Design Rainfall
## 3.1. IDF Curves
## 3.2. Design Hietogram

# 0. Setup --------------------------------------------
## Loading necessary packages

library(tidyverse)
library(ggpubr)

## Loading flow data

flow <- read.csv("data/flow.csv")

# 1. Statistical Hydrology --------------------------------------------
# 1.1 Annual Totals Series (ATS) Analysis

# Calculating totals, mean, variance and standard deviation
flow <- flow %>%
  mutate(annual_total = Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dec)

flow %>%
  select(yr, annual_total) %>%
  summarise(annual_total_mean = mean(annual_total), annual_total_var = var(annual_total), annual_total_stdr_dev = sd(annual_total))

# Plotting annual totals

flow %>%
  ggplot()+
  geom_histogram(aes(x = annual_total), bins = 10)+
  theme_minimal() ## Doesn't seem like too much of a normal distribution, but let's test it anyway.


