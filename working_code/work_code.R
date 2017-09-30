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

unzipped_data <- unzip(paste0("/Users/jerrison/Coursera_Homework/",
                              "RepData_PeerAssessment1/activity.zip"))

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

###############################################################################
# 
###############################################################################

average_steps_per_interval <- select(step_data,
                                     interval,
                                     steps) %>%
  group_by(interval) %>%
  summarize(days_count = n(),
            total_steps = sum(steps, na.rm = T),
            average_steps = sum(steps, na.rm = T)/n())

average_steps_per_interval

average_steps_per_interval_plot <- ggplot(average_steps_per_interval,
                                          aes(x = interval, y = average_steps)) + 
  geom_line()

average_steps_per_interval_plot

###############################################################################
# 
###############################################################################

