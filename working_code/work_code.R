###############################################################################
# Title:
# Author: Jerrison Li
# Date: Sep 28, 2017
# Version: 1.0
###############################################################################

library(tidyverse)

###############################################################################
# READ DATA
###############################################################################

unzipped_data <- unzip(paste0("/Users/jerrison/Coursera_Submissions/",
                              "Reproducible_Research/RepData_PeerAssessment1/",
                              "activity.zip"))

step_data <- read.csv(unzipped_data, 
                      stringsAsFactors = FALSE)



###############################################################################
# What is mean total number of steps taken per day
###############################################################################

total_steps_per_day_histogram <- ggplot(step_data, 
                                        aes(x = date, weights = steps)) +
  geom_histogram(stat = "count")

total_steps_per_day_histogram


###############################################################################

step_data_by_day <- select(step_data,
                           date,
                           steps) %>%
  group_by(date) %>%
  summarize(steps = sum(steps, na.rm = T))

total_steps_per_day_histogram2 <- ggplot(step_data_by_day, 
                                        aes(x = date, y = steps)) +
  geom_bar(stat = "identity")

total_steps_per_day_histogram2
