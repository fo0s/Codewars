# Take the following IPv4 address: 128.32.10.1
#
# This address has 4 octets where each octet is a single byte (or 8 bits).
#
# 1st octet 128 has the binary representation: 10000000
# 2nd octet 32 has the binary representation: 00100000
# 3rd octet 10 has the binary representation: 00001010
# 4th octet 1 has the binary representation: 00000001
# So 128.32.10.1 == 10000000.00100000.00001010.00000001
#
# Because the above IP address has 32 bits, we can represent it as
# the unsigned 32 bit number: 2149583361
#
# Complete the function that takes an unsigned 32 bit number and returns
# a string representation of its IPv4 address.
#
# Examples
# 2149583361 ==> "128.32.10.1"
# 32         ==> "0.0.0.32"
# 0          ==> "0.0.0.0"
#
# --------------------------------EXAMPLES-------------------------------
#
# Test.assert_equals(int32_to_ip(2154959208), "128.114.17.104")
# Test.assert_equals(int32_to_ip(0), "0.0.0.0")
# Test.assert_equals(int32_to_ip(2149583361), "128.32.10.1")
#
# -----------------------------------------------------------------------

def int32_to_ip(int32)
  puts IPAddr.new(int32.to_i, Socket::AF_INET).to_s
end

def int32_to_ip(int32)
  [24, 16, 8, 0].collect {|b| (int32 >> b) & 255}.join('.')
end

def int32_to_ip(int32)

  p1 = (int32) & 255
  p2 = (int32>>8) & 255
  p3 = (int32>>16) & 255
  p4 = (int32>>24) & 255

  return "#{p4}.#{p3}.#{p2}.#{p1}"

end

puts int32_to_ip(256)
