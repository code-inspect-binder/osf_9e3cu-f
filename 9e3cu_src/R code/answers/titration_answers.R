# titration answers

#######

# Load the titration curves data
df <- read_excel("Titrationcurves.xlsx")

# Fit each column to a binding equation nls(fluor ~ (L])/(Kd + [L])....) to calculate Kd. For a challenge that # makes the data easier to see, normalize the data, then do the fitting. 
maxfluor <- max(df$MAL) 


dffit <- df %>%
  # convert data from wide to long
  gather(., sugar, fluor, 2:5) %>%
  # normalize the data
  mutate(normd = fluor/maxfluor) %>%
  # group by the sugar...
  group_by(sugar) %>%
  # to fit each set of data independently
  do(tidy(nls(normd ~ ligand/(K + ligand), ., start = c(K = 3)))) %>%
  # select the resulting data for the table of fitting values
  select(., 1, 3:4)

# rename the columns for the table
colnames(dffit_tidy) <- c("ligand", "Kd (uM)", "standard deviation")
# Make a table and display the table with the resulting Kd values and errors in a separate column

knitr::kable(dffit_tidy)

## Make the plot
# make the fitting lines by making an range of concentration spanning the data range in df$ligand
fit_num <- tibble(s = seq(from = 0, to = 75, by = 1))

# use mutate and the dffit fit information to make the data for mal
mal_fit <- fit_num %>%
  mutate(fit = (s)/(1.196506 + s))

dex_fit <- fit_num %>%
  mutate(fit = (s)/(62.736799 + s))

lac_fit <- fit_num %>%
  mutate(fit = (s)/(43.839063 + s))

maldex_fit <- fit_num %>%
  mutate(fit = (s)/(7.253739 + s))

# plot the data and fits
ggplot() +
  # plot the data for dextrose
  geom_point(data = df, aes(x = ligand, y = DEX/maxfluor), color = "red", size = 2) +
  geom_line(data = dex_fit, aes(x = s, y = fit), color = "red") +
  # plot the data for maltose
  geom_point(data = df, aes(x = ligand, y = MAL/maxfluor), color = "blue", size = 2) +
  geom_line(data = mal_fit, aes(x = s, y = fit), color = "blue") +
  # plot the data for lactose
  geom_point(data = df, aes(x = ligand, y = LAC/maxfluor), color = "purple", size = 2) +
  geom_line(data = lac_fit, aes(x = s, y = fit), color = "purple") +
  # plot the data for maltodextrin
  geom_point(data = df, aes(x = ligand, y = MALDEX/maxfluor), color = "brown", size = 2) +
  geom_line(data = maldex_fit, aes(x = s, y = fit), color = "brown") +
  # black and white theme
  theme_bw() +
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold", color = "black"),
        axis.text = element_text(size = 14, face = "bold", color = "black")) +
  #label the axis
  labs(x = "ligand concentration (uM)", y = "Fraction bound") +
  # make the axes start at zero and encompass the data
  scale_x_continuous(expand = c(0,0), limits = c(0,56)) +
  scale_y_continuous(expand = c(0,0), limits = c(0,1.1))
