install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")

library(tidyverse)
library(dplyr)
library(ggplot2)

World_cup <- read_csv("./World_cup.csv")

summary(World_cup)

Winner <- World_cup %>% group_by(CHAMPION) %>% summarise(No_win = n())

Second_place <- World_cup %>% group_by(`RUNNER_UP`) %>% summarise(No = n ())

Third <- World_cup %>% group_by(`THIRD_PLACE`) %>% summarise(No = n ())

H_N_W <- World_cup %>% select(YEAR, HOST, CHAMPION) %>%
  filter(HOST == CHAMPION)
  
Country <- World_cup %>% group_by(HOST) %>% summarise(No = n ())

ggplot(data = Winner, aes(x = CHAMPION, y = No_win, fill = CHAMPION)) + 
  geom_bar(stat = "identity") +
  ggtitle(expression("Winner per countries"), "") + 
  theme(plot.title = element_text(size = 20, color = "gold", hjust = .50))  
  
ggplot(data = Second_place, aes(y = RUNNER_UP, x = No, color = RUNNER_UP, size = 3)) + 
  geom_point(stat = "identity") + 
  ggtitle(expression("Runner up per countries"), "") + 
  theme(plot.title = element_text(size = 20, color = "darkorange", hjust = .50))

ggplot(data = Third, aes(y = THIRD_PLACE, x = No, fill = No )) + 
  geom_col() +
  ggtitle(expression("Third place per countries"), "") + 
  theme(plot.title = element_text(size = 20, color = "darkgreen", hjust = .50))

ggplot(data = Country, aes(y = HOST, x = No, fill = HOST)) + 
  geom_bar(stat = "identity") + 
  ggtitle(expression("Host the world cup up"), "") + 
  theme(plot.title = element_text(size = 20, color = "darkblue", hjust = .50))






  