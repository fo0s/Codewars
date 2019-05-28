=begin

Make a program that filters a list of strings and returns a list
with only your friends name in it.

If a name has exactly 4 letters in it, you can be sure that it has
to be a friend of yours! Otherwise, you can be sure he's not...

Ex: Input = ["Ryan", "Kieran", "Jason", "Yous"], Output = ["Ryan", "Yous"]

Note: keep the original order of the names in the output.

Test.assert_equals(friend(["Ryan", "Kieran", "Mark"]), ["Ryan", "Mark"])
Test.assert_equals(friend(["Ryan", "Jimmy", "123", "4", "Cool Man"]), ["Ryan"])
Test.assert_equals(friend(["Jimm", "Cari", "aret", "truehdnviegkwgvke", "sixtyiscooooool"]), ["Jimm", "Cari", "aret"])
Test.assert_equals(friend(["Love", "Your", "Face", "1"]), ["Love", "Your", "Face"])




=end
def friend(friends)
 friends.select { |y| y.length == 4 }
end

p friend(["Ryan", "Jimmy", "123", "4", "Cool Man"])
