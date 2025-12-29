# R/load_packages.R

# Install pacman if not installed
if (!require("pacman")) install.packages("pacman")

# Load packages
pacman::p_load(
  tidyverse,   # Data wrangling & visualization
  lessR,       # Utility functions
  DescTools,   # Summary stats
  kableExtra,  # Table formatting
  lubridate,   # Date/time handling
  chron,       # Time handling
  sf,          # Spatial data
  leaflet,     # Interactive maps
  ggplot2      # Data visualization
)
