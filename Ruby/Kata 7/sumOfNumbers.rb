=begin

Given two integers a and b, which can be positive or negative, find
the sum of all the numbers between including them too and return it.
If the two numbers are equal return a or b.

Note: a and b are not ordered!

Examples
get_sum(1, 0) == 1   # 1 + 0 = 1
get_sum(1, 2) == 3   # 1 + 2 = 3
get_sum(0, 1) == 1   # 0 + 1 = 1
get_sum(1, 1) == 1   # 1 Since both are same
get_sum(-1, 0) == -1 # -1 + 0 = -1
get_sum(-1, 2) == 2  # -1 + 0 + 1 + 2 = 2

describe "Example Tests" do
  Test.assert_equals(get_sum(0,1),1)
  Test.assert_equals(get_sum(0,-1),-1)
  Test.assert_equals(get_sum(1,2),3)
  Test.assert_equals(get_sum(5,-1),14)
end

Example Tests
Log
tester 0 and 1
Expected: 1, instead got: nil
Log
tester 0 and -1
Expected: -1, instead got: nil
Log
tester 1 and 2
Expected: 3, instead got: nil
Log
tester 5 and -1
Expected: 14, instead got: nil

=end

def get_sum(a,b)
    # a != b ? a : (a..b).map!(:to_a).sort.inject(0, :+)

    c=[a,b].sort
    (c.first..c.last).each.inject(&:+)

    #--------------------Clever----------------------

    (a..b).reduce(:+) || (b..a).reduce(:+)

    (a + b) / 2.0 * ((a - b).abs + 1)
end

def get_sum(*args)
  (args.min..args.max).reduce(0, &:+)
end

p get_sum(5, -1)
