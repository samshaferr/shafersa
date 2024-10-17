# Load the "anytime" and "ggplot2" packages to complete this week's assignment.
library(ggplot2)


# Read the "Plankton_move_average" CSV in from GitHub. 
# These are data from the Great Lakes Environmental Research Laboratory plankton sampling.
library(readr)
library(EcoVirtual)
library(tcltk)
library(deSolve)
setwd("C:/Users/shafer/Documents/GitHub/shafersa/Week7") 
library(readr)
Plankton_move_average <- read_csv("Plankton_move_average.csv")
View(Plankton_move_average)
data<- Plankton_move_average
#Used the following lines to format the date and remove NAs from the dataset:

data$Date <- as.Date(data$Date, origin = "0001-01-01") # Setting values to "day zero".
data <- na.omit(data)

#Plot these population data over time with the following code:
ggplot(data)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=data, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 

# Export this plot to have on hand for reference in the next section of the assignment (and upload with your script). (8 pts)

# (1) - Which species is most likely to be r-selected prey and which its primary predator? (2 pts)
##Bythotrephes is most likely to be r-selected as prey and it's primary predatory would be D.mendotae.

# What is one relationship the third species MIGHT have to the first two? (2 pts)
## As the third population increases (prey) the other two populations will fluctuate more frequently.

#Now copy/paste in the Lotka-Volterra function, plotting script, and load the "deSolve" package from the tutorial:

LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y)
    dy = -y*(gamma - delta*x)
    return(list(c(dx, dy)))
  })
}
ggplot(data)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=data, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 

# (2) - What do alpha, beta, gamma, and delta represent in this function? (4 pts)
## Aphla= rate of prey population growth
##Betta= Rate of predation
##Gamma= rate of prey consumption--> population stability
##Delta= reate or prey consumption--> predators die off

# (3) - By only changing values for alpha, beta, gamma, and/or delta
# change the default parameters of the L-V model to best approximate the relationship between Limncalanus and D.mendotae, assuming both plots are on the same time scale.
# What are the changes you've made to alpha, beta, gamma, and delta from the default values; and what do they say in a relative sense about the plankton data? (4 pts)
# Are there other paramenter changes that could have created the same end result? (2 pts)

ggplot(data)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=data, aes(Date, D.mendotae), color="black", alpha = 1, beta = 0.5, gamma = .2, delta = .6 ,size=1)+
  geom_line(data=data, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ 
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 

# Export your final L-V plot with a legend that includes the appropriate genus and/or species name as if the model results were the real plankton data, 
# and upload with your script. (hint - remember which one is the predator and which is the prey) (8 pts)




