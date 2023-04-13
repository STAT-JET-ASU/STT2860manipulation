# Powerball script

library(tidyverse)

power1 <- read_csv("data_raw/Lottery_Powerball_Winning_Numbers_Beginning_2010.csv") %>% 
  rename(drawdate = `Draw Date`,
         numbers = `Winning Numbers`,
         multiplier = Multiplier)

power1_clean <- power1 %>%
  separate_wider_delim(
    numbers,
    delim = " ",
    names = c("w1", "w2", "w3", "w4", "w5", "powerball")
  ) %>% 
  mutate(w1 = as.numeric(w1),
         w2 = as.numeric(w2),
         w3 = as.numeric(w3),
         w4 = as.numeric(w4),
         w5 = as.numeric(w5),
         powerball = as.numeric(powerball))