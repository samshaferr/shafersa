# Load the packages from this week's tutorial, aka vignette
#We looked at brook trout population demographics in relationship to water quality and stream flashiness.


#1: Give two specific conclusions you can make from these patterns. (4 pts)
##The variable that explains brook trout population demographics comes from stream flashiness as well as water quality. 
##Along with stream flashiness, alkalinity and conductivity both have some power in explaining brook trout population dynamics.
##There were very few differences between brook trout and brown trout dynamics. I would assume this is beacause these species are similar in the way that they interact with their environment

#2: Rerun this analysis with either (a) a different metric of brook trout populations or a different species from the database. (6 pts)

pkgs <- installed.packages()
if (!('devtools' %in% pkgs)) { install.packages('devtools') }
if ('dbfishR' %in% pkgs) { remove.packages('dbfishR') }

devtools::install_github(repo = 'Team-FRI/dbfishR', upgrade = 'never')

library(dbfishR)


sites <- get_sites()
events <- get_events()
events_meta <- merge(sites, events[,c("SiteCode","EventCode","WaterTemp","pH","SpecCond","Alk","DO")])
events_meta$year <-substring(as.character(events_meta$EventCode),1,4)

fish_rec <- get_fish_records()

brownie_count <- aggregate(ID~EventCode, data = subset(fish_rec, Species == "Brown Trout" & Pass == "Pass 1"), FUN = length)
colnames(brownie_count)[2] <- "TotalCount"
small_brownie_count <- aggregate(ID~EventCode, data = subset(fish_rec, Length_mm < 100 & Species == "Brown Trout" & Pass == "Pass 1"), FUN = length)
colnames(small_brownie_count)[2] <- "SmallCount"
big_brownie_count <- aggregate(ID~EventCode, data = subset(fish_rec, Length_mm > 99 & Species == "Brown Trout" & Pass == "Pass 1"), FUN = length)
colnames(big_brownie_count)[2] <- "BigCount"

df_list <- list(brownie_count,small_brownie_count, big_brownie_count)
all_brownies <- Reduce(function(x, y) merge(x,y, all= TRUE), df_list)

all_brownies$SmallCount[is.na(all_brownies$SmallCount)] <- 0 #this allows the replace NA below to only take care of 100% YOY NAs
all_brownies$YOYRatio <- all_brownies$SmallCount/(all_brownies$BigCount+all_brownies$SmallCount)
all_brownies$YOYRatio[is.na(all_brownies$YOYRatio)] <- 1 #NAs are 100% YOY.

brownie_events <- merge(all_brownies, events_meta)

library(dataRetrieval)

HUC6 <- "020501"#North Branch Susquehanna
HUC_list <-paste(rep(HUC6,10), seq(0, 9, length.out = 10), sep="0")#To do a full HUC6 at once, just pick your HUC6 and auto-populate the subwatersheds (only works up to 9 HUC8 in a HUC6)

gage_df <- readNWISdata(huc = HUC_list, parameterCd = "00060", startDate = "2010-01-01", endDate = "2020-12-31")


devtools::install_github(repo = 'leppott/ContDataQC', force = TRUE)
library(ContDataQC)

gage_df$year <- sapply(strsplit(as.character(gage_df$dateTime), "-"),"[[",1)#Create year to get annual R-B index

R_B_HUC <- aggregate(X_00060_00003~year+site_no, data = gage_df, FUN = RBIcalc)#Aggregate by year and site w/in the HUC
colnames(R_B_HUC)[3] <- "RBI" #rename column


stations_meta <- readNWISsite(unique(R_B_HUC$site_no))

medium_stations <- subset(stations_meta, drain_area_va > 10 & drain_area_va < 100)


library(sf)
medium_stations_so <- st_as_sf(medium_stations,coords = c("dec_lat_va", "dec_long_va"))

events_so <- st_as_sf(brownie_events[!is.na(brownie_events$SiteLon),], coords = c("SiteLat","SiteLon"))#remove NAs to create spatial object

fish_flow_tmp <- st_join(events_so, medium_stations_so, join = st_nearest_feature)


#Spatial join
library(nngeo)
#distances are in degrees
fish_flow_tmp$dist <- unlist(st_nn(events_so, medium_stations_so, returnDist = T)$dist)
fish_flow_tmp <- subset(fish_flow_tmp, dist < 0.5)

#because of year and spatial join needed to change order of operations. Space first, then time
fish_flow <- merge(fish_flow_tmp, R_B_HUC, by = c("year", "site_no"))

mod <- lm(TotalCount~RBI, data = fish_flow)
summary(mod)

mod2 <- lm(BigCount~RBI, data = fish_flow)
summary(mod2)

mod3 <- lm(SmallCount~RBI, data = fish_flow)
summary(mod3)

mod4 <- lm(YOYRatio~RBI, data = fish_flow)
summary(mod4) #winner winner chicken dinner


library(itsadug)
plot(mod4$residuals)

gam.mod <- gam(YOYRatio~RBI, data = fish_flow, na.action = na.omit, method = "REML")#RBI only
summary(gam.mod)

plot_smooth(gam.mod, view="RBI", rm.ranef=FALSE)

gam.mod <- gam(YOYRatio~RBI+Alk, data = fish_flow, na.action = na.omit, method = "REML")#RBI + alkalinity
summary(gam.mod)

par(mfrow=c(1,2)) 
plot_smooth(gam.mod, view="RBI", rm.ranef=FALSE)

plot_smooth(gam.mod, view="Alk", rm.ranef=FALSE, ylab = "", xlab = "Alk")

gam.mod <- gam(YOYRatio~RBI+Alk+SpecCond, data = fish_flow, na.action = na.omit, method = "REML")#RBI, alk, and specific conductivity
summary(gam.mod)

par(mfrow=c(1,3)) 
plot_smooth(gam.mod, view="RBI", rm.ranef=FALSE)
plot_smooth(gam.mod, view="Alk", rm.ranef=FALSE, ylab = "", xlab = "Alkalinity")
plot_smooth(gam.mod, view="SpecCond", rm.ranef=FALSE, ylab = "", xlab = "Specific Conductivity")



#3: How do the results of your analysis compare to the vignette? (5 pts)

##The results look nearly the same at least when looking at RBI, alkalinity, and specific conductivity
##The residuals look slightly different though. There is definitely presence of heteroskedasticity indicating there might be some issues
##that the model might need to be reworked to better show independence of variables. The residual model from the brook trout also showed heteroscedasticity
## but not nearly to the extent of the brown trout model. 




#4: For your final project you'll need to find two separate data sources to combine similar to the process here.
  #In prep for that, find one data source to compare with either the data in dbfishR OR DataRetrieval. (5 pts)
  #Read data from that source into your script. (5 pts)
  #Create any analysis of your choice that combines the two data sources, this can be as simple as a linear model. (5 pts)

library(readr)
NAS_Specimen_Download <- read.csv("C:/GitHub/shafersa/Week10/NAS-Specimen-Download.csv")
View(NAS_Specimen_Download)
sites

new_fish<-NAS_Specimen_Download
ncol(new_fish)
colnames(events_meta)[colnames(events_meta) == "SiteLat"] <- "Latitude"
colnames(events_meta)[colnames(events_meta) == "SiteLon"] <- "Longitude"
new_fish1<-new_fish[,-19:-67]
new_fish2<-new_fish1[,-9]
merged1 <- merge(new_fish2, events_meta, by = c("Latitude", "Longitude"), all.x = TRUE)
merged2<- merge(new_fish2, events_meta, by = c("Latitude", "Longitude"), all.y = TRUE)

mod1<-lm(merged2$Latitude~pH+SpecCond+Alk+DO, merged2)
summary(mod1)
anova(mod1)
AIC(mod1)
