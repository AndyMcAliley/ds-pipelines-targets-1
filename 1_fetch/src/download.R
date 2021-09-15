library(sbtools)

download_data <- function(out_filepath = file.path('1_fetch', 'out', 'model_RMSEs.csv')) {
  dir.create(dirname(out_filepath), showWarnings = FALSE)
  # Get the data from ScienceBase
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv',
                     destinations = out_filepath, overwrite_file = TRUE)
}
