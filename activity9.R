library(ggplot2)
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.5, size=0.8) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Diamond Price by Carat and Cut", x = "Carat", y = "Price")

library(palmerpenguins)
#Creates box splots for each island, comparing bill length between different species of penguins
ggplot(penguins, aes(x = species, y = bill_length_mm, fill = island)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  geom_jitter(aes(color = island), width = 0.2, alpha = 0.5) +
  labs(title = "Penguin Bill Length by Species and Island", x = "Species", y = "Bill Length (mm)",
       subtitle="The boxplots show the median and quartiles, points show individual penguins")

library(babynames)
library(dplyr)

names <-c("Emma","Noah", "Olivia", "Ethan")
#Filters out names that aren't the selected ones
babynames_filtered <- babynames %>%
  filter(name %in% names) %>%
  group_by(year,name,sex) %>%
  summarise(total=sum(n), .groups='drop')

ggplot(babynames_filtered, aes(x = year, y = total, color = name, linetype = sex)) +
  geom_line(size=1) +
  labs(
    title = "Popularity of Baby Names Over Time",
    x = "Year",
    y = "Total",
    color = "Name",
    linetype = "Sex"
  ) +
  #Creates two separate graphs
  facet_wrap(~sex) +
  theme(
    plot.title=element_text(face="bold", size=14),
    legend.position="top"
  )