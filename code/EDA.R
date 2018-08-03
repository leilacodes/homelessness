source('functions/project_setup.R')
source('functions/utility_functions.R')
source('code/import data.R')

dim(s16)
dim(s17)

# What columns in common?
intersect(x = names(s16), y = names(s17))

# any ids in common?
common_ids <- intersect(x = s16$application_id, y = s17$application_id)
length(common_ids)

# Many, but are they the same person?
comp <- s16 %>%  
  inner_join(s17,
             by = "application_id", 
             suffix = c("_16", "_17")) %>% 
  mutate(gender_match = gender_16 == gender_17,
         birth_match = birth_year_16 == birth_year_17,
         age_match = age_17 - age_16 <= 1,
         race_match = race_recode_16 == race_recode_17) %>% 
  alphabetize_cols()

comp %>% View()
mean(comp$age_match)
comp %>% filter((gender_match == FALSE | birth_match == FALSE),
                age_match == TRUE)
# Not same person
s16 %>% filter(application_id == "22243") %>% t()
s17 %>% filter(application_id == "22243") %>% t()

# Same person
s16 %>% filter(application_id == "4496101") %>% t()
s17 %>% filter(application_id == "4496101") %>% t()

# What columns not in common?
setdiff(names(s17), names(s16))
setdiff(names(s16), names(s17))

firstlook(s16)
firstlook(s17)

graph_freqs(s16, cutoff = 10)

graph_freqs(s17, cutoff = 2,
            varlist = intersect(x = names(s16), 
                                y = names(s17)))

freq(vector = s16$race_full)
freq(vector = s16$race_recode)

# How was race recoded?
table(s16$race_full, s16$race_recode) %>% 
  as.data.frame() %>% 
  filter(Freq != 0) %>% View()


