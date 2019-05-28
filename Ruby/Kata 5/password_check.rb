=begin
You need to write regex that will validate a password to make
sure it meets the following criteria:

At least six characters long
contains a lowercase letter
contains an uppercase letter
contains a number
Valid passwords will only be alphanumeric characters.
=end

regex=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Z-a-z\d]{6,}$/
