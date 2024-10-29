# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.

# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.

setwd("C:/GitHub/shafersa/Week9")
library(readxl)
library(vegan)

Penaetal_2016_data <- read_excel("Penaetal_2016_data.xlsx")
View(Penaetal_2016_data)

abiotic.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Abiotic factors")
abiotic <- as.data.frame(abiotic.tibble)

veg_trans.tibble<-read_excel("Penaetal_2016_data.xlsx", sheet = "Vegetation_transects")
veg_trans<-as.data.frame(veg_trans.tibble)

abiotic$names <- paste(abiotic$Site, abiotic$Land_Use, abiotic$Plot)
abiotic.means <- aggregate(x = abiotic, by = list(abiotic$names), FUN = "mean")
head(abiotic)
head(abiotic.means)
abiotic.means1 <- abiotic.means[,-16] 
abiotic.means2 <- abiotic.means1[,-1:-6] 
abiotic.means2 <- sapply(abiotic.means2, as.numeric ) 
abiotic.means2 <- as.data.frame(abiotic.means2)
abiotic.means2 <- aggregate(x = abiotic, by = list(abiotic$names), FUN = "mean")

veg_trans$names <- paste(veg_trans$Parcel, veg_trans$Landuse)
veg_trans.means <- aggregate(x = veg_trans, by = list(veg_trans$names), FUN = "mean")
veg_trans.means1<-as.data.frame(veg_trans.means[,-1:-3])
veg_trans.means2<-as.data.frame(veg_trans.means1[,-38])
veg_trans.means3<-(veg_trans.means2[-12,])
veg_trans.means3 <- sapply(veg_trans.means3, as.numeric )

head(veg_trans.means3)


nrow(veg_trans.means3)
nrow(abiotic.means2)
ncol(veg_trans.means3)
ncol((abiotic.means2))

ord <- rda(veg_trans.means3 ~ pH + totalN + Perc_ash + Kalium + Magnesium + Ca + Al + TotalP + OlsenP, abiotic.means2)
ord
anova(ord)
plot(ord, ylim = c(-7,7), xlim = c(-7,7))  
ord2 <- rda(veg_trans.means3 ~ pH + totalN + Ca + TotalP + OlsenP, abiotic.means2)
ord2
anova(ord2)
plot(ord2, ylim = c(-7,7), xlim = c(-7,7))  

#Examples of different combinations that I had tried
#ord2 <- rda(veg_trans.means3 ~ pH , abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ toatlN, abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ Perc_ash , abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ Kalium , abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ Ca, abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ Al , abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ TotalP , abiotic.means2)
#ord2 <- rda(veg_trans.means3 ~ OlsenP , abiotic.means2)

veg_trans.means3 <- na.omit(veg_trans.means3)
abiotic.means3 <- na.omit(abiotic.means2)

ord <- rda(veg_trans.means3 ~., abiotic.means2) 
ord.int <- rda(veg_trans.means3 ~1, abiotic.means2)
step.mod <- ordistep(ord.int, scope = formula(ord), selection = "both")
step.mod$anova

##Just over half of variance is explained (54%) with the 1st RDA with all of the abiotic variables included. After I ran the ANOVA the results can back insignificant.I then tried a series of different combination of
##variables to see if it was telling a different story when they were separate. This in fact did not lead to any Significance. The variables that I did chose to run, I thought were the most influential for vegetation growth. 
##

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.
# Explain the ecological importance of the significant predictors, or lack of significant predictors.
library(fitdistrplus)
library(logspline)

abiotic.means2$Parcel <- unique(abiotic$Parcel)
merged <- merge(abiotic, veg_trans, by = "Parcel")
merged$Land_Use <- as.numeric(merged$Land_Use)

fit.weibull <- fitdist(merged$Land_Use, distr = "weibull")
fit.norm <- fitdist(merged$totalN, distr = "norm")
fit.gamma <- fitdist(merged$totalN, distr = "gamma")
fit.lnorm <- fitdist(merged$totalN, distr = "lnorm")
fit.logis <- fitdist(merged$totalN, distr = "logis")
gofstat(list(fit.weibull, fit.norm, fit.gamma, 
             fit.lnorm, fit.logis))

mod1 <- lm(merged$Land_Use~totalN + Kalium + Magnesium + Ca + Al + TotalP )

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.






