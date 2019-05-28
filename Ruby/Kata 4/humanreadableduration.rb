# Your task in order to complete this Kata is to write a function which formats a
# duration, given as a number of seconds, in a human-friendly way.
#
# The function must accept a non-negative integer. If it is zero, it just returns
# "now". Otherwise, the duration is expressed as a combination of years, days,
# hours, minutes and seconds.
#
# It is much easier to understand with an example:
#
# format_duration(62)    # returns "1 minute and 2 seconds"
# format_duration(3662)  # returns "1 hour, 1 minute and 2 seconds"
# For the purpose of this Kata, a year is 365 days and a day is 24 hours.
#
# Note that spaces are important.
#
# Detailed rules
# The resulting expression is made of components like 4 seconds, 1 year, etc. In
# general, a positive integer and one of the valid units of time, separated by a
# space. The unit of time is used in plural if the integer is greater than 1.
#
# The components are separated by a comma and a space (", "). Except the last
# component, which is separated by " and ", just like it would be written in
# English.
#
# A more significant units of time will occur before than a least significant
# one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.
#
# Different components have different unit of times. So there is not repeated
# units like in 5 seconds and 1 second.
#
# A component will not appear at all if its value happens to be zero. Hence,
# 1 minute and 0 seconds is not valid, but it should be just 1 minute.
#
# A unit of time must be used "as much as possible". It means that the function
# should not return 61 seconds, but 1 minute and 1 second instead. Formally,
# the duration specified by of a component must not be greater than any valid
# more significant unit of time.
#
# -------------------------------Test Cases-----------------------------------
#
# Test.assert_equals(format_duration(1), "1 second")
# Test.assert_equals(format_duration(62), "1 minute and 2 seconds")
# Test.assert_equals(format_duration(120), "2 minutes")
# Test.assert_equals(format_duration(3600), "1 hour")
# Test.assert_equals(format_duration(3662), "1 hour, 1 minute and 2 seconds")
#
# -----------------------------------------------------------------------------
#
#--------------------------------References------------------------------------
#
#minutes = 60
#hours = 3600
#days = 86400
#weeks = 604800
#months = 2419200
#years = 29030400

def format_duration(seconds)
  return "now" if seconds == 0
  #Set values
  input = seconds
  output = Array.new
  length_of_time = {
    "year" => 31536000,
    "day" => 86400,
    "hour" => 3600,
    "minute" => 60,
    "second" => 1
    }.keep_if {|_,v| v <= seconds }

    #Time calculation
    length_of_time.each do |time, duration|
      count = input / duration
      if count > 0
        output << count.to_s
        count == 1 ? output << time.to_s : output << time.to_s + "s"
        input = input - (count * duration)
      end
    end

    #Readable part
    if output.length == 2
      return output.join(" ")

    elsif output.length == 4
      output.insert(2, "and")
      return output.join(" ")

    else
      placement = 2
      while placement != (output.length - 2)
        word = output[placement - 1] + ","
        output.delete_at(placement - 1)
        output.insert(placement - 1, word)
        placement += 2
      end
      output.insert(placement, "and")
      return output.join(" ")
    end
end

puts format_duration(132030240)
#4 years, 68 days, 3 hours and 4 minutes

-------------------------Better-----------------------

# def format_duration(total)
#   if total == 0
#     "now"
#   else
#     duration = {
#       year:   total / (60 * 60 * 24 * 365),
#       day:    total / (60 * 60 * 24) % 365,
#       hour:   total / (60 * 60) % 24,
#       minute: total / 60 % 60,
#       second: total % 60
#     }
#
#     @output = []
#
#     duration.each do |key, value|
#       if value > 0
#         @output << "#{value} #{key}"
#         @output.last << "s" if value != 1
#       end
#     end
#
#     @output.join(', ').gsub(/\,\s(?=\d+\s\w+$)/, " and ")
#   end
# end
#
# def format_duration(seconds)
#   *init, last = [3600 * 24 * 365, 3600 * 24, 3600, 60, 1]
#                 .collect {|x| div, seconds = seconds.divmod(x); div}
#                 .reverse
#                 .zip([" second", " minute", " hour", " day", " year"])
#                 .keep_if {|x, y| x != 0}
#                 .map{|x, y| x.to_s + y + (x > 1 ? "s" : "")}
#                 .reverse
#   last ? "#{init.join(", ")}#{init == [] ? "" : " and "}#{last}" : "now"
# end
