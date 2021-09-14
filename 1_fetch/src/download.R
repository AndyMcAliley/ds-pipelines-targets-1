library(sbtools)

download_data <- function(output_dir = file.path('1_fetch', 'out')) {
  dir.create(output_dir, showWarnings = FALSE)
  # Get the data from ScienceBase
  mendota_file <- file.path(output_dir, 'model_RMSEs.csv')
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
}