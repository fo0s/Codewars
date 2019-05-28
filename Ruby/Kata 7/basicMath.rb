=begin

In this kata, you will do addition and subtraction on a given string.
The return value must be also a string.

Note: the input will not be empty.

Examples
"1plus2plus3plus4"  --> "10"
"1plus2plus3minus4" -->  "2"

Test.describe("Basic tests") do
	Test.assert_equals(calculate('1plus2plus3plus4'), '10')
	Test.assert_equals(calculate('1minus2minus3minus4'), '-8')
	Test.assert_equals(calculate('1plus2plus3minus4'), '2')
end

Test Results:
 Basic tests
 Log
1plus2plus3plus4
Expected: "10", instead got: nil
 Log
1minus2minus3minus4
Expected: "-8", instead got: nil
 Log
1plus2plus3minus4
Expected: "2", instead got: nil
 Log
1minus2plus3minus4
Expected: "-2", instead got: nil
 Log
1plus2minus3plus4minus5
Expected: "-1", instead got: nil

=end

def calculate(str)
  replacements = [ ["plus", "+"], ["minus", "-"] ]
  replacements.each {|replacement| str.gsub!(replacement[0], replacement[1])}
  return eval(str).to_s
end

p calculate('1plus2plus3minus4')
