
download_sb_file <- function(sb_id, sb_names, out_filepath) {
  dir.create(dirname(out_filepath), showWarnings = FALSE)
  # Get the data from ScienceBase
  item_file_download(sb_id, names = sb_names, destinations = out_filepath,
                     overwrite_file = TRUE)
}
