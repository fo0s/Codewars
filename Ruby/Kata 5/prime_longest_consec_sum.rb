# The prime 41 is the result of the sum of many consecutive primes.
#
# In fact, 2 + 3 + 5 + 7 + 11 + 13 = 41 , (6 addens)
#
# Furthermore, the prime 41 is the prime below 100 (val_max) that has
# the longest chain of consecutive prime addens.
#
# The prime with longest chain of addens for val_max = 500 is 499 with
# 17 addens.
#
# In fact: 3+5+7+11+13+17+19+23+29+31+37+41+43+47+53+59+61= 499
#
# Find the function prime_maxlength_chain()(primeMaxlengthChain() javascript),
# that receives an argument val_max, the upper limit, all the found primes
# should be less than val_max and outputs this found prime.
#
# Let's see some cases:
#
# prime_maxlength_chain(100) == [41]
# prime_maxlength_chain(500) == [499]
# If we have more than one prime with these features, the function should
# output an array with the found primes sorted.
#
# prime_maxlength_chain(499) == [379, 491]
# Random Tests for val_max (valMax)
#
# 100 ≤ val_max ≤ 500.000
# Enjoy it!
#
# describe "Basic Tests" do
#   it "Small Upper Bounds" do
#     Test.assert_equals(prime_maxlength_chain(100), [41])
#     Test.assert_equals(prime_maxlength_chain(200), [197])
#     Test.assert_equals(prime_maxlength_chain(500), [499])
#     Test.assert_equals(prime_maxlength_chain(1000), [953])
#   end
# end


def prime_maxlength_chain(val_max)
  # Build pre-req prime list
  prime_list = (2..val_max).to_a

  # Sort out imposters
  (2..val_max).each do |checked|
    (2..checked).each do |delete|
      prime_list.delete(checked) if checked % delete == 0 && checked != delete
    end
  end

  list = []
  output = []
  values = []
  prime_number = false
  p prime_list
  # Error Handling
  return output if prime_list.first(10).include?(val_max)

  if prime_list.include?(val_max)
    prime_list.pop
    prime_number = true
  end
  # Start search
  prime_list.first(10).each_with_index { |prime, index|
    # Where to search from
    accumulator = index
    loop do
      # Build comparison
      accumulator += 1
      compare = prime_list[index..accumulator]
      # If the sum of the comparison is a prime number, happy days
      sum_of_compare = compare.inject(:+)

      if prime_list.include?(sum_of_compare) && compare.length >= list.length
        list = compare
        values << compare.inject(:+)

      end
      # Try again with the next index spot
      break if sum_of_compare > prime_list.last # Break out if gone too far
    end
  }

  prime_number == true ? output << values.last(2) : output << values.last
  output.flatten
end

p prime_maxlength_chain(4995)
