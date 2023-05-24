# Your Name
# Your email
# Created: 2023-05-24
# Purpose: intro ggplot2


# Libraries ---------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)
library(emoGG)


# Section shortcut --------------------------------------------------------
# Ctrl + Shift + R

# Load data as object
gapminder <- gapminder

# Making a visualization
# Continuous (GDP)
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "orange") +
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 3) 

# Adding emojis: emoGG package
# ggplot(data = gapminder,
#        mapping = aes(x = gdpPercap, y = lifeExp)) +
#   geom_emoji(emoji = "1f940") +
#   scale_x_log10() +
#   geom_smooth(method = "lm", linewidth = 3) 
# comment every line: Ctrl + Shift + C


# Categorical (year)
ggplot(gapminder,
       aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(aes(color = continent)) 

# Visualize Americas only
gapminder %>% # ctrl+shift+m for pipe
  filter(continent == "Americas")

americas <- gapminder %>% 
  filter(continent == "Americas")

# Plot Americas
americas %>% 
ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life expectancy",
       title = "Title")

gapminder %>% 
  filter(continent == "Americas") %>% 
ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life expectancy",
       title = "Title")
