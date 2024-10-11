1+1
3 * (3=2)
3*3=2
3*3+2
# The mathematical precedence is PEMDAS
# P is parenthesis and E is exponents
2 == 2
2== 3
# R can tell if the statement is true or false
 2>2
2<3 
2 >= 3
# In these statements, the equal symbol trails. >= is correct => is wrong
2 <= 3# this works
2=<3 #this won't work
2 != 3
# != is the inequality symbol, read as not equal to 
sqrt(25)
# another function in R. The number needs to be in brackets ()
?sqrt # ? opens the help page for that function
#A word of warning about comparing numbers: you should never use == to compare two numbers unless they are integers 
#(a data type which can specifically represent only whole numbers). 
#Computers may only represent decimal numbers with a certain degree of precision, so two numbers which look the same 
#when printed out by R, may actually have different underlying representations and therefore be different by a small 
#margin of error (called Machine numeric tolerance).
#Instead you should use the all.equal function.

# Variable assignment

x <- 3
x
x + 3
y <- 10 - 6

x <- x + 3
x <- 3            
y <- x
sqrt(x)
1:5
x <- 1:5
2^x
# a variable name can't start with a number or character like underscore.
#It can also not contain - inbetween the name.
#Variable names and R in general are case sensitive
ls()
ls(all.names = TRUE)
rm(x)
x <- 2
rm(list = ls())
#rm to remove stuff, if you want to remove everything in the environment, you can 
#pass the results of ls() to rm, using rm(list = ls())
#When assigning values to arguments by name, you must use the = operator!!
mass <- 47.5 
age <- 122
mass <- mass * 2.3 
age <- age - 20
mass <= age 
mass > age
all.equal(mass, age)
#.variable_name, using a dot (.) before a variable name creates a hidden variable
rm(mass,age)
x<-1
mass<-109
age<-200
rm(mass, age)


# Vectors

vec1 <- c(1,2,3,4,5)
vec2 <- 1:5
vec3 <- c(1:5,7:10) #c function allows you to put multiple strings together
pets <- c("dog", "cat", "fish") #the "" indicates character values. If you don't put them, R thinks you are calling objects with that name.
# you can't combine different types of values in a single vector, it will combine them
#into the same type, can be checked by typeof(). This will cause errors later.
vec4 <- c("dog", 1, 3)
typeof(vec4)

vec <- c(TRUE, FALSE)
typeof(vec)
rm(list = ls())

#install package using install.packages(") and the package you want within the bracket and quotes
#run packages you want with library()
#detach a package you no longer want to use now with detach("package:") command.
library(dplyr)
library(ggplot2)
library(gapminder)
gapminder


