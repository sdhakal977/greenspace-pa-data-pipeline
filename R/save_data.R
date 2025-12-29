# ============================================
# Save final analysis-ready dataset
# ============================================

# Create processed data directory if it doesn't exist
if (!dir.exists("data/processed")) {
  dir.create("data/processed", recursive = TRUE)
}

# Save final dataset as CSV
# Assumes final dataset object is called `final_df`
write.csv(
  final_df,
  file = "data/processed/pa_grnsp_sp.csv",
  row.names = FALSE
)

message("Final dataset saved as data/processed/pa_grnsp_sp.csv")
