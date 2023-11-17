## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
citation("AquaticLifeHistory")

## ----logistic example, eval=FALSE---------------------------------------------
#  glm(formula = Maturity~Age,data = my.data, family = "binomial")
#  

## ----logistic input data, message=FALSE, warning=FALSE------------------------
library(AquaticLifeHistory)
data("maturity_data")
head(maturity_data)

# Maturity variable is binary (immature = 0, mature = 1)
range(maturity_data$Maturity)


## ----parameters, message=FALSE, warning=FALSE, eval=FALSE---------------------
#  
#  Estimate_Age_Maturity(maturity_data)
#  

## ----bootstrapped, warning=FALSE,  fig.height = 6, fig.width =7, eval=FALSE----
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 1000)
#  

## ----bootstrapped2, warning=FALSE,  fig.height = 6, fig.width =7, echo=FALSE----
# selecting return = "plot" returns a ggplot object rather than the parameters.
Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 10)


## ----with points bootstrapped, warning=FALSE,  fig.height = 6, fig.width =7, eval=FALSE----
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 1000, display.points = TRUE)
#  

## ----with points bootstrapped2, warning=FALSE,  fig.height = 6, fig.width =7, echo = FALSE----
# selecting return = "plot" returns a ggplot object rather than the parameters.
Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 10, display.points = TRUE)


## ----comparison, message=FALSE, warning=FALSE, eval = FALSE-------------------
#  
#  Estimate_Age_Maturity(maturity_data)
#  
#  Estimate_Age_Maturity(maturity_data, error.structure = "quasibinomial")
#  

## ----quasi age plot, warning=FALSE,  fig.height = 6, fig.width =7, eval = FALSE----
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 1000, error.structure = "quasibinomial")
#  

## ----quasi age plot2, warning=FALSE,  fig.height = 6, fig.width =7, echo=FALSE----
# selecting return = "plot" returns a ggplot object rather than the parameters.
Estimate_Age_Maturity(maturity_data, return = "plot", n.bootstraps = 10, error.structure = "quasibinomial")


## ----length parameters, message=FALSE, warning=FALSE, eval=FALSE--------------
#  
#  Estimate_Len_Maturity(maturity_data)
#  

## ----bootstrapped length, warning=FALSE,  fig.height = 6, fig.width =7, eval = FALSE----
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Estimate_Len_Maturity(maturity_data, return = "plot", n.bootstraps = 1000, display.points = TRUE)
#  

## ----bootstrapped length2, warning=FALSE,  fig.height = 6, fig.width =7, echo = FALSE----
# selecting return = "plot" returns a ggplot object rather than the parameters.
Estimate_Len_Maturity(maturity_data, return = "plot", n.bootstraps = 10, display.points = TRUE)


## ----length unit changed, warning=FALSE,  fig.height = 6, fig.width =7, eval=FALSE----
#  new_data <- maturity_data
#  new_data$Length <- new_data$Length*10
#  
#  Estimate_Len_Maturity(new_data, return = "plot", n.bootstraps = 1000, display.points = TRUE)
#  

## ----length unit changed2, warning=FALSE,  fig.height = 6, fig.width =7,echo=FALSE----
new_data <- maturity_data
new_data$Length <- new_data$Length*10 

Estimate_Len_Maturity(new_data, return = "plot", n.bootstraps = 10, display.points = TRUE)


## ----bin width, warning=FALSE,  fig.height = 6, fig.width =8, eval=FALSE------
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Estimate_Len_Maturity(maturity_data,
#                        return = "plot",
#                        n.bootstraps = 1000,
#                        error.structure = "quasibinomial",
#                        bin.width = 25)
#  

## ----bin width2, warning=FALSE,  fig.height = 6, fig.width =8, echo = FALSE----
# selecting return = "plot" returns a ggplot object rather than the parameters.
Estimate_Len_Maturity(maturity_data,
                      return = "plot",
                      n.bootstraps = 10,
                      error.structure = "quasibinomial",
                      bin.width = 25)


## ----bin width comparison, warning=FALSE, eval = FALSE------------------------
#  # Binomial model
#  Estimate_Len_Maturity(maturity_data)
#  
#  # Length in 10 cm bins
#  Estimate_Len_Maturity(maturity_data,
#                        error.structure = "quasibinomial",
#                        bin.width = 10)
#  
#  # Length in 25 cm bins
#  Estimate_Len_Maturity(maturity_data,
#                        error.structure = "quasibinomial",
#                        bin.width = 25)
#  
#  # Length in 30 cm bins
#  Estimate_Len_Maturity(maturity_data,
#                        error.structure = "quasibinomial",
#                        bin.width = 30)
#  

## ----estimate, warning=FALSE, eval = FALSE------------------------------------
#  # selecting return = "plot" returns a ggplot object rather than the parameters.
#  Mat_at_age_estimates <- Estimate_Age_Maturity(maturity_data,
#                                                return = "estimates",
#                                                n.bootstraps = 1000,
#                                                error.structure = "quasibinomial")
#  
#  
#  Mat_at_len_estimates <- Estimate_Len_Maturity(maturity_data,
#                                                return = "estimates",
#                                                n.bootstraps = 1000,
#                                                error.structure = "binomial")
#  
#  head(Mat_at_age_estimates)
#  
#  head(Mat_at_len_estimates)
#  

## ----estimate2, warning=FALSE, echo=FALSE-------------------------------------
# selecting return = "plot" returns a ggplot object rather than the parameters.
Mat_at_age_estimates <- Estimate_Age_Maturity(maturity_data,
                                              return = "estimates",
                                              n.bootstraps = 10,
                                              error.structure = "quasibinomial")


Mat_at_len_estimates <- Estimate_Len_Maturity(maturity_data,
                                              return = "estimates",
                                              n.bootstraps = 10,
                                              error.structure = "binomial")

head(Mat_at_age_estimates)

head(Mat_at_len_estimates)


