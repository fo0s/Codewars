=begin
Modify the kebabize function so that it converts a camel case
string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

Test.assert_equals(kebabize('myCamelCasedString'), 'my-camel-cased-string');
Test.assert_equals(kebabize('myCamelHas3Humps'), 'my-camel-has-humps');

=end

def kebabize(str)
  str.gsub(/[0-9]/, "").split(/(?=[A-Z])/).join("-").downcase
end

puts kebabize('myCamelCasedString')
