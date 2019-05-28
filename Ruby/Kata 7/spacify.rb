=begin
Modify the spacify function so that it returns the given string
with spaces between each letter. In this exercise, you can assume
that only strings will be passed to your function.

spacify('hello world') // h e l l o  w o r l d

Test.assert_equals(spacify("hello world"),"h e l l o  w o r l d");
Test.assert_equals(spacify("12345"),"1 2 3 4 5");
=end

# def spacify(str)
#   str.chars.map{ |x| x == " " ? x.delete("") : x + " "}.join().chomp(' ')
# end



def spacify(str)
(str.chars*" ").gsub('  ',' ')
end

print spacify("Hello World")
