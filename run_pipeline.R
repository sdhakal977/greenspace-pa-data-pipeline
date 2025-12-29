# ============================================================
# Greenspace–Physical Activity Data Pipeline
# Entry point for data preparation workflow
# ============================================================

message("Starting data preparation pipeline...")

# Load packages
source("R/load_packages.R")

# Load raw data
source("R/read_data.R")

# Clean greenspace
source("R/clean_greenspace.R")
grnsp <- compute_greenspace_exposure(grnsp)

# Prepare PA data
source("R/prepare_pa_data.R")

# Merge datasets
source("R/merge_data.R")

# Recode variables
source("R/recode_variables.R")

# Save final dataset
source("R/save_data.R")

message("Pipeline completed successfully.")


