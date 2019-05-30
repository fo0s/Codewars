# Welcome. In this kata, you are asked to square every digit of a number.

# For example, if we run 9119 through the function, 811181
# will come out, because 92 is 81 and 12 is 1.

# Note: The function accepts an integer and returns an integer

# test.assert_equals(square_digits(9119), 811181)


def square_digits(num):
    return int(''.join((str(int(number)**2) for number in list(str(num)))))


print(square_digits(9119))

# Best answer


def square_digits(num):
    ret = ""
    for x in str(num):
        ret += str(int(x)**2)
    return int(ret)
