def next_bigger(n)
  number_length = n.digits.count.to_i
  number_length = number_length
  timeout = 0
  arr_list = []
  while number_length != timeout
    x = n.digits.shuffle.join.to_i
    if arr_list.include?(x) && (x > n)
      timeout += 1
    else
      arr_list << x
    end
  end
  output = arr_list.sort
  output[-1] == n || output[-1] < n ? -1 : arr_list[0]
end

p next_bigger(2017)
