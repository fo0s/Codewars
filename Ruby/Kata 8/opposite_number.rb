=begin
Very simple, given a number, find its opposite.

Examples:

1: -1
14: -14
-34: 34

But can you do it in 1 line of code and without any conditionals?


Test.assert_equals(opposite(1), -1, msg = nil)

=end

def opposite(n)
 -n
end

p opposite(32)
