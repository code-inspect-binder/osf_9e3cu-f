# Fitting a non-linear set of data
# The data in the titration file contain titration curves of several sugars binding to a fluorescent sensor
# The data are non-linear and to calculate Kd require fitting to the equation fluor ~ (f * [L])/(Kd + [L]) which the nlstools
# package can do. This activity can be a fitting activity to produce numbers or a graphing activity to produce a plot or both. 
# This data set can be difficult to work with initially as there are mulitple sugars each requiring an independent fit. 
# One possible answer is provided in the answer folder under titration_answers

# Students can learn:
# Fitting non-linear data
# Using the mutate, filter, group_by functions
# Producing plots in ggplot2
# Producing table


#######
# Load the titration curves data

# Fit each column to a binding equation nls(fluor ~ (f * [L])/(Kd + [L])....) to calculate Kd. For a challenge that 
# makes the data easier to see, normalize the data, then do the fitting. 

# Make a table and display the table with the resulting Kd values and errors in a separate column

# Use the fitting coefficient to make fits for each data set

# plot the data in ggplot2 with each data set and fit in matching colors

#######