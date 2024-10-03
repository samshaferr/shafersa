# Look at the plot and model results for our Dryad data in the tutorial. 
  # Part 1: Without knowing which points represent which groups,give one explanation for why these data might be difficult
  # to draw spatial inferences about genes.(4 points)
##One way is might be hard to make spatial inferences about these genes is because we do not know there methods for sampling. It could be sampled in clumps and not randomly sampled. This could lead to bias and inaccurate results

  # Part 2: Despite the drawbacks, give the result or interpretation that you feel most confident in (4 points), and EXPLAIN WHY (6 points).
##After fully running the data and color coding by region it s clear there methods for sampling were skewed. #skewed isn't the right word - what are they skewed toward or away from?
##When analyzing the literature directly from the Dryad article they said that the data they collected was randomly. 
##I think what they were possibly trying to do was to collect the most diverse set of data that they could. 
##But when the data is represented graphically it suggests that samples were collected in clusters. 
##The data is also missing samples that are below a latitude of 0. It could also be an issue of the data misrepresenting the literature. 
#Kudos about looking at the paper...but the question was about the plot and what we did in class. Think about elevation and other geographic features that could make things difficult to interpret without a map.

# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.

  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". (2 points)
install.packages('stability')
library(stability)
data("ge_data")
head(ge_data)
# Create two linear models for Yield Response: one related to the Environment and one to the Genotype. (2 points each)
  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.
help(ge_data)
help("stability")
hist(ge_data)
colnames(ge_data)
row.names(ge_data)
plot(data$Gen ~ data$Yield)

##Genotype
model_gen<-lm(Yield~Gen, data=ge_data)
summary(model_gen)


##Env
model_env<-lm(Yield~Env, data=ge_data)
summary(model_env)

### Test the significance of both models and look at the model summary. (4 points each)
  # Which model is a better fit to explain the yield response, and WHY? (6 points)
##Genotype represents the yield response better because it represents more of the data.The environment is only telling part of the story 
#Backward! Environment is a better fit because genotype has lots of factors that are not significant, overfitting the data.
  # Hint: Does one model seem more likely to be over-fitted?

# Which environment would be your very WORST choice for generating a strong yield response? (2 points)
##EnvKhanewal would be the worst environment for generating a yield response. The p value that it reads back is insignificant
#not significant, not insignificant.