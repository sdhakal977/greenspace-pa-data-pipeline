# Compute greenspace exposure metrics
# ----------------------------------
# grn_exp:
#   - total_green minus other_green
#   - represents minutes spent in relevant greenspace
#
# gps_t_min:
#   - total tracked GPS time in minutes
#   - excludes "other" green and gray categories
#
# Input:
#   df : data frame with greenspace exposure variables
#
# Output:
#   same data frame with added:
#     - grn_exp
#     - gps_t_min

compute_greenspace_exposure <- function(df) {
  df %>%
    dplyr::mutate(
      grn_exp = total_green - other_green,
      gps_t_min = (total_green + total_gray) -
        (other_green + other_gray)
    )
}
