# Complete the solution so that it returns true if the first
# argument(string) passed in ends with the 2nd argument(also a string).

# Examples:

# solution('abc', 'bc')  # returns true
# solution('abc', 'd')  # returns false

# test.assert_equals(solution('abcde', 'cde'), True)
# test.assert_equals(solution('abcde', 'abc'), False)


def solution(string, ending):
    if string[-len(ending):] == ending:
        return True
    else:
        return False


print(solution('abcde', 'abc'))

# Best solution


def solution(string, ending):
    return string.endswith(ending)
