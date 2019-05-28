# Summation
# Write a program that finds the summation of every number from 1
# to num. The number will always be a positive integer greater than 0.

# For example:

# summation(2) -> 3
# 1 + 2

# summation(8) -> 36
# 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8

# test.describe('Summation')
# test.it('Should return the correct total')
# test.assert_equals(summation(1), 1)
# test.assert_equals(summation(8), 36)


def summation(num):
    output = 0
    for x in range(num):
        output = output + (x + 1)

    return output


print(summation(8))
