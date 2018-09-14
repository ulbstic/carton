library(readxl)
library(tidyverse)
carton_categories <- read_excel("carton_categories.xlsx", 
                                col_names = FALSE)
View(carton_categories)

carton_categories <- carton_categories %>%
  mutate(pct = X__2 / sum(X__2))



ggplot(data=carton_categories, aes(x=X__1, y=X__2, fill=X__1, label = paste0(round(pct*100), "%"))) +
  geom_bar(stat="identity") + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    axis.text.x = element_text(angle = 20, face="bold"), 
    panel.background = element_rect(fill = "gray90")) +labs(x = NULL, y = NULL) + theme(legend.position = "none") +
  geom_text(position = position_stack(vjust = .5)) + theme(axis.title = element_text(size = 14), 
    axis.text.x = element_text(size = 14)) +labs(size = 15) + theme(axis.text.x = element_text(size = 12))

