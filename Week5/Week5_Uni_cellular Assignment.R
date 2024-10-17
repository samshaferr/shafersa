library(fitdistrplus)
library(logspline)

# First, recreate Figure 4 from Herron et al. (2019). De novo origins of multicellularity in response to predation. Scientific reports.
  

# Search datadryad.org by the paper title and download the dataset. It will include .csv files and R scripts, organized by figure.

  # Save the script and change the working directory on lines 8 and 115 to match your computer

setwd("C:/Users/shafer/Documents/GitHub/shafersa/Week5")#Set to github repo.
data <- read.csv(file=("Figure4Data.csv"), header=T)

# Upload the plot you've created to GitHub. (4 points)
boxplot(data$TechRep~data$Strain, xlab="Strain", ylab="Cells per Propagule", main="Figure 4")#This isn't the plot you were supposed to make...

  # Zoom into yoTechRep# Zoom into your plot to look at the distribution for different strains.

# Do all of the strains in the plot have the same distributions (yes/no)? (1 pt)
##No
# Based on these observations of your strain distributions, why did the authors use a Kruskal-Wallis test rather than ANOVA to compare the strains? (3 pts)

## The assumptions for Kruskal-Wallis and ANOVA are different. AVONA assumes that the data is evenly distributed whereas Kruskal-Wallis assumes the data
##is not distributed evenly. In the case of these authors they decided to use the Kruskal-Wallis test because their data was not distributed evenly. 
##For figure 4 their data is clearly tailed in one direction; in favor of strains with larger cluster sizes and not in favor of
##ancestral strains in single celled propagules.

# Use the fitdist() and gofstat() functions to compare the poisson, negative binomial, and logistic distributions for:
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)
hist(clean_data$Num.Cells.Progeny, main="Progeny")#This is out of order - can't run it because clean_data doesn't exist yet.

sum(is.na(data$Num.Cells.Progeny))
sum(is.infinite(data$Num.Cells.Progeny))
clean_data <- data[is.finite(data$Num.Cells.Progeny) & !is.na(data$Num.Cells.Progeny), ]
fit.norm<-fitdist(clean_data$Num.Cells.Progeny, distr = "norm")
fit.logis<-fitdist(clean_data$Num.Cells.Progeny, distr = "logis")
fit.weibull <- fitdist(clean_data$Num.Cells.Progeny, distr="weibull", lower = c(0, 0), start = list(scale = 1, shape = 1))
fit.gamma<-fitdist(clean_data$Num.Cells.Progeny, distr = "gamma",lower = c(0, 0), start = list(scale = 1, shape = 1))
gofstat(list(fit.weibull, fit.gamma, fit.norm, fit.logis), chisqbreaks)
chisqbreaks<-c(1,2,4,8,16,3,64)#This doesn't run in line - need to rerun above line for it to work.


  # (2) - The replication time (data$RepTime.sec)
sum(is.infinite(data$RepTime.sec))
sum(is.na(data$RepTime.sec))
clean_data <- data[is.finite(data$RepTime.sec) & !is.na(data$RepTime.sec), ]
fit.logis1<-fitdist(clean_data$RepTime.sec, distr = "logis")
fit.weibull1 <- fitdist(clean_data$RepTime.sec, distr="weibull", lower = c(0, 0), start = list(scale = 1, shape = 1))
fit.gamma1<-fitdist(clean_data$RepTime.sec, distr = "gamma",lower = c(0, 0), start = list(scale = 1, shape = 1))
gofstat(list(fit.logis1,fit.weibull1,fit.gamma1))
#You didn;t compare the right distributions!
#HINT- "Num.Cells.Progeny" has defined breaks. To display results, use the formula with the "chisqbreaks" argument as follows:
      #gofstat(list(fit.1, fit.2, fit.3, etc), 1,2,4,8,16,32,64))


# Based on the AIC scores, which distribution is the best fit for: (5 pts each)
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)?
##Negative Binomial
  # (2) - The replication time (data$RepTime.sec)?
##poisson
#You never ran the poisson fit...

# Plot a generic histogram for the replication time (data$RepTime.sec) (4 pt)
hist(clean_data$RepTime.sec)
# Based on the patterns of this histograms and Figure 4:
  #Give one hypothesis for an evolutionary process represented by the two tallest bars in your histogram. (8 pts)
  # Don't cheat by looking at the paper! 
##Null Hypothesis: The time is takes to reproduce does not impact the amount of offspring born and the strain retained.
##Alt Hypothesis: The time it take to reproduce does impact the amount of offspring born and the strains retained.
#This isn't a hypothesis to explain the pattern...
    # This hypothesis does not need to be correct - it only needs to be ecologically rational based these two figures.








