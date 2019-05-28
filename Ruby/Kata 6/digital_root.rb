
def digital_root(n)
    array = n.to_s.split('').map(&:to_i)
    if array[1].nil?
       array[0]
    else
        loop do
            array = array.inject(:+).to_s.split('').map(&:to_i).to_a
            break if array[1].nil?
        end
        array.join.to_i
    end
end

puts digital_root(11111)
