#####              \BeaverGravel.r            ##############
###################################################################################

###  This script is written to read from the database, but can be modified for 
###       csv or xlsx reads
###
###  Processing Steps for SPREADSHEETS 
###   1) Export Cummulative Frequency query from database to Spreadsheet:  CummulativeFrequencyExport.xlsx
###   2) delete any rows that have no data
###   3) Save as file type comma separated values .csv

library(ggplot2)
#library(Hmisc)
library(RODBC)

####    Folk Graphic Method Function    ####
americana <- function(x1,y1){
  y <- as.numeric(as.character(y1))
  x <- as.numeric(as.character(x1))
  FGM_df <- as.data.frame(cbind(x, y))
  
  #Including if/else
  Ys <- as.list(c(0.05, 0.16, 0.25, 0.50, 0.75, 0.84, 0.95)) #Need to pull 0.95 out separately.
  Xs.list <- NULL
  
  for (i in 1:length(Ys)) {
    over <- subset(FGM_df,  FGM_df$y > Ys[[i]])
    if (dim(over)[1] > 0) {
      over <- over[order(over$x), ] #This should put the data frame in order with the smallest x,y combo over the Ys as the one selected for m calculation
      under <- subset(FGM_df, FGM_df$y < Ys[[i]])
      under <- under[order(-under$x), ] #This should put the data frame in order with the largest x,y combo under the Ys as the one selected for m calculation
    } else {
      over <- FGM_df[order(-FGM_df$x), ][1,]
      under <- FGM_df[order(-FGM_df$x), ][2,]
    }
    two <- over[which.min(abs(as.numeric(as.character(over$y)) - Ys[[i]])),]
    one <- under[which.min(abs(as.numeric(as.character(under$y)) - Ys[[i]])),]
    
    m = (two$y - one$y)/(two$x - one$x)
    Xs = (Ys[[i]] - one$y)/m +one$x
    Xs.list <- append(Xs.list, Xs)
    
  }
  c(Xs.list)
  #  print(Xs.list)
}
##   End Function  ##




### Check the database location and name as needed
setwd("C:/Users/saman/OneDrive - Susquehanna University/Capstone")
db<- file.path("BeaverBase.accdb")

channel<- odbcConnectAccess2007(db, uid="resslerd")

GB<-sqlFetch(channel, "Gravel Totals Query")

odbcCloseAll()

row.names(GB)=GB[,2]
View(GB)

####    Build Cummulative Frequency Table from Sum of Gravels (not in SQL this time!)    ####

GB$ParticleCount <- GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
                    GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60 + GB$SumGB65 + GB$SumGB70 +
                    GB$SumGB75 + GB$SumGB80

GB$CF15 <- GB$SumGB15 / GB$ParticleCount 
GB$CF20 <- (GB$SumGB15 + GB$SumGB20) / GB$ParticleCount  
GB$CF25 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25) / GB$ParticleCount 
GB$CF30 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30)  / GB$ParticleCount 
GB$CF35 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35)  / GB$ParticleCount 
GB$CF40 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40)  / GB$ParticleCount 
GB$CF45 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45)  / GB$ParticleCount 
GB$CF50 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50)  / GB$ParticleCount 
GB$CF55 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50 + GB$SumGB55)  / GB$ParticleCount 
GB$CF60 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60)  / GB$ParticleCount 
GB$CF65 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60 + GB$SumGB65) / GB$ParticleCount 
GB$CF70 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
           GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60 + GB$SumGB65 + GB$SumGB70)  / GB$ParticleCount  
GB$CF75 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60 + GB$SumGB65 + GB$SumGB70 +
            GB$SumGB75)  / GB$ParticleCount 
GB$CF80 <- (GB$SumGB15 + GB$SumGB20 + GB$SumGB25 + GB$SumGB30 + GB$SumGB35 + GB$SumGB40 +
            GB$SumGB45 + GB$SumGB50 + GB$SumGB55 + GB$SumGB60 + GB$SumGB65 + GB$SumGB70 +
            GB$SumGB75 + GB$SumGB80)  / GB$ParticleCount 


#####   Graph it    #### 

#GrainSize<-t(GB)

#View(GrainSize)

MidPhi<-matrix(c(-1.75,-2.25,-2.75,-3.25,-3.75,-4.25,-4.75,-5.25,-5.75,-6.25,
                 -6.75,-7.25,-7.75,-8.25),nrow=1,ncol=14, byrow=T)
MidPhi <- as.data.frame(MidPhi)
GBPlot <- GB[, 18:31]


for (i in 1:nrow(GB)) {
    matplot(MidPhi,GBPlot[i,],type="o",col="red", pch = 8, ylim = c(0,1),
            lty=1, xaxp  = c(-10, 5, 15), ylab= rownames(GBPlot[i,]))

  abline(h=0.05)
  abline(h=0.16)
  abline(h=0.25)
  abline(h=0.50)
  abline(h=0.75)
  abline(h=0.84)
  abline(h=0.95)
  grid(nx = 58, ny = 9, col = "lightgray", lty = "dotted", lwd = par("lwd"))
  #minor.tick(nx=10, ny = 4,     #tick density
 #            tick.ratio = 0.5)  #tick size
  
}


#dev.copy(jpeg,'C:/GitHub/analysis-scripts/plots/Gravel/2022UNTRM170.Hammersley.jpg')
#dev.off()     ###Save this for printing graphs to file

##   Done with graphs

####    Calculate the Moment sizes from the charts with Americana    ####




#X and Y were flipped!
GBOut <- NULL
GBphi <- NULL
MidPhi<-c(-1.75,-2.25,-2.75,-3.25,-3.75,-4.25,-4.75,-5.25,-5.75,-6.25,-6.75,-7.25,-7.75,-8.25)
GBt <- as.list(split(GB[ ,18:31], seq(nrow(GB[, 18:31]))))

for (i in seq_along(GBt)) {
  
  GBOut <- americana( MidPhi , GBt[[i]])
  
  GBphi <-rbind(GBphi, GBOut)
}

GBphi<-as.data.frame(GBphi)

colnames(GBphi) <- c("phi05","phi16","phi25","phi50","phi75","phi84","phi95")
rownames(GBphi) <- GB$VisitCode



#### Conduct Moment Caclulations for mean, sorting, and verbals ####

GBphi$GBMean <- ( GBphi$phi16 + GBphi$phi50 + GBphi$phi84 ) / 3  

GBphi$GBSorting <- ( GBphi$phi84 - GBphi$phi16 ) / 4 + ( GBphi$phi95 - GBphi$phi05 ) / 6.6 

GBphi$GBSkewness <- ((GBphi$phi16+GBphi$phi84-2*GBphi$phi50) / (2*(GBphi$phi84-GBphi$phi16))) +
                    ((GBphi$phi05+GBphi$phi95-2*GBphi$phi50) / (2*(GBphi$phi95-GBphi$phi05))) 

GBphi$GBKurtosis <- (GBphi$phi95-GBphi$phi05)/(2.44*(GBphi$phi75-GBphi$phi25)) 

GBphi$VerbalGBKurtosis <- cut(GBphi$GBKurtosis, c(0.41, 0.69, 0.9, 1.11, 1.5, 3.0, Inf), right=FALSE, 
                              labels=c("Very platykurtic", "Platykurtic", "Mesokurtic",
                                       "Leptokurtic", "Very leptokurtic", "Extremely Leptokurtic"))
                              
GBphi$VerbalGBSkewness <- cut(GBphi$GBSkewness, c(-999, -.3, -0.1, 0.1, 0.3, Inf ), right= FALSE,
                              labels = c("Strongly Skewed Fine", "Negative Skewed Fine","Nearly Symmetrical",
                              "Positive Skewed Coarse", "Strongly Skewed Coarse")) 

GBphi$VerbalGBSorting <- cut(GBphi$GBSorting, c(-999,-4, -2, -1, -.71, -0.5, -0.35, 0), right= FALSE,
                             labels = c("Extremely Poorly Sorted", "Very Poorly Sorted", "Poorly Sorted",
                                        "Moderately Sorted", "Moderately Well Sorted", "Well Sorted", 
                                        "Very Well Sorted")) 

GBphi$VerbalGBMean <- cut(GBphi$GBMean, c(-Inf, -8, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 9, Inf  ), right= FALSE,
                          labels = c("Boulders", "Cobbles", "Very Coarse Pebbles", "Coarse Pebbles",
                                     "Medium Pebbles", "Fine Pebbles", "Granules", "Very Coarse Sand",
                                     "Coarse Sand", "Medium Sand", "Fine Sand", "Very Fine Sand",
                                     "Coarse Silt", "Medium Silt", "Fine Silt", "Very Fine Silt", "Clay"))


## End analysis  ##

####  Write the Table    ####
 
write.csv(GBphi, file ="S:/CEER/BeaverDam/BeaverBase/BeaverGBphi.csv", row.names = TRUE)

