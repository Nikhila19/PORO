# We are given an amount and a set of coins with differint coin values
# Assuming that the coin values are in descending order of their value
# We are asked to find the number of ways that we can get the amount using each coin as many number of times
# Solution:
# Given amount = 100, we try to make_change with 0..4 25 cent coin. We stop at 4 because 4*25 = 100 i.e i*value > amt after that
# i.e make_change(100, using 0..4 quarters)
# when using 4 queaters, the num_ways = 1
# For all others, we can use dimes
# make_change(100 using 0 quarters) = make_change(100 using 0 quarters and 0 dimes) + 
#                                     make_change(100 using 0 quarters and 1 dimes) + 
#                                     make_change(100 using 0 quarters and 2 dimes) + 
#                                     ....
# make_change(100 using 1 quarters) = make_change(75 using 0..7 dimes)