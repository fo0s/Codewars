=begin

Task
 	In this simple Kata your task is to create a function that
  turns a string into a Mexican Wave. You will be passed a
  string and you must return that string in an array where
  an uppercase letter is a person standing up.
  Rules

  1.  The input string will always be lower case but maybe empty.

  2.  If the character in the string is whitespace then pass over it
  as if it was an empty seat.
  Example
  wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  Good luck and enjoy!

  result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  Test.assert_equals(wave("hello"), result, "Should return: '#{result}'")

  result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars",
  "codewArs", "codewaRs", "codewarS"]
  Test.assert_equals(wave("codewars"), result, "Should return: '#{result}'")

  result = []
  Test.assert_equals(wave(""), result, "Should return: '#{result}'")

  result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
  Test.assert_equals(wave("two words"), result, "Should return: '#{result}'")

  result = [" Gap ", " gAp ", " gaP "]
  Test.assert_equals(wave(" gap "), result, "Should return: '#{result}'")

=end

# def wave(str)
#   num = 0
#   output = Array.new
#
#
#   while num != str.size
#   puts "Number: #{num}"
#   new_str = str.sub(str[num], str[num].upcase)
#   puts "New word: #{new_str}"
#   output << new_str
#   num +=1
#   end
#   return output
# end

# def wave(str)
#   new_arr = []
#   (0...str.length).each{|position|
#     if str[position] == " "
#     else
#       split_string = str.split("")
#       upcase_letter = str[position].upcase!
#       p upcase_letter
#       puts
#       split_string.delete_at(position)
#       new_arr.push(split_string.join("").insert(position,upcase_letter))
#
#       # Array.new(str.size){str.split("").push()}
#
#     end
#   }
#   return new_arr
# end

def wave(str)
  num = 0
  output = Array.new
  while str.length > 0
    new_str = str.split("")
    if str[num] == " "
    else
      break if new_str[num].nil?
      new_str[num] = new_str[num].upcase
      output << new_str.join("")
    end
    num += 1
  end
  output
end

p wave("two words")
