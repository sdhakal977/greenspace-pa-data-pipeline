# Greenspace–Physical Activity Data Pipeline



## Project Overview

This project creates a **clean, analysis-ready dataset** by merging greenspace exposure, physical activity, and participant profile data.  

The dataset is **longitudinal**, collected over more than one year, with covariates recorded at both **daily and hourly scales**. Specifically, the pipeline:



- Reads and cleans **greenspace exposure data**.

- Processes **physical activity data** to standardize variables and handle missing values.

- Integrates **participant profile dataset** (e.g., demographic and other covariate data) with greenspace exposure and physical activity data.

- Merges all datasets into a single, longitudinal dataset covering more than one year, with both daily and hourly variables.

- Recodes variables and creates derived metrics for downstream analysis.

- Outputs a fully processed dataset ready for downstream statistical modeling and visualization.
<br>
The pipeline is fully reproducible and structured to separate **exploratory analysis** (in notebooks) from **automated data preparation** (via scripts).

## Structure

greenspace-pa-data-pipeline

├── README.md

├── run\_pipeline.R

├── data/

│   ├── raw/               # raw data (not included)

│   └── processed/         # processed data

├── R/

│   ├── load\_packages.R

│   ├── read\_data.R

│   ├── clean\_greenspace.R

│   ├── prepare\_pa\_data.R

│   ├── merge\_data.R

│   ├── recode\_variables.R

│   └── save\_data.

├── notebooks/

│   └── 01\_prepare\_dataset.Rmd

└── config/

&nbsp;   └── (any configuration files if needed)



## Reproducibility

- Raw data is **not included** in this repository. Place your raw CSVs in `data/raw/`.

- Run the pipeline via `run_pipeline.R`:



```r

source("run_pipeline.R")

```



**The pipeline automatically:**

- Loads required packages

- Reads raw data

- Cleans greenspace exposure data

- Prepares physical activity data

- Merges the three datasets: greenspace, physical activity, and participant profile dataset

- Recodes variables

- Saves final processed data


**Notes for Reviewers**

- The notebook `notebooks/01_prepare_dataset.Rmd` contains exploratory analyses.

- The pipeline merges **three datasets**: greenspace, physical activity, and participant profile dataset.

- All scripts in `R/` are sourced in `run_pipeline.R`.

- Processed outputs may be in `data/processed/` if you run the pipeline locally.

- Raw data is excluded.



