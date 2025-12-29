# R/merge_data.R
# --------------
# Merge physical activity, greenspace exposure,
# and survey profile datasets
#
# Input:
#   pa_sub_filtered : prepared physical activity data
#   grnsp           : greenspace exposure data
#   spe             : survey profile data
#
# Output:
#   final_df        : merged dataset



# Subset greenspace exposure data
# Keep only SubjectID, date, grn_exp, and gps_t_min
grnsp_sub <- grnsp[, c(2, 3, 20, 21)]


# Ensure date formats match
pa_sub_filtered <- pa_sub_filtered %>%
  mutate(start_date = as.Date(start_date))


grnsp_sub <- grnsp_sub %>%
  mutate(date = as.Date(date))


# Merge greenspace exposure with physical activity data
merged_df <- pa_sub_filtered %>%
  left_join(
    grnsp_sub,
    by = c("SubjectID" = "SubjectID",
           "start_date" = "date")
  )


# Clean survey profile data
spe_clean <- spe %>%
  select(-birth_date, -recruited_by, -recruited_by_code)

spe_clean <- spe_clean %>%
  select(SubjectID, enrollment_date, age, everything())

spe_clean <- spe_clean %>%
  dplyr::rename(enrl_date = enrollment_date)

spe_clean <- spe_clean %>%
  mutate(enrl_date = as.Date(enrl_date, "%Y-%m-%d"))


# Merge survey profile data
final_df <- merged_df %>%
  left_join(spe_clean, by = "SubjectID")


# Rearrange columns
final_df <- final_df[, c(1, 7, 2:6, 8:22)]
