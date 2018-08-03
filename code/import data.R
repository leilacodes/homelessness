list.files('data')
# shell.exec(file.path(getwd(), sheltered_path))
# shell.exec(file.path(getwd(), unsheltered_path))

# Import sheltered data from 2016 and 20s17

s16 <- read_csv('data/2016_Sheltered.csv',
                col_types = c('idccccciccccciiicciiiiiiiiiiiiiiicic')) %>%
  janitor::clean_names()

glimpse(s16)

s17 <- read_csv('data/2017_Sheltered.csv', 
                col_types =cols(Application_ID = col_character())) %>%
  janitor::clean_names()

glimpse(s17)