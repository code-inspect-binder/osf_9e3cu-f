# Intro to ggplot2 code
# This code chunk is used in the data visualization activity as the first
# introduction to ggplot2 within the tidyverse of packages. The data are taken from
# Hershko, et al. (1983). The plots are shown by the instructor as examples of 
# plots and how to increase the appeal and information content with each iteration.
# Students are then encouraged to explore ggplot2 to improve the plot further.
# a geom is the type of plot
# aesthetics define the variables
# themes control the overall plot design
# suggested resources : https://ggplot2.tidyverse.org/
# options for many types to data and includes R code: https://www.data-to-viz.com/
  


#######
#Load the tidyverse package, which includes ggplot2
library(tidyverse)

# Make the table
tb2 <- data_frame("Additions" = c("E1", "E2", "E3", "E1 + E2", "E2 + E3", "E1 + E3", "E1 + E2 + E3"),
                  "Ub" = c(0.7, 0.7, 1.3, 2.4, 4.3, 5.3, 12.1))

# show data as a table --> what was done in original paper!
tb2

#######

# Plot 1 --> plain, bad, and hard to see

#call the ggplot2 function, indicate the data set (tb2) and the x and y values
ggplot(tb2, aes(x = Additions, y = Ub)) +
  #geom_point makes a scatter plot
  geom_point()

# ask for student thoughts after showing this plot and what could be improved
# show plot 2 OR work together to improve the plot

#######

# plot 2 --> plan but clearer

#call the ggplot2 function, indicate the data set (tb2) and the x and y values
# put the x categories in order
ggplot(tb2, aes(x = fct_rev(fct_inorder(Additions)), y = Ub)) +
  # bar plot colored blue
  geom_col(fill = "blue") +
  # black and white theme
  theme_bw() +
  #make text easier to see
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold"), 
        axis.title.y = element_blank(), 
        axis.text.x = element_text(size = 14, face = "bold", color = "black"),
        axis.text.y = element_text(size = 14, face = "bold", color = "black")) +
  # flip plot horizontal
  coord_flip() +
  # add a label
  labs(y = "pmol of Ub conjugated")

#######

# plot 3 --> getting fancier

#call the ggplot2 function, indicate the data set (tb2) and the x and y values
# put the x categories in order
ggplot(tb2, aes(x = fct_rev(fct_inorder(Additions)), y = Ub)) +
  # bar plot colored by each category
  geom_col(aes(fill = Ub)) +
  # black and white theme
  theme_bw() +
  #make text easier to see
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold"), 
        axis.title.y = element_blank(), 
        axis.text.x = element_text(size = 14, face = "bold", color = "black"),
        axis.text.y = element_text(size = 14, face = "bold", color = "black")) +
  # flip plot horizontal
  coord_flip() +
  # add a label
  labs(y = "pmol of Ub conjugated")

# start to let students explore!

#######

# plot 4 --> better?
#call the ggplot2 function, indicate the data set (tb2) and the x and y values
# put the x categories in order
ggplot(tb2, aes(x = fct_rev(fct_inorder(Additions)), y = Ub)) +
  # bar plot colored by each category
  geom_col(aes(fill = Ub)) +
  # add number labels to the values
  geom_text(aes(label = Ub, y = Ub + 0.5, color = Ub), fontface = "bold") +
  # black and white theme
  theme_bw() +
  #make text easier to see
  theme(legend.position = "none", 
        axis.title = element_text(size = 20, face = "bold"), 
        axis.title.y = element_blank(), 
        axis.text.x = element_text(size = 14, face = "bold", color = "black"),
        axis.text.y = element_text(size = 14, face = "bold", color = "black")) +
  # flip plot horizontal
  coord_flip() +
  # add a label
  labs(y = "pmol of Ub conjugated")

# let the students explore!
# suggested resources : https://ggplot2.tidyverse.org/
# options for many types to data and includes R code: https://www.data-to-viz.com/

####### 