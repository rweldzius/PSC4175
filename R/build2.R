# R/delete_copied_rmds.R
library(here)
library(fs)

# --- Function to delete .Rmd files from a directory ---
delete_copied_rmds <- function(target_dir) {
  # Check if the target directory exists
  if (!dir_exists(target_dir)) {
    message("Directory does not exist, nothing to delete: ", target_dir)
    return(invisible())
  }
  
  # Find all files ending in .Rmd in the target directory
  rmd_files_to_delete <- dir_ls(target_dir, glob = "*.Rmd")
  html_files_to_delete <- dir_ls(target_dir, glob = "*.html")
  
  if (length(rmd_files_to_delete) > 0) {
    # Delete the files
    file_delete(rmd_files_to_delete)
    # Print a confirmation message
    message("Deleted ", length(rmd_files_to_delete), " .Rmd file(s) from: ", target_dir)
  } else {
    message("No .Rmd files to delete in: ", target_dir)
  }
  
  if (length(html_files_to_delete) > 0) {
    # Delete the files
    file_delete(html_files_to_delete)
    # Print a confirmation message
    message("Deleted ", length(html_files_to_delete), " .html file(s) from: ", target_dir)
  } else {
    message("No .html files to delete in: ", target_dir)
  }
}

# --- Run the function on the target directories ---
delete_copied_rmds(here("static", "homeworks"))
delete_copied_rmds(here("static", "problemsets"))