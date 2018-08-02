source('functions/setup.R')
library(readr)
library(dplyr)

list.files('data')

sheltered_path <- 'data/sheltered_data_aggregate_shared.csv'
unsheltered_path <- 'data/unsheltered_data_aggregate_shared.csv'

shell.exec(file.path(getwd(), sheltered_path))
shell.exec(file.path(getwd(), unsheltered_path))

sheltered <- read_csv(sheltered_path)
unsheltered <- read_csv(unsheltered_path)

glimpse(sheltered)
glimpse(unsheltered)

dim(sheltered)
dim(unsheltered)
