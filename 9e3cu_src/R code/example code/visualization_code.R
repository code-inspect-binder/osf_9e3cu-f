#Load the tidyverse package, which includes ggplot2
library(tidyverse)

# Make the table
tb2 <- data_frame("Additions" = c("E1", "E2", "E3", "E1 + E2", "E2 + E3", "E1 + E3", "E1 + E2 + E3"),
                  "Ub" = c(0.7, 0.7, 1.3, 2.4, 4.3, 5.3, 12.1))



#call the ggplot2 function
# plot column additions on the x, and Ub on the y
ggplot(tb2, aes(x = Additions, y = Ub)) +
  #pick a geom or type of plot, geom_point makes a scatter plot
  geom_point()

# plot column additions on the x but in reverse order, and Ub on the y 
ggplot(tb2, aes(x = fct_rev(fct_inorder(Additions)), y = Ub)) +
  # use a bar plot with blue bars
  geom_col(fill = "blue") +
  # use the black and white theme
  theme_bw() +
  # modify the defaults to remove the figure legend
  theme(legend.position = "none", 
        # change the title text to size 20 and bold
        axis.title = element_text(size = 20, face = "bold"), 
        # no y-axis title
        axis.title.y = element_blank(), 
        # change the axis label text to size 14, bold, and black color
        axis.text.x = element_text(size = 14, face = "bold", color = "black"),
        axis.text.y = element_text(size = 14, face = "bold", color = "black")) +
  # flip the axes so x-axis is now the vertical axis
  coord_flip() +
  # label the y-axis
  labs(y = "pmol of Ub conjugated")


# plot column additions on the x but in order, and Ub on the y 
ggplot(tb2, aes(x = fct_inorder(Additions), y = Ub)) +
  # shows points of size 4 and transparency (alpha) of 0.8, vary the color of the points
  geom_point(aes(color = Ub), size = 6, alpha = 0.8) +
  # add segments but vary the color and make the transparency (alpha) 0.2
  geom_segment(aes(x=Additions, xend=Additions, y=0, yend=Ub)) +
  # add text labels showing the numbers; label size 10 and bold
  geom_text(aes(label = Ub, y = Ub + 2, color = Ub), fontface = "bold", size = 8) +
  #use the black and white theme
  theme_bw() +
  # modify the defaults to remove the figure legend
  theme(legend.position = "none", 
        # change the title text to size 20 and bold
        axis.title = element_text(size = 20, face = "bold"), 
        # no y-axis title
        axis.title.y = element_blank(), 
        # change the axis label text to size 14, bold, and black color
        axis.text.x = element_text(size = 14, face = "bold", color = "black"),
        axis.text.y = element_text(size = 14, face = "bold", color = "black")) +
  scale_y_continuous(limits = c(0, 17), expand = c(0,0)) +
  # flip the axes so x-axis is now the vertical axis
  coord_flip() +
  # label the y-axis
  labs(y = "pmol of Ub conjugated")




