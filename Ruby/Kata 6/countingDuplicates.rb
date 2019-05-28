=begin

Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive
alphabetic characters and numeric digits that occur more than once in the
input string. The input string can be assumed to contain only alphabets
(both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

Test.assert_equals(duplicate_count(""), 0)
Test.assert_equals(duplicate_count("abcde"), 0)
Test.assert_equals(duplicate_count("abcdeaa"), 1)
Test.assert_equals(duplicate_count("abcdeaB"), 2)
Test.assert_equals(duplicate_count("Indivisibilities"), 2)

=end

def duplicate_count(text)
  new = text.split('').uniq
  new.each { |x| num += 1 if text.downcase.count(x) > 1 }
  num
end

#-------------------------------Better--------------------------

# def duplicate_count(text)
#   ('a'..'z').count { |c| text.downcase.count(c) > 1 }
# end
#
# def duplicate_count(text)
#   arr = text.downcase.split("")
#   arr.uniq.count { |n| arr.count(n) > 1 }
# end
#
# def duplicate_count(text)
#   text.scan(/(\w)(?=(?!.*\1.*\1).*\1)/i).length
# end

#---------------------------------------------------------------

p duplicate_count('abcdeaB')
