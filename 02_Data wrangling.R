#install package using install.packages(") and the package you want within the bracket and quotes
#run packages you want with library()
#detach a package you no longer want to use now with detach("package:") command.
library(dplyr)
library(ggplot2)
library(gapminder)
gapminder

download.file(url = "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", 
              destfile = "gapminder_data.csv")

gm_data <- read.csv("gapminder_data.csv") #read.csv to read a csv file already in the project folder.

str(gm_data) # see the type of dataframe you have created
tibble(gm_data$country) #prints the first 10 rows of what ever you are commanding.
#you can also use commands like head (reads first 6 rows) or tail (reads last 6 rows)
#to visualise the dataframe you are using. The $ function is part of dplyr.

head(gm_data)
ncol(gm_data) #shows no. of columns, nrow, the no. of rows
colnames(gm_data)
summary(gm_data)

#some more dplyr
select(gm_data, year, country, gdpPercap)

select(gm_data, -lifeExp) #the - before the column denotes that you want to exclude it. 

#this command

select(gm_data, year, country, gdpPercap)

#is this with pipes |> or %>% (use command + shift + m)

gm_data %>% 
  select(year, country, gdpPercap)

gm_data %>% 
  select(-lifeExp) %>% 
  tibble()

#Filtering observations

gm_EU <- gm_data %>%
  filter(continent == "Europe")

head(gm_EU)

gm_EU %>% 
  distinct(continent) #distinct will tell you how many and what distinct values are there in this column.

gm_data %>% 
  distinct(continent)

#filtering multiple columns

eu2002 <- gm_data %>% 
  filter(continent == "Europe", 
         year == 2002)

eu_mult_year <- gm_data %>% 
  filter(year == 2002 | year == 2007)

tibble(eu_mult_year)

#another way to pick different values without repeating inside filter with |

gm_data %>% 
  filter(year %in% c(2002, 2007)) %>% 
  distinct(year)

#the order inside pipes matters!! Keep in mind before doing multiple pipes.

gm_data %>% 
  filter(country != "Germany") %>%  #this will filter and exclude Germany from countries
  distinct(country)

#challenge time :D

Africa <- gm_data %>% 
  filter(continent == "Africa") %>% 
  select(country, lifeExp, year)
nrow(Africa) 

#has 624 rows
Africa %>% 
  distinct(country)
Africa %>% 
  distinct(year)
52*12

#so we have 624 rows, as we have 52 countries and 12 years.

#summarize your data

gm_data %>% 
  summarize(mean_gdp = mean(gdpPercap),
            median_gdp = median(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap))

#Grouping data to make analysis easy and more sensible

gm_data %>% 
  group_by(continent, year) %>%
  summarize(mean_gdp = mean(gdpPercap),
            median_gdp = median(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap))

#you can group by different things separated by comma on the command. Ex. group_by(hbsdhj, kjfdj)
#the order here matters as the first column in group by is the first column of the resulting table and so on.

#Challenge 2: Calculate the average life expectancy per country. 
#Which has the longest average life expectancy and which has the shortest average life expectancy?

Life_Exp <- gm_data %>% 
  summarize(mean_lifeExp = mean(lifeExp))
 tibble(Life_Exp)   
 
Life_Exp %>% 
  slice_max(mean_lifeExp)

Life_Exp %>% 
  slice_min(mean_lifeExp)

#you can also add another argument called n to give say top 10 life expectancy rows.

Life_Exp %>% 
  slice_max(mean_lifeExp, n=10)

#alternatively,

Life_Exp %>% 
  filter(mean_lifeExp == max(mean_lifeExp) |
         mean_lifeExp == min(mean_lifeExp))

#using the count command, ex. how many obs. do I have for a particular year?

gm_data %>% 
  group_by(year, country) %>% 
  count()
  
#adding rows and columns, mutate command. This can change existing data or make new.

gm_data %>% 
  mutate(lifeExp_round = round(lifeExp)) %>% 
  head()
#round command rounds integers to whole numbers

gm_data_new<- gm_data %>% 
  mutate(lifeExp_round = round(lifeExp)) 

#saving the new data table as a csv file (data export)

write.csv(gm_data_new, "gapminder_data2.csv")

#using conditions

gm_data %>% 
  mutate(lifespan = ifelse(lifeExp < 30, 
                           "below 30", "30+")) %>% 
  head()



write.csv(Africa, "Africa")




