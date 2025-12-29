# R/recode_variables.R
# -------------------
# Add temporal labels and recode variables
#
# Input:
#   final_df : merged dataset
#
# Output:
#   final_df : recoded and analysis-ready dataset


# Add weekday labels
final_df$wk_day <- wday(final_df$start_date, label = TRUE)

# Rearrange columns
final_df <- final_df[, c(1:3, 23, 4:22)]


# Add season labels
final_df <- final_df %>%
  mutate(season = case_when(
    month(start_date) %in% c(12, 1, 2) ~ "w",
    month(start_date) %in% c(3, 4, 5) ~ "sp",
    month(start_date) %in% c(6, 7, 8) ~ "sum",
    month(start_date) %in% c(9, 10, 11) ~ "aut"
  ))

# Rearrange columns
final_df <- final_df[, c(1:4, 24, 5:23)]


# Recategorize employment
final_df <- final_df %>%
  mutate(employment = case_when(
    employment %in% c("employed", "self-employed") ~ "working",
    employment %in% c("retired", "student", "other") ~ "not_working",
    TRUE ~ NA_character_
  ))


# Recategorize income
final_df <- final_df %>%
  mutate(income = case_when(
    income %in% c("<10K", "10-20K", "20-30K") ~ "low",
    income %in% c("30-50K", "50-75K") ~ "high",
    TRUE ~ NA_character_
  ))


# Recategorize education
final_df <- final_df %>%
  mutate(education = case_when(
    education %in% c("bachelor", "master", "phd") ~ "higher_ed",
    education %in% c("elementary", "secondary") ~ "lower_ed",
    TRUE ~ NA_character_
  ))


# Recategorize working from home
final_df <- final_df %>%
  mutate(remote_work = case_when(
    work_from_home == "0%" ~ "no",
    work_from_home %in% c("1% - 20%", "21% - 40%", "41% - 60%") ~ "low",
    work_from_home %in% c("61% - 80%", "81% - 100%") ~ "high",
    TRUE ~ NA_character_
  ))


# Final column selection
final_df <- final_df[, c(1:11, 23, 13, 21, 25)]


# Rename start_date to date
final_df <- final_df %>%
  dplyr::rename(date = start_date)


# Sort by SubjectID and date
final_df <- final_df %>%
  arrange(SubjectID, date)
