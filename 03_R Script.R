library(ggplot2)
library(dplyr)
library(gapminder)

gm_data <- read.csv("gapminder_data.csv")

first_plot <- gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = "red")

#Challenge: Modify the example so that the figure shows how life expectancy has changed over time (“year”, specifically).
gapminder %>% 
  ggplot(aes(x = year, 
             y = lifeExp, 
         colour = continent)) +
  geom_point()

#Challenge: Modify the code from the previous challenge to color the points by the “continent” column. What trends do you see in the data? Are they what you expected?
gapminder %>% 
  ggplot(aes(x = gdpPercap, 
             y = lifeExp,
             colour = continent)) +
  geom_point()

#Line graphs
gapminder %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             colour = continent,
             group = country)) +
  geom_line()

#adding the datapoints to the graph
gapminder %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             colour = continent,
             group = country)) +
  geom_line() + geom_point()

gapminder %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             colour = continent,
             group = country)) +
  geom_line() + geom_point(color = "black")

#the sequence of geom commands matters as the graphs are being layered. ex:

gapminder %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             colour = continent,
             group = country)) +
geom_point(color = "black") + geom_line()

#filtering data to make the graph make more sense

gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             group = country,
             colour = country)) +
  geom_line()

