## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
citation("AquaticLifeHistory")

## ----message=FALSE, warning=FALSE---------------------------------------------
library(AquaticLifeHistory)

data("growth_data")

head(growth_data) 

## ----message=FALSE, fig.height = 6, fig.width = 8, eval=FALSE-----------------
#  Estimate_Growth(data = growth_data)

## ----message=FALSE, fig.height = 6, fig.width = 8, echo =FALSE----------------
Estimate_Growth(data = growth_data, n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE---------------
#  Estimate_Growth(data = growth_data, models = "VB")

## ----message=FALSE, fig.height = 6, fig.width = 8, echo=FALSE-----------------
Estimate_Growth(data = growth_data, models = "VB", n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE---------------
#  Estimate_Growth(data = growth_data, models = c("Log", "Gom"))

## ----message=FALSE, fig.height = 6, fig.width = 8, echo = FALSE---------------
Estimate_Growth(data = growth_data, models = c("Log", "Gom"), n.bootstraps = 10)

## ----error = TRUE,  message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE----
#  Estimate_Growth(data = growth_data, models = "VBGF")

## ----error = TRUE,  message=FALSE, fig.height = 6, fig.width = 8,echo=FALSE----
Estimate_Growth(data = growth_data, models = "VBGF", n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE---------------
#  Results <- Estimate_Growth(data = growth_data, models = "VB", plot.legend = FALSE)

## ----message=FALSE, fig.height = 6, fig.width = 8, echo = FALSE---------------
Results <- Estimate_Growth(data = growth_data, models = "VB", plot.legend = FALSE, n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE---------------
#  new.dat <- growth_data
#  new.dat$Length <- new.dat$Length/10
#  
#  Results <- Estimate_Growth(new.dat)

## ----message=FALSE, fig.height = 6, fig.width = 8, echo=FALSE-----------------
new.dat <- growth_data
new.dat$Length <- new.dat$Length/10

Results <- Estimate_Growth(new.dat, n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval=FALSE-----------------
#  results <- Estimate_Growth(data = growth_data, plots = FALSE)
#  
#  Length_at_age_estimates <- results$Estimates
#  
#  head(Length_at_age_estimates)

## ----message=FALSE, fig.height = 6, fig.width = 8, echo=FALSE-----------------
results <- Estimate_Growth(data = growth_data, plots = FALSE, n.bootstraps = 10)

Length_at_age_estimates <- results$Estimates

head(Length_at_age_estimates)

## ----message=FALSE, eval = FALSE----------------------------------------------
#  results <- Estimate_Growth(data = growth_data,  plots = FALSE)
#  Calculate_MMI(results)

## ----message=FALSE, echo=FALSE------------------------------------------------
results <- Estimate_Growth(data = growth_data,  plots = FALSE, n.bootstraps = 10)
Calculate_MMI(results)

## ----warning = FALSE, message=FALSE, fig.height = 8, fig.width = 6, eval = FALSE----
#  # Create data.frames of separate sexes
#  Females <- dplyr::filter(growth_data, Sex == "F")
#  Males <- dplyr::filter(growth_data, Sex == "M")
#  
#  # Estimate growth
#  Female_ests <- Estimate_Growth(Females,n.bootstraps = 1000, plots = FALSE)
#  Male_ests <- Estimate_Growth(Males, n.bootstraps = 1000,plots = FALSE)
#  
#  # Combine data sets with a new variable designating sex
#  Female_LAA <- Female_ests$Estimates
#  Female_LAA$Sex <- "F"
#  
#  Male_LAA <- Male_ests$Estimates
#  Male_LAA$Sex <- "M"
#  
#  combined_data <- rbind(Male_LAA, Female_LAA)
#  
#  library(ggplot2)
#  
#  ggplot(combined_data, aes(x = Age, y = AVG, fill = Model, col = Model)) +
#    facet_wrap(~Sex, ncol = 1, scales = "free")+
#    geom_point(data = Males, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
#    geom_point(data = Females, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
#    geom_ribbon(aes(ymin = low, ymax = upp, col = NA), alpha = 0.2)+
#    geom_line(size = 1)+
#    scale_y_continuous(name = "Length (mm)", limits = c(0,2500), expand = c(0,0))+
#    scale_x_continuous(name = "Age (years)", limits = c(0,18), expand = c(0,0))+
#    theme_bw()

## ----warning = FALSE, message=FALSE, fig.height = 8, fig.width = 6, echo = FALSE----
# Create data.frames of separate sexes
Females <- dplyr::filter(growth_data, Sex == "F")
Males <- dplyr::filter(growth_data, Sex == "M")

# Estimate growth
Female_ests <- Estimate_Growth(Females,n.bootstraps = 10, plots = FALSE)
Male_ests <- Estimate_Growth(Males, n.bootstraps = 10,plots = FALSE)

# Combine data sets with a new variable designating sex
Female_LAA <- Female_ests$Estimates
Female_LAA$Sex <- "F"

Male_LAA <- Male_ests$Estimates
Male_LAA$Sex <- "M"

combined_data <- rbind(Male_LAA, Female_LAA)

library(ggplot2)

ggplot(combined_data, aes(x = Age, y = AVG, fill = Model, col = Model)) +
  facet_wrap(~Sex, ncol = 1, scales = "free")+
  geom_point(data = Males, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
  geom_point(data = Females, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
  geom_ribbon(aes(ymin = low, ymax = upp, col = NA), alpha = 0.2)+
  geom_line(size = 1)+
  scale_y_continuous(name = "Length (mm)", limits = c(0,2500), expand = c(0,0))+
  scale_x_continuous(name = "Age (years)", limits = c(0,18), expand = c(0,0))+
  theme_bw()

## ----message=FALSE, fig.height = 6, fig.width = 8, eval=FALSE-----------------
#  Estimate_Growth(growth_data, Birth.Len = 600)

## ----message=FALSE, fig.height = 6, fig.width = 8, echo=FALSE-----------------
Estimate_Growth(growth_data, Birth.Len = 600, n.bootstraps = 10)

## ----message=FALSE, fig.height = 6, fig.width = 8, eval = FALSE---------------
#  # Fit models
#  two_pars <- Estimate_Growth(growth_data, models = "VB", Birth.Len = 600, plots = FALSE)
#  three_pars <- Estimate_Growth(growth_data, models = "VB", plots = FALSE)
#  
#  # Change Model name to represent how many parameters they have
#  two_pars_Ests <- two_pars$Estimates
#  two_pars_Ests$Model <- "2 parameter VBGF"
#  
#  three_pars_Ests <- three_pars$Estimates
#  three_pars_Ests$Model <- "3 parameter VBGF"
#  
#  combined_data <- rbind(two_pars_Ests, three_pars_Ests)
#  
#  ggplot(combined_data, aes(x = Age, y = AVG, fill = Model, col = Model)) +
#    geom_point(data = growth_data, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
#    geom_ribbon(aes(ymin = low, ymax = upp, col = NA), alpha = 0.2)+
#    geom_line(size = 1)+
#    scale_y_continuous(name = "Length (mm)", limits = c(0,2500), expand = c(0,0))+
#    scale_x_continuous(name = "Age (years)", limits = c(0,18), expand = c(0,0))+
#    theme_bw() +
#    theme(legend.position = c(0.8, 0.2))

## ----message=FALSE, fig.height = 6, fig.width = 8, echo=FALSE-----------------
# Fit models
two_pars <- Estimate_Growth(growth_data, models = "VB", Birth.Len = 600, plots = FALSE, n.bootstraps = 10)
three_pars <- Estimate_Growth(growth_data, models = "VB", plots = FALSE, n.bootstraps = 10)

# Change Model name to represent how many parameters they have
two_pars_Ests <- two_pars$Estimates
two_pars_Ests$Model <- "2 parameter VBGF"

three_pars_Ests <- three_pars$Estimates
three_pars_Ests$Model <- "3 parameter VBGF"

combined_data <- rbind(two_pars_Ests, three_pars_Ests)

ggplot(combined_data, aes(x = Age, y = AVG, fill = Model, col = Model)) +
  geom_point(data = growth_data, aes(x = Age, y = Length, fill = NULL, col = NULL), alpha = .3) +
  geom_ribbon(aes(ymin = low, ymax = upp, col = NA), alpha = 0.2)+
  geom_line(size = 1)+
  scale_y_continuous(name = "Length (mm)", limits = c(0,2500), expand = c(0,0))+
  scale_x_continuous(name = "Age (years)", limits = c(0,18), expand = c(0,0))+
  theme_bw() +
  theme(legend.position = c(0.8, 0.2))

## ----eval = FALSE-------------------------------------------------------------
#  Estimate_Growth(growth_data, correlation.matrix = TRUE)

## ----echo=FALSE---------------------------------------------------------------
Estimate_Growth(growth_data, correlation.matrix = TRUE, n.bootstraps = 10)

