# You are given a (small) check book as a - sometimes - cluttered
# (by non-alphanumeric characters) string:
#
# "1000.00
# 125 Market 125.45
# 126 Hardware 34.95
# 127 Video 7.45
# 128 Book 14.32
# 129 Gasoline 16.10"
# The first line shows the original balance. Each other line (when not blank)
# gives information: check number, category, check amount.
#
# First you have to clean the lines keeping only letters, digits, dots and spaces.
#
# Then return a report as a string (underscores show spaces -- don't put them
#   in your solution. They are there so you can see them and how many of them
#   you need to have):
#
# "Original_Balance:_1000.00
# 125_Market_125.45_Balance_874.55
# 126_Hardware_34.95_Balance_839.60
# 127_Video_7.45_Balance_832.15
# 128_Book_14.32_Balance_817.83
# 129_Gasoline_16.10_Balance_801.73
# Total_expense__198.27
# Average_expense__39.65"
# On each line of the report you have to add the new balance and then in the
# last two lines the total expense and the average expense. So as not to have a
# too long result string we don't ask for a properly formatted result.
#
# Notes
# It may happen that one (or more) line(s) is (are) blank.
# Round to 2 decimals your results.
# The line separator of results may depend on the language \n or \r\n. See
# examples in the "Sample tests".
#
# def testing(s, exp)
#     print("testing : ", s, "\n")
#     actual = balance(s)
#     Test.assert_equals(actual, exp)
# end
#
# $b1=
# "1000.00!=
#
# 125 Market !=:125.45
# 126 Hardware =34.95
# 127 Video! 7.45
# 128 Book :14.32
# 129 Gasoline ::16.10
# "
# $b1sol=
# "Original Balance: 1000.00\r\n
# 125 Market 125.45 Balance 874.55\r\n
# 126 Hardware 34.95 Balance 839.60\r\n
# 127 Video 7.45 Balance 832.15\r\n
# 128 Book 14.32 Balance 817.83\r\n
# 129 Gasoline 16.10 Balance 801.73\r\n
# Total expense 198.27\r\n
# Average expense  39.65"
#
# $b2="1233.00
# 125 Hardware;! 24.8?;
# 123 Flowers 93.5
# 127 Meat 120.90
# 120 Picture 34.00
# 124 Gasoline 11.00
# 123 Photos;! 71.4?;
# 122 Picture 93.5
# 132 Tyres;! 19.00,?;
# 129 Stamps 13.6
# 129 Fruits{} 17.6
# 129 Market;! 128.00?;
# 121 Gasoline;! 13.6?;"
#
# $b2sol="Original Balance: 1233.00\r\n125 Hardware 24.80 Balance 1208.20\r\n123
# Flowers 93.50 Balance 1114.70\r\n127 Meat 120.90 Balance 993.80\r\n120 Picture
# 34.00 Balance 959.80\r\n124 Gasoline 11.00 Balance 948.80\r\n123 Photos 71.40
# Balance 877.40\r\n122 Picture 93.50 Balance 783.90\r\n132 Tyres 19.00 Balance
# 764.90\r\n129 Stamps 13.60 Balance 751.30\r\n129 Fruits 17.60 Balance
# 733.70\r\n129 Market 128.00 Balance 605.70\r\n121 Gasoline 13.60 Balance
# 592.10\r\nTotal expense  640.90\r\nAverage expense  53.41"
#
# describe("balance") do
#     it("Basic tests") do
#         testing($b1, $b1sol)
#         testing($b2, $b2sol)
#     end
# end


# TODO:
# 1. Clean the lines keeping only letters, digits, dots and spaces**
# 2. New string has: <number>space<item>space<price>**
# 3. Add to that is: <Balance>space<New balance of price minus balance>**
# 4. Add to end of list: <Total expense>spacespace<total of price>**
# 5. End list with: <Average expense>spacespace<average price>
# 6. Some lines might be blank. Maybe a error check for that
# 7. Round to 2 decimals**

def checkpoint(where, output)
  puts
  puts "-------------------------------------------------------------------"
  puts "\e[31mCheckpoint:\e[4m \e[32m#{where}:\e[0m \e[37m#{output}\e[0m"
  puts "-------------------------------------------------------------------"
  puts
  # checkpoint("", )
end

def balance(b)
  output = []
  total_expences = 0
  new_lines = b.split("\n")

  original_budget = new_lines.shift.gsub(/[^0-9.]/,'')
  new_lines.reject!(&:empty?)
  new_lines.map do |line|
    # Clean up lines
    line.gsub!(/[^0-9A-Za-z. ]/, "")
    fix_num = line.split(" ").pop
    line.sub!(fix_num, sprintf("%.2f",fix_num))

    # Calculations
    total_expences += fix_num.to_f
    line << " Balance " + sprintf("%.2f",(original_budget.to_f - total_expences)) if line.match(/[^A-Za-z]/)
  end

  output << "Original Balance: " + sprintf("%.2f",original_budget)
  output << new_lines
  output << "Total expense  " + sprintf("%.2f",total_expences)
  output << "Average expense  " + sprintf("%.2f",(total_expences / new_lines.size))
  output.join("\r\n")
end

p balance("1000.00!=\n\n125 Market !=:125.45\n126 Hardware =34.95\n127 Video! 7.45\n128 Book :14.32\n129 Gasoline ::16.10\n")

def balance(b)
  check_book = b.split("\n").map { |l| l.gsub(/[^a-z\d\.\s]/i, '') }.delete_if(&:empty?)
  sum = original_bal = check_book.shift.gsub(/[^\d\.]/,'').to_f.round(2)
  formated = check_book.map do |item|
    sum = (sum - item.split(' ').last.to_f).round(2)
    num, cat, amount = item.split
    [num, cat, '%.2f' % amount, "Balance", '%.2f' % sum]
  end
  ["Original Balance: #{'%.2f' % (original_bal)}", formated.map { |item| item.join(' ') },
    "Total expense  #{'%.2f' % (total=(original_bal - formated.last.last.to_f).round(2))}",
    "Average expense  #{'%.2f' % ((total / check_book.size).round(2))}"
  ].join("\r\n")
end
