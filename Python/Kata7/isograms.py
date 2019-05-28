# An isogram is a word that has no repeating letters, consecutive or
# non-consecutive. Implement a function that determines whether a string
# that contains only letters is an isogram. Assume the empty string is an
# isogram. Ignore letter case.

# is_isogram("Dermatoglyphics") == true
# is_isogram("aba") == false
# is_isogram("moOse") == false  # -- ignore letter case

# Test.assert_equals(is_isogram("Dermatoglyphics"), True)
# Test.assert_equals(is_isogram("isogram"), True)
# Test.assert_equals(is_isogram("aba"), False, "same chars may not be adjacent")
# Test.assert_equals(is_isogram("moOse"), False,
#                    "same chars may not be same case")
# Test.assert_equals(is_isogram("isIsogram"), False)
# Test.assert_equals(is_isogram(""), True, "an empty string is a valid isogram")


def is_isogram(string):
    output = []
    for char in string:
        if char.lower() in output:
            return False
        else:
            output.append(char.lower())
    return True


print(is_isogram("isogram"))

# Best answer


def is_isogram(string):
    return len(string) == len(set(string.lower()))
