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

#using facet wrap

gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             group = country,
             colour = country)) +
  geom_line() +
  facet_wrap(~country)

#giving titles

gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             group = country,
             colour = country)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Figure 1")

#setting a theme

gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             group = country,
             colour = country)) +
  geom_line(show.legend = FALSE) + #to remove legends if redundant
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Figure 1") +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1))


R_plot <- gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x = year, 
             y = lifeExp,
             group = country,
             colour = country)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Figure 1") +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1))
                                   
#saving the plots
#you can use the GUI to save it but also code.

ggsave(filename = "Result.png", plot = R_plot,
       width = 15,
       height = 20,
       dpi = 500,
       units = "cm")

?geom_boxplot

#Generate box plots to compare life expectancy between the different continents during the available years. 
#(Specifically: x axis as continent, y axis as lifeExp, and fill the boxes using different colors for continents. Facet using year.)
#💡   Hint: Use “fill” in aes function to generate solid boxes.

Plot_2 <- gapminder %>% 
  ggplot(aes(x = continent, 
             y = lifeExp,
             fill = continent
               )) +
  geom_boxplot(show.legend = FALSE) +
  facet_wrap(~year)
  labs(x = "Continent",
       y = "Life Expectancy",
       title = "Figure 1")
  
  Plot_2
  ggsave(filename = "Result2.png", plot = Plot_2,
         width = 20,
         dpi = 500)
  