# Your task is to make function, which returns the sum of a sequence of integers.
#
# The sequence is defined by 3 non-negative values: begin, end, step.
#
# If begin value is greater than the end, function should returns 0
#
# Examples
#
# sequenceSum(2,2,2) === 2
# sequenceSum(2,6,2) === 12 // 2 + 4 + 6
# sequenceSum(1,5,1) === 15 // 1 + 2 + 3 + 4 + 5
# sequenceSum(1,5,3) === 5 // 1 + 4
# This is the first kata in the series:
#
# 1) Sum of a sequence (this kata)
# 2) Sum of a Sequence [Hard-Core Version]
#
# Test.describe("Basic tests") do
# Test.assert_equals(sequence_sum(2, 6, 2), 12)
# Test.assert_equals(sequence_sum(1, 5, 1), 15)
# Test.assert_equals(sequence_sum(1, 5, 3), 5)
# Test.assert_equals(sequence_sum(0, 15, 3), 45)
# Test.assert_equals(sequence_sum(16, 15, 3), 0)
# Test.assert_equals(sequence_sum(2, 24, 22), 26)
# Test.assert_equals(sequence_sum(2, 2, 2), 2)
# Test.assert_equals(sequence_sum(2, 2, 1), 2)
# Test.assert_equals(sequence_sum(1, 15, 3), 35)
# Test.assert_equals(sequence_sum(15, 1, 3), 0)
# end

def sequence_sum(begin_number, end_number, step)
  (begin_number..end_number).step(step).sum
end
p sequence_sum(1, 5, 1)
