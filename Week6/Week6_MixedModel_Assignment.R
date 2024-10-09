# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."
setwd("C:/GitHub/shafersa/Week6")
df<- read.csv(file=("Toscano_Griffen_Data.csv"), header=T)
library(MASS)
library(MuMIn)
library(lme4)
library(mgcv)
# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from this week's tutorial. 

## activity level = response var
## carapace len., claw width, temp, toadish predation


  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 

    # In one model only include additive effects.
glmm.mod1<-glmmPQL(eaten/prey~temperature+carapace.width+claw.width, family=binomial, random = ~ 1 | block, data = df)
summary(glmm.mod1)
    # In the other model include one interactive effect.
glmm.mod2<-glmmPQL(eaten/prey~temperature+carapace.width*claw.width, family=binomial, random = ~ 1 | block, data = df)
summary(glmm.mod2)
    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.

# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
  # So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):
df$prop.cons <- df$eaten/df$prey 

# (Q1) - The code I've provided in line 13 above is performing two operations at once. What are they? (2 pts)
## By dividing what has been eaten by prey it creates a rate. The result of the rate is demonstrated in the new row produced in the data frame. 
## You are doing a division operation as well as creating an output for said function and adding that to the data frame. 

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, SPECIFICALLY, did the results change? (5 pts)

##Yes, the interactive effect changed with predicted proportional consumption. Generally as crab activity increased, the proportion of mussels 
## consumed also increased. this was the case with smaller crabs but had no effect on the mussel consumption in lager crabs.
#What about the interactive effect? Otherwise great!

# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)
## I think the first model is a better fit for the data. There is less clumping of the points and more even distribution of 
## points. Whereas in the second model the points generally get more dense as you move toward the bottom right corner of the graph. 
## There are clearly some outliers in both models but the first model has less.
#Both are really really bad...

plot(glmm.mod1)
plot(glmm.mod2)


# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)
gam.mod1<-gam (eaten/prey~temperature+carapace.width+claw.width, family=binomial, random = ~ 1 | block, data = df)
summary(gam.mod1)

gam.mod2<-gam(eaten/prey~temperature+carapace.width*claw.width, family=binomial, random = ~ 1 | block, data = df)
summary(gam.mod2)
# (Q4) - Which model is a better fit? (2 pt)
##gam.mod2

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)

##Neither result gave way to much significance. They both didn't have a strong R value. 
#This question has nothing to do with the R-squared, just the residuals.





