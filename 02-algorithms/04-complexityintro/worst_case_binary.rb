def worst_case_binary(n)
  for number in 1..n do
    puts "(" + number.to_s + "," + number.to_s + ")"
  end
end

worst_case_binary(10)
