# R/prepare_pa_data.R
# Purpose: Prepare and summarize physical activity data
# Input object: pa
# Output object: pa_sub_filtered


# Subset relevant columns
pa_sub <- pa[, c(1:4, 19, 18, 17)]


# Reformat date and time
pa_sub <- pa_sub %>%
  mutate(start_date = as.Date(start_date, "%Y-%m-%d"),
         end_date = as.Date(end_date, "%Y-%m-%d"),
         start_time = chron(times = start_time),
         end_time = chron(times = newendtime)) %>%
  select(1:4, 8, 7, 6)


# Sort data by SubjectID
pa_sub <- pa_sub[order(pa_sub$SubjectID), ]


# Convert start_time to proper time format
pa_sub <- pa_sub %>%
  mutate(start_time = hms(start_time))


# Filter data between 08:00:00 and 22:00:00
pa_sub_filtered <- pa_sub %>%
  filter(start_time >= hms("08:00:00") & start_time < hms("22:00:00"))


# Summarize total steps per subject per day
daily_steps <- pa_sub_filtered %>%
  group_by(SubjectID, start_date) %>%
  summarise(total_steps = sum(newsteps, na.rm = TRUE), .groups = "drop")


# Summarize wear time per subject per day
daily_wear_time <- pa_sub_filtered %>%
  group_by(SubjectID, start_date, start_time) %>%
  summarise(wear_time_per_interval = first(newdurationInSeconds), .groups = "drop") %>%
  group_by(SubjectID, start_date) %>%
  summarise(wear_t_hr = round(sum(wear_time_per_interval, na.rm = TRUE) / 3600, 2),
            .groups = "drop")


# Merge summaries back into filtered dataset
pa_sub_filtered <- pa_sub_filtered %>%
  distinct(SubjectID, start_date, .keep_all = TRUE) %>%
  left_join(daily_wear_time, by = c("SubjectID", "start_date")) %>%
  left_join(daily_steps, by = c("SubjectID", "start_date"))


# Keep only required columns
pa_sub_filtered <- pa_sub_filtered[, c(1, 2, 8, 9)]

