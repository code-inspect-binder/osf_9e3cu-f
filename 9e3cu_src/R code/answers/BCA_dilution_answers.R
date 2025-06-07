# BCA dilution answers




#######
# Optional data  fitting
## import BCAdata.csv
bca <- read_csv("BCAdata.csv")
# rename the columns; makes it easier to plot the data
colnames(bca) <- c("BSA", "Abs562", "Absexp", "uL")

# fit the data using the lm function
bcafit <- lm(Abs562 ~ BSA, data = bca)

# calculate the fit coefficients
bcoefs <- coef(bcafit)

##

# extract the data from the fit
const <- bcoefs[1]
slpe <- bcoefs[2]

# select the data
samptab <- bca %>%
  select(., 3:4) %>%
  # convert absorbance to concentration
  mutate(dilconc = (Absexp-const)/slpe) %>%
  # correct concentration for the dilution
  mutate(conc = (dilconc*200)/uL) %>%
  # remove bad data
  filter(!is.na(conc)) %>%
  # select the final data
  select(., 1,4)

# rename the columns for display
colnames(samptab) <- c("Absorbance", "Concentration (mg/mL)")

#display table using knitr::kable
knitr::kable(samptab, row.names = TRUE)

#######