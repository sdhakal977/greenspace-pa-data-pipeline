# R/read_data.R

# This script loads raw datasets.
# Note: Original CSVs are not included in this repo. 
# Replace "your_csv_file.csv" with actual file names if running locally.

# Survey/Profile dataset
spe <- read.csv("data/raw/survey_profile.csv", header = TRUE)

# Greenspace exposure dataset
grnsp <- read.csv("data/raw/greenspace_exposure.csv", header = TRUE)

# Physical activity dataset
pa <- read.csv("data/raw/physical_activity.csv", header = TRUE)
