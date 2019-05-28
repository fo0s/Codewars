# 2nd in a series of sudoku solvers for ruby, in this kata you will be faced
#  with slightly harder puzzles.
#
# The examples should always have paths to be followed where there is only
# one gap in at least one row or column so you shouldn't need to worry about
# the blocks of 9 at the moment. The initial puzzle will be given as a
# multidimensional array of integers and must be returned in the same format.
#
# For more on the rules; https://en.wikipedia.org/wiki/Sudoku
#
# Good luck!
#
# Test.describe('Basic Examples') do
# Test.assert_equals(sudokuer([	[0, 0, 2, 3, 9, 1, 8, 7, 6],
#                               [3, 0, 0, 6, 7, 5, 2, 9, 4],
#                               [6, 7, 0, 0, 2, 8, 3, 1, 5],
#                               [8, 3, 1, 0, 0, 4, 7, 2, 9],
#                               [2, 4, 5, 9, 0, 0, 1, 6, 3],
#                               [9, 6, 7, 2, 1, 0, 0, 4, 8],
#                               [7, 9, 6, 8, 5, 2, 0, 0, 1],
#                               [1, 8, 3, 7, 4, 9, 6, 0, 0],
#                               [5, 2, 4, 1, 3, 6, 9, 8, 0]]),
#
#                             [ [4, 5, 2, 3, 9, 1, 8, 7, 6],
#                               [3, 1, 8, 6, 7, 5, 2, 9, 4],
#                               [6, 7, 9, 4, 2, 8, 3, 1, 5],
#                               [8, 3, 1, 5, 6, 4, 7, 2, 9],
#                               [2, 4, 5, 9, 8, 7, 1, 6, 3],
#                               [9, 6, 7, 2, 1, 3, 5, 4, 8],
#                               [7, 9, 6, 8, 5, 2, 4, 3, 1],
#                               [1, 8, 3, 7, 4, 9, 6, 5, 2],
#                               [5, 2, 4, 1, 3, 6, 9, 8, 7]])
# end

# def sudokuer(puzzle)
#   puzzle.each do |line|
#     missing_numbers = (1..9).to_a - line
#     line[line.index 0] = 45 - line.inject(:+) if missing_numbers.length == 1
#     p missing_numbers
#     # line.select{|element| p line.count(element) > 1 }
#   end
# end

# def sudokuer(puzzle)
#   9.times do |i|
#     9.times do |j|
#       puts "J: #{j}"
#     end
#     puts "I: #{i}"
#   end
# end

def sudokuer(puzzle)
  #Set up values
  vertical = []
  horizontal = puzzle
  v_line = 0
  horizontal_indexes = []


  #Count total amount of zeros
  zeros = 0
  puzzle.each do |line|
    line.select {|element| zeros += 1 if element == 0 }
  end
  puts "Total zeros: #{zeros}"

  #Start the loop to solve the problem
  loop do

    #If there are no zeros leave the loop and return solution
    break if zeros == 0

    #Loop through the horizontal lines and check for one zero on the line
    horizontal.map do |h|
      if h.include?(0) && h.uniq.length == h.length
        puts "Got one h! #{h}"
        h[h.index 0] = 45 - h.inject(:+)
        zeros -= 1
      end
    end

    #Loop through the vertial lines and check for one zero on the line
    v_line = 0 if v_line == 9

    horizontal.each do |h|
      vertical << h[v_line]
      horizontal_indexes << h[h.index 0] if h[v_line] == 0
    end
    v_line += 1

    if vertical.include?(0) && vertical.uniq.length == vertical.length
      puts "Got one v! #{vertical}"
      missing_numbers = (1..9).to_a - vertical
      horizontal[horizontal.index 0] = missing_numbers
      zeros -= 1
    end
    vertical = []
    horizontal_indexes = []
  end
  p horizontal
end

# def sudokuer(puzzle)
#   #Count total amount of zeros
#   zeros = 0
#   puzzle.each do |line|
#     line.select {|element| zeros += 1 if element == 0 }
#   end
#
#   while zeros != 0
#     puzzle.each do |line|
#       missing_numbers = (1..9).to_a - line
#
#       if missing_numbers.length == 1
#         line[line.index 0] = 45 - line.inject(:+)
#         zeros -= 1
#       end
#
#     end
#   end
# end

sudokuer([[0, 0, 2, 3, 9, 1, 8, 7, 6],
          [3, 0, 0, 6, 7, 5, 2, 9, 4],
          [6, 7, 0, 0, 2, 8, 3, 1, 5],
          [8, 3, 1, 0, 0, 4, 7, 2, 9],
          [2, 4, 5, 9, 0, 0, 1, 6, 3],
          [9, 6, 7, 2, 1, 0, 0, 4, 8],
          [7, 9, 6, 8, 5, 2, 0, 0, 1],
          [1, 8, 3, 7, 4, 9, 6, 0, 0],
          [5, 2, 4, 1, 3, 6, 9, 8, 0]])
