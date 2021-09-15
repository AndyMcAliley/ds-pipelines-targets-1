library(targets)
source("1_fetch/src/download.R")
source("2_process/src/load.R")
source("3_visualize/src/plot.R")

tar_option_set(packages = c("tidyverse", "sbtools", "whisker", "dplyr"))

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    download_data(out_filepath = "1_fetch/out/model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    load_RMSE(in_filepath = model_RMSEs_csv),
    packages = c("readr", "stringr")
  ),
  # Create a plot
  tar_target(
    test_RMSE_png,
    plot_test_RMSE(eval_data, out_filepath = "3_visualize/out/test_RMSE.png"), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    save_RMSE_csv(eval_data, out_filepath = "2_process/out/model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    save_model_diagnostics(eval_data, out_filepath = "2_process/out/model_diagnostic_text.txt"), 
    format = "file"
  )
)
