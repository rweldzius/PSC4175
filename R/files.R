
files <- list.files("static/data", recursive = TRUE, full.names = FALSE)

yaml_lines <- c("files:")

for (f in files) {
  yaml_lines <- c(yaml_lines, paste0("  - \"", f, "\""))
}
writeLines(yaml_lines, "data/files.yaml")
