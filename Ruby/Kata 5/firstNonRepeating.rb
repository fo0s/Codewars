# Write a function named first_non_repeating_letter that takes a
# string input, and returns the first character that is not
# repeated anywhere in the string.
#
# For example, if given the input 'stress', the function should
# return 't', since the letter t only occurs once in the string,
# and occurs first in the string.
#
# As an added challenge, upper- and lowercase letters are
# considered the same character, but the function should return
# the correct case for the initial letter. For example, the input
# 'sTreSS' should return 'T'.
#
# If a string contains all repeating characters, it should return
# an empty string ("") or None -- see sample tests.
#
# -----------------------------Examples-------------------------------
#
# Test.describe('Simple Tests') do
#   it('should handle simple tests') do
#     Test.assert_equals(first_non_repeating_letter('a'), 'a')
#     Test.assert_equals(first_non_repeating_letter('stress'), 't')
#     Test.assert_equals(first_non_repeating_letter('moonmen'), 'e')
#   end
#   it('should handle empty strings') do
#     Test.assert_equals(first_non_repeating_letter(''), '')
#   end
# end
#
# ----------------------------------------------------------------------

def first_non_repeating_letter(s)
	array = s.split("")
  letter = ""
	array.each_with_index do |l,i|
		array_copy = array.clone
		array_copy.delete_at(i)
		puts "l: #{l} - i: #{i} - array: #{array} -  copy: #{array_copy}"
		unless array_copy.include? l.downcase or array_copy.include? l.upcase
			letter = l
			break
		end
	end
  return s.empty? ? "" : (letter.empty? ? "" : letter)
end
