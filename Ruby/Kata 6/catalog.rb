# You are given a small extract of a catalog:
#
# s = "<prod><name>drill</name><prx>99</prx><qty>5</qty></prod>
#
# <prod><name>hammer</name><prx>10</prx><qty>50</qty></prod>
#
# <prod><name>screwdriver</name><prx>5</prx><qty>51</qty></prod>
#
# <prod><name>table saw</name><prx>1099.99</prx><qty>5</qty></prod>
#
# <prod><name>saw</name><prx>9</prx><qty>10</qty></prod>
#
# ...
# (prx stands for price, qty for quantity) and an article i.e "saw".
#
# The function catalog(s, "saw") returns the line(s) corresponding to the
# article with $ before the prices:
#
# "table saw > prx: $1099.99 qty: 5\nsaw > prx: $9 qty: 10\n..."
# If the article is not in the catalog return "Nothing".
#
# Notes
# There is a blank line between two lines of the catalog.
# The same article may appear more than once. If that happens return all
# the lines concerned by the article (in the same order as in the catalog).
# The line separator of results may depend on the language \nor \r\n. You
# can see examples in the "Sample tests".
#
# $s="<prod><name>drill</name><prx>99</prx><qty>5</qty></prod>
#
# <prod><name>hammer</name><prx>10</prx><qty>50</qty></prod>
#
# <prod><name>screwdriver</name><prx>5</prx><qty>51</qty></prod>
#
# <prod><name>table saw</name><prx>1099.99</prx><qty>5</qty></prod>
#
# <prod><name>saw</name><prx>9</prx><qty>10</qty></prod>
#
# <prod><name>chair</name><prx>100</prx><qty>20</qty></prod>
#
# <prod><name>fan</name><prx>50</prx><qty>8</qty></prod>
#
# <prod><name>wire</name><prx>10.8</prx><qty>15</qty></prod>
#
# <prod><name>battery</name><prx>150</prx><qty>12</qty></prod>
#
# <prod><name>pallet</name><prx>10</prx><qty>50</qty></prod>
#
# <prod><name>wheel</name><prx>8.80</prx><qty>32</qty></prod>
#
# <prod><name>extractor</name><prx>105</prx><qty>17</qty></prod>
#
# <prod><name>bumper</name><prx>150</prx><qty>3</qty></prod>
#
# <prod><name>ladder</name><prx>112</prx><qty>12</qty></prod>
#
# <prod><name>hoist</name><prx>13.80</prx><qty>32</qty></prod>
#
# <prod><name>platform</name><prx>65</prx><qty>21</qty></prod>
#
# <prod><name>car wheel</name><prx>505</prx><qty>7</qty></prod>
#
# <prod><name>bicycle wheel</name><prx>150</prx><qty>11</qty></prod>
#
# <prod><name>big hammer</name><prx>18</prx><qty>12</qty></prod>
#
# <prod><name>saw for metal</name><prx>13.80</prx><qty>32</qty></prod>
#
# <prod><name>wood pallet</name><prx>65</prx><qty>21</qty></prod>
#
# <prod><name>circular fan</name><prx>80</prx><qty>8</qty></prod>
#
# <prod><name>exhaust fan</name><prx>62</prx><qty>8</qty></prod>
#
# <prod><name>window fan</name><prx>62</prx><qty>8</qty></prod>"
#
# def testing(s, f, exp)
#     print("testing string with article : ",f, "\n")
#     actual = catalog(s, f)
#     print('Actual:', "\n", actual, "\n")
#     print('Expect:', "\n", exp, "\n")
#     Test.assert_equals(actual, exp)
#     puts("#")
# end
#
# Test.describe("catalog") do
#   Test.it("Basic tests") do
#     testing($s, "ladder" , "ladder > prx: $112 qty: 12")
#     testing($s, "saw" , "table saw > prx: $1099.99 qty: 5\nsaw >
#       prx: $9 qty: 10\nsaw for metal > prx: $13.80 qty: 32")
#
#   end
# end

def catalog(s, f)
    output = []
    replacements = {  '<prod><name>' => '',
                      '</name><prx>' => ' > prx: $',
                      '</prx><qty>' => ' qty: ',
                      '</qty></prod>' => ''
                    }

    s.gsub(Regexp.union(replacements.keys), replacements).split("\n").each { |line| output << line if line.include?(f) }
    output.empty? ? "Nothing" : output.join("\n")
end
