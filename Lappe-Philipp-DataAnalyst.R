
install.packages("ggplot2", dependencies = T) 
install.packages("knitr", dependencies = T)
install.packages("dplyr", dependencies = T)


# DataAnalyst - Analyse with R   by Philipp Lappe
# ========================================================
  

```{r echo=FALSE, message=FALSE, warning=FALSE, packages}
# Load all of the packages that you end up using in your analysis in this code
# chunk.

# Notice that the parameter "echo" was set to FALSE for this code chunk. This
# prevents the code from displaying in the knitted HTML output. You should set
# echo=FALSE for all code chunks in your file, unless it makes sense for your
# report to show the code that generated a particular plot.

# The other parameters for "message" and "warning" should also be set to FALSE
# for other code chunks once you have verified that each plot comes out as you
# want it to. This will clean up the flow of your report.


library(ggplot2)
library(gridExtra)
library(dplyr)
library(lattice)

```{r echo=FALSE, Load_the_Data}

# Load the Data
getwd()
list.files()
pf <- read.csv("winequalityreds.csv", sep =',')
pf$X = NULL

```

# Univariate Plots Section


```{r echo=FALSE, Univariate_Plots}

"Plot for the variable fixed acidity"
ggplot(aes(x=fixed.acidity),data=pf) +  geom_histogram(binwidth=0.5) + ggtitle("Histogram of fixed acidity")
summary(pf$fixed.acidity)  #optional information 

"Plot for the variable volatile acidity"
ggplot(aes(x=volatile.acidity), data=pf) + geom_histogram() + ggtitle("Histogram of volatile acidity")
summary(pf$volatile.acidity) #optional information

"Plot for the variable critical acid"
ggplot(aes(x=citric.acid), data=pf) + geom_histogram() + ggtitle("Histogram of crital acidity")
summary(pf$cirital.acidity) #optional information

"Plot for the variable quality"
ggplot(aes(x=quality), data=pf) +  geom_histogram(binwidth=1)
summary(pf$quality)  #optional information 

"Plot for the variable alcohol"
ggplot(aes(x=alcohol), data=pf) + geom_histogram(binwidth = 0.5) + ggtitle("Histogram of average alcohol")
summary(pf$alcohol)  #optional information 

"Plot for the variable density"
ggplot(aes(x=density), data=pf) + geom_histogram() + ggtitle("Histogram of density")
summary(pf$density)  #optional information 

"Plot for the variable pH-Value"
ggplot(aes(x=pH), data=pf) + geom_histogram(binwidth = 0.025) + ggtitle("Histogram of pH-value")

´´´

# Univariate Analysis

### What is the structure of your dataset?

# The dataset "pf" contains 1599 variable sets of red wines and 
# details these informations with 12 variables.

### What is/are the main feature(s) of interest in your dataset?

#The dataset contains many intesting variables which are on the one hand physical (e.g pH-Value) and 
# on the other hand subjective information (e.g quality of wine). I do not have much knowledge of wines, 
# so it will be interesting for me to figure out
# - am I able to find relations between different physical variables?
# - am I able to find relations between physical variables and "quality" of wine 

### What other features in the dataset do you think will help support your \
# investigation into your feature(s) of interest?

# Overall I will try to figure out which features may lead to interesting scenarios and relations.
# At the moment I am not sure where to focus on - this will come up with the bivariate analyis

### Did you create any new variables from existing variables in the dataset?
# No, I did not, the overall informations in the dataset are fine and I will work with them

### Of the features you investigated, were there any unusual distributions? \
# Did you perform any operations on the data to tidy, adjust, or change the form \
# of the data? If so, why did you do this?

# The data I visualized was not distributed in an "unnormal" behavior, so therefore I played a bit
# with the "binwidth" to identify the granularity which covers most informations, and is easy to "read"


# Bivariate Plots Section


```{r echo=FALSE, Bivariate_Plots}

"PLOT 1 - A plot with the corresponding between alcohol and quality"
ggplot(aes(x=alcohol, y=quality), data=pf) + geom_point(alpha = 0.1, position="jitter") 

"PLOT 2 - A plot between fixed acidity and quality"
ggplot(aes(x=fixed.acidity, y=quality), data=pf) + geom_point(alpha=0.1, position="jitter")

"PLOT 3 - A plot between pH-value and quality"
ggplot(aes(x=pH, y=quality), data=pf) + geom_point(alpha=0.1, position="jitter") 

"PLOT 4 - A plot between density and quality"
ggplot(aes(x=density, y=quality), data=pf) + geom_point(alpha=0.1, position="jitter")

"PLOT 5 - A plot between volatile acidity and quality"
ggplot(aes(x=volatile.acidity, y=quality), data=pf) + geom_point(alpha=0.5, position="jitter")


```

# Bivariate Analysis

### Talk about some of the relationships you observed in this part of the \
### investigation. How did the feature(s) of interest vary with other features in \
### the dataset?

# PLOT 1 - An interesting relationship for me is that the quality of the wine and level of alcohol are related to 
# each other. The quality of wine - increases with the amount of alcohol

# PLOT 2-3 - I do not so real relationship between them. Nothing which would catch my attention

# Plot 5 - The correlation between volatile acidity and quality is negative. 

### Did you observe any interesting relationships between the other features \ (not the main feature(s) of interest)?
  
  ### What was the strongest relationship you found?

# The strongest relationship was found in PLOT 1 and PLOT 5 - in PLOT 1 we have a positive correlation 
# between the alcohol and the quality - in PLOT 5 we see a negative correlation between volatile acidity and
# quality 

  # Multivariate Plots Section


```{r echo=FALSE, Multivariate_Plots}

"PLOT 1 - relation between alcohol and quality subscribed on pH value " 
ggplot(aes(x=alcohol, y=quality, color=pH), data=pf) + geom_point(alpha=0.25, position="jitter")

"PLOT 2 - relation between density and quality subscribed on fixed acidity" 
ggplot(aes(x=density, y=quality, color=fixed.acidity), data=pf) + geom_point(alpha=0.5, position="jitter")

"PLOT 3 - relation between alcohol and quality subscribed on volatile acidity" 
ggplot(aes(x=alcohol, y=quality, color=volatile.acidity), data=pf) + geom_point(alpha=0.5, position="jitter")

"PLOT 4 - relation between pH Value and quality subscribed on alcohol" 
ggplot(aes(x=pH, y=quality, color=alcohol), data=pf) + geom_point(alpha=1, position="jitter")

```

# Multivariate Analysis

### Talk about some of the relationships you observed in this part of the \
### investigation. Were there features that strengthened each other in terms of \
### looking at your feature(s) of interest?

# PLOT 1 shows that wines with less alcohol and less quality also have a "low" value of pH. This fits to the
# visualization of PLOT 4 which uses the same variable, but in a different aggregation mode.

# PLOT 2 describes an interesting relation that good wines (high quality) normally based and low density
# and a low fixed acidity

# This is more a less fitting to PLOT 3 due to a positive correlation between quality, alocohl - based on 
# low volatile aciditiy.


### Were there any interesting or surprising interactions between features?

# For me it was more a less suprising that the correlation between quality and alcohol can be mostly seen 
# in all other variables as well. That means that the level of alcohol is connected to the other physical
# figures and can be used as a central and important variable. 

------

# Final Plots and Summary


### Plot One
  
```{r echo=FALSE, Plot_One}

"Plot for the variable alcohol"
ggplot(aes(x=alcohol), data=pf) + geom_histogram(binwidth = 0.5) + ggtitle("Histogram of average alcohol")
summary(pf$alcohol)  #optional information 

```

### Description One

# I choosed this as the first plot, due to the fact, that I was not aware that redwines can differ so much 
# in the level of alcohol. Due to the fact that I am more "interested" in beer I was not prepared for this
# big bandwith

### Plot Two

```{r echo=FALSE, Plot_Two}

"PLOT 1 - A plot with the corresponding between alcohol and quality"
ggplot(aes(x=alcohol, y=quality), data=pf) + geom_point(alpha = 0.1, position="jitter") 

```

### Description Two

# I choosed this plot, due to the fact that it was also for me suprising that there is a positive 
# correlation between the quality onf the wine and the level of alcohol. 


### Plot Three
```{r echo=FALSE, Plot_Three}

"PLOT 3 - relation between alcohol and quality subscribed on volatile acidity" 
ggplot(aes(x=alcohol, y=quality, color=volatile.acidity), data=pf) + geom_point(alpha=0.5, position="jitter"

```

### Description Three

# based on the two decisions upfront, this was the logical choice to understand positive and negative 
# correlations visualized on on plot. 


------
  
  # Reflection

# An overall reflection was to use "r" is more difficult - especially within the ramp up. Due to the fact
  # that for pyhton you can find millions of examples and codelines in the internet (e.g. Stackoverflow)
  # I was not really forced to start from scratch. I identified a problem - tried to think what can 
  # be the solution and then I found some code in the internet, adjusted this to my problem and it worked.
  # For "r" this was more tricky. Neverthess the structure is not so tricky - so I made it as well.
  
  
  # For analysing the dataset I would like to go one step further and wrangle and adjust the data. This
 # would be easier in pyhton due to the know how of the former lessons. Nevertheless I am happy to make
 # a step into "r" so that I am aware of the possibilities and limits of this tool.
  



