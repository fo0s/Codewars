# Your task is to write function findSum.
#
# Upto and including n, this function will return the sum of all multiples of 3 and 5.
#
# For example:
#
# findSum(5) should return 8 (3 + 5)
#
# findSum(10) should return 33 (3 + 5 + 6 + 9 + 10)


# def find(n)
#   numbers = n.to_s + "("
#   (3...n).each { |x| numbers.concat(x.to_s + "+") if x%3 == 0 || x%5 == 0 }
#   numbers = numbers.gsub(/\+$/, '') + ")"
#   return numbers
# end
#
# puts find(50)

# def find1(n)
#   count = Array.new
#   add_up = 0
#   numbers = ""
#   (3..n).each { |x|
#     if x%3 == 0 || x%5 == 0
#       count.push(x)
#       numbers.concat(x.to_s + "+")
#       add_up += x
#     else
#
#     end
#   }
#   numbers = numbers.gsub(/\+$/, '')
#   return add_up.to_s + " (" + numbers + ")"
# end

def find(n)
  (3..n).select { |x| (x % 3).zero? || (x % 5).zero? }.reduce(0, :+)
end

def find(n)
  total = 0
  (3..n).each { |x| total += x if x%3 == 0 || x%5 == 0 }
end

find(10)
