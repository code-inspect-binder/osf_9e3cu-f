# load packages
library(tidyverse)
library(readr)
library(broom)

# make the data
sat_curve <- data_frame(s = c(0.1, 0.2, 0.4, 0.8, 1, 1.5, 2, 4, 8, 10),
                        v = c(1, 2, 3.9, 7, 10, 12, 13, 14, 14.5, 15))

# fit the data using the nls function
mm <- nls(v ~ (V*s)/(K+s), data = sat_curve, start = list(V = 15, K = 1))

mm_tidy <- tidy(mm)

mm_fit <- data_frame(s = seq(0, 12, by = 0.1))

mm_fit$v <- predict(mm, newdata = mm_fit)


# plot the data
ggplot() +
  # data as a scatter plot, column s for x and column v for y, size 4 points, 
  # use the sat_curve data frame as the source
  geom_point(data = sat_curve, aes(x = s, y = v), size = 4) +
  # fit as a line plot, use the mm_fit data frame as the data source
  geom_line(data = mm_fit, aes(x = s, y = v)) +
  # don't expand the x axis
  scale_x_continuous(expand = c(0,0)) +
  # leave a little room on the max value of the y-axis
  scale_y_continuous(expand = c(0,0.1)) +
  # use the black and white theme
  theme_bw() +
  # modify the defaults to remove the figure legend
  theme(legend.position = "none",
        # change the title text to size 20 and bold
        axis.title = element_text(size = 20, face = "bold"),
        # change the axis label text to size 22, bold, and black color
        axis.text.x = element_text(size = 22, face = "bold", color = "black"),
        axis.text.y = element_text(size = 22, face = "bold", color = "black")) +
  # label the x and y axis
  labs(x = "[S] (mM)", y = "rate (mM/min)")

# plot the data as a Lineweaver-Burk fit
ggplot() +
  geom_point(data = sat_curve, aes(x = 1/s, y = 1/v), size = 4) +
  geom_line(data = mm_fit, aes(x = 1/s, y = 1/v)) +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0.1)) +
  theme_bw() +
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold"), 
        axis.text.x = element_text(size = 22, face = "bold", color = "black"),
        axis.text.y = element_text(size = 22, face = "bold", color = "black")) +
  labs(x = "1/[S] (1/mM)", y = "1/rate (min/mM)")


