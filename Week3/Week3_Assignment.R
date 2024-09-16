# (1) Approximately how many hours ahead of Sunbury was the peak flow in Lewisburg during the 2011 flood? (2 pt)
  
##Sunbury flooded September 9th at 1:45pm and Lewisburg flooded September 8 at 6:00pm. 17.25 hours after Lewisburg flooded Sunbury flooded.  

# (2) Give one reason why information on the time between peak flow events up- and downstream could be valuable information? (4 pts)

## This could be valuable info to let people down stream know if they should evacuate in the case of a flood event.

# Package scavenger hunt! (12 pts each)

## (3) Using Google and ONLY packages from GitHub or CRAN:
  
  # Find a package that contains at least one function specifically designed to measure genetic drift.


    # Copy-paste into your script - and run - an example from the reference manual for a function within this package related to a measure of genetic drift. 


# Pop   = Replicate populations
# Gen   = Generations
# NM    = Male population size
# NF    = Female population size
# P     = Frequency of focal allele

GenDriftSim = function(Pop = Pop, Gen = Gen, NM, NF, P, graph = "y", histo = "y"){
  P = (2*(NM+NF))*P
  NE = round((4*NM*NF)/(NM+NF),0)
  SR = round(NM/NF,2)
  Na = NM+NF
  if(graph=="y"){
    plot(c(0,0),type = "n", main = bquote('N'[M]~'/ N'[F]~'='~.(SR)*', N'[A]~'='~.(Na)*', N'[E]~'='~.(NE)), cex.main = 1, 
         xlim = c(1,Gen), ylim=c(0,1), xlab = "Generations", ylab = "Fequency of focal allele")
  }else{}
  for (i in 1:Pop){
    N = NM+NF
    startA = as.vector(c(rep(1, times = P),rep(0, times = (2*N)-P)))
    Population = matrix(c(
      c(sample(startA, size = 2*N, replace = FALSE)),
      c(rep("M", times = NM), rep("F", times = NF))),
      ncol = 3)
    SimResults[(Gen*i)+1-Gen, 3] <<- sum(as.numeric(Population[,1:2]))/(N*2)
    for(j in 1:(Gen-1)){
      
      Population = matrix(c(
        c(sample(sample(Population[(1:NM),1:2], replace = TRUE),N, replace = TRUE)),
        c(sample(sample(Population[(1+NM):N,1:2], replace = TRUE),N, replace = TRUE)),
        c(rep("M", times = NM), rep("F", times = NF))), ncol = 3)
      SimResults[(Gen*i)+1+j-Gen, 3] <<- sum(as.numeric(Population[,1:2]))/(N*2)
    }
    s = (i*Gen)-Gen+1; e = i*Gen
    r = as.vector(SimResults[s:e, 3])
    if(graph=="y"){
      points(r~c(1:Gen), type = "l")
    }else{}
  }
  if(histo == "y"){SimResults[,1] = rep(1:Pop, each = Gen)
  SimResults[,2] = rep(1:Gen, times = Pop)
  hist(SimResults[,3][SimResults[,2]==Gen], breaks = 100, cex.lab = 0.7, cex.axis = 0.7, xlim = c(0,1), cex.main = 1, main = bquote('N'[M]~'/ N'[F]~'='~.(SR)*', N'[A]~'='~.(Na)*', N'[E]~'='~.(NE)), xlab = paste0("Frequency of focal allele after ",Gen," Generations"))
  }else{}
}

Pop = 10
Gen = 25
P = 0.5

SimResults = matrix(data = NA, ncol = 3, nrow = Gen*Pop)
GenDriftSim(Pop = Pop, Gen = Gen, NM = 100, NF = 900, P = P, graph = "y",  histo = "n")
dev.off

##The codw that I found online shows an imbalance between the male and female population size 

        # Depending on the function, either upload a plot of the result or use print() and copy/paste the console output into your script.

 # After running the function example, manipulate a parameter within the function to create a new result. 

GenDriftSim = function(Pop = Pop, Gen = Gen, NM, NF, P, graph = "y", histo = "y"){
  P = (2.1*(NM+NF))*P
  NE = round((4*NM*NF)/(NM+NF),0)
  SR = round(NM/NF,2)
  Na = NM+NF
  if(graph=="y"){
    plot(c(0,0),type = "n", main = bquote('N'[M]~'/ N'[F]~'='~.(SR)*', N'[A]~'='~.(Na)*', N'[E]~'='~.(NE)), cex.main = 1, 
         xlim = c(1,Gen), ylim=c(0,1), xlab = "Generations", ylab = "Fequency of focal allele")
  }else{}
  for (i in 1:Pop){
    N = NM+NF
    startA = as.vector(c(rep(1, times = P),rep(0, times = (2*N)-P)))
    Population = matrix(c(
      c(sample(startA, size = 2*N, replace = FALSE)),
      c(rep("M", times = NM), rep("F", times = NF))),
      ncol = 3)
    SimResults[(Gen*i)+1-Gen, 3] <<- sum(as.numeric(Population[,1:2]))/(N*2)
    for(j in 1:(Gen-1)){
      
      Population = matrix(c(
        c(sample(sample(Population[(1:NM),1:2], replace = TRUE),N, replace = TRUE)),
        c(sample(sample(Population[(1+NM):N,1:2], replace = TRUE),N, replace = TRUE)),
        c(rep("M", times = NM), rep("F", times = NF))), ncol = 3)
      SimResults[(Gen*i)+1+j-Gen, 3] <<- sum(as.numeric(Population[,1:2]))/(N*2)
    }
    s = (i*Gen)-Gen+1; e = i*Gen
    r = as.vector(SimResults[s:e, 3])
    if(graph=="y"){
      points(r~c(1:Gen), type = "l")
    }else{}
  }
  if(histo == "y"){SimResults[,1] = rep(1:Pop, each = Gen)
  SimResults[,2] = rep(1:Gen, times = Pop)
  hist(SimResults[,3][SimResults[,2]==Gen], breaks = 100, cex.lab = 0.7, cex.axis = 0.7, xlim = c(0,1), cex.main = 1, main = bquote('N'[M]~'/ N'[F]~'='~.(SR)*', N'[A]~'='~.(Na)*', N'[E]~'='~.(NE)), xlab = paste0("Frequency of focal allele after ",Gen," Generations"))
  }else{}
}

Pop = 20
Gen = 25
P = 0.5

SimResults = matrix(data = NA, ncol = 3, nrow = Gen*Pop)
GenDriftSim(Pop = Pop, Gen = Gen, NM = 180, NF = 180, P = P, graph = "y",  histo = "n")
dev.off

##This new code shows if the male and female populations were equal in size.
        
# Common options might be allele frequency, population size, fitness level, etc. 
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
       
          # By manipulating these parameters you can see how it impacts the results.
          # This type of manipulation is one example of how theoretical ecology and modelling are used to predict patterns in nature.



## (4) Using Google and ONLY packages from GitHub or CRAN:
    # Find a package that will generate standard diversity metrics for community ecology, specifically Simpson's Diversity Index.
    # Copy-paste into your script - and run - an example from the reference manual for a function to calculate Simpson's diversity. 
Abundancia2017<- c(0,36,0,9,0,0,46,0,0,0,25,0)
Abundancia2018<- c(0,46,0,13,5,0,69,2,0,0,123,9)
Abundancia2019<- c(4,20,0,38,2,1,97,0,0,0,12,0)
datafish <- data.frame(Abundancia2017,Abundancia2018, Abundancia2019)

require(vegan)
y <- for(i in 1:nrow(df)) {
  row <- df[i,4:50] 
  #Assuming 50 columns
  diversity(row, "simp")
}

library("dplyr")
df <- data.matrix(datafish) %>%
  t() %>%
  as.data.frame()

diversity(df,index = "simpson")


        # Depending on the example usage of the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
    # After running the function example, modify your script to generate another diversity metric that is NOT part of the example. 
        # If there are multiple diversity metrics in the example script, none of these will count as the modified script.
        # Hint: If the function can "only" calculate Simpson's diversity, the inverse of Simpson's diversity is another common metric. 
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
        
          # Diversity metrics are frequently used in community ecology for reasons ranging from a quick comparison between sites to understanding community stability.
          # Their calculation can be very tedious by hand - and very fast with a package designed for the operation.



