# Move the first letter of each word to the end of it, then add "ay" to
# the end of the word. Leave punctuation marks untouched.
#
# Examples
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldway !
#
# Test.assert_equals(pig_it('Pig latin is cool'),'igPay atinlay siay oolcay')
# Test.assert_equals(pig_it('This is my string'),'hisTay siay ymay tringsay');

def pig_it(text)
  output = ""
  text.split( ).map {|x|
    (x & "?", "!").any? puts "yes"
    word = x[0] + "ay "
    x.reverse!.chop!.reverse!
    x << word
    output.concat(x)
    }
  output.chop!
   output.include?("!") || output.include?("?") ? output[0..output.length - 3] : output
end

p pig_it('Quis custodiet ipsos custodes !')

-------------------------- BEST ANSWER--------------------------------
def pig_it text
  text.gsub(/(\w)(\w+)*/, '\2\1ay')
end
-----------------------------------------------------------------------
