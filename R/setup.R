if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

renv::init()

renv::install("lavaan")

renv::snapshot()
