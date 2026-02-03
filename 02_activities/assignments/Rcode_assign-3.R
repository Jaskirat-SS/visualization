library(tidyverse)
library(ggplot2)
df<-read.csv("mushroom_2.csv")
# Create decade column
df$Decade <- factor((df$Year %/% 10) * 10)

# Create the plot
ggplot(df, aes(x = Decade, y = Value_dollars)) +
  geom_boxplot(fill = "#C6E2FF", alpha = 0.7, 
               color = "black", width = 0.6,
               outlier.shape = 1) +
  stat_summary(fun = mean, geom = "point", 
               shape = 23, size = 3, 
               fill = "green", color = "black") +
  labs(title = "Distribution of Economic Value by Decade",
       x = "Decade",
       y = "Economic Value ($000)") +
  scale_x_discrete(labels = function(x) paste0(x, "s")) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 12, hjust = 0.5),
    axis.title = element_text(face = "bold", size = 11),
    axis.text = element_text(size = 10),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(color = "black")
  )
ggsave("Rplot.jpg", plot = p, width = 6, height = 4, units = "in", dpi = 300)