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
abiotic.means <- aggregate(x = abiotic, by = list(abiotic$names), FUN = "mean")

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
##Just over half of variance is explained (54%).
anova(ord)
plot(ord, ylim = c(-7,7), xlim = c(-7,7))  

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.
  # Explain the ecological importance of the significant predictors, or lack of significant predictors.



# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.


