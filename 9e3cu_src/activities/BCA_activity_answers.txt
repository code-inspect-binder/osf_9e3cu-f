# BCA curve and calculation activity answers


#######
# import BCAdata.csv
bca <- read_csv("BCAdata.csv")
# rename the columns; makes it easier to plot the data
colnames(bca) <- c("BSA", "Abs562", "Absexp", "uL")


# plot the calibration curve (Abs vs. [BSA]) with an appropriate trendline and figure caption
ggplot(bca, aes(x = BSA, y = Abs562)) +
  # scatter plot with blue dots
  geom_point(fill = "blue") +
  # add a linear trendline
  geom_smooth(method = "lm", se = FALSE) +
  # black and white theme
  theme_bw() +
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold", color = "black"),
        axis.text = element_text(size = 14, face = "bold", color = "black")) +
  #label the axis
  labs(x = "concentration of BSA (mg/mL)", y = "Absorbance at 562 nm")

# fit the data using the lm function
bcafit <- lm(Abs562 ~ BSA, data = bca)

# calculate the fit coefficients
bcoefs <- coef(bcafit)

# calculate the R^2 value
R <- cor(bca$BSA, bca$Abs562)

# round the data
R <- round(R, digits = 2)

#######