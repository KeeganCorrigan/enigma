# numbers = "12345"
#
# rotated_array = []
# x = -1
# 4.times do
#   x += 1
#   rotated_array << (numbers[0 + x] + numbers [1 + x]).split('').map do |number|
#     number.to_i
#   end
# end
#
# p rotated_array
# time_used_for_offset = [3,5,2,4]
#
# shift_array = []
# x = -1
# 4.times do
#   x += 1
#   shift_array << rotated_array[x].flatten.join.to_i + time_used_for_offset[x]
# end
#
# p shift_array


shifted_array = [5, 7, 15, 14]
second_shift_array = []
x = 0
[1, 5, 5, 6, 1, 5, 5, 6,1, 5, 5, 6, 1, 5, 5, 6,1, 5, 5, 6, 1, 5, 5, 6,1, 5, 5, 6, 1, 5, 5, 6].map do |number|
  if x > 3
    x = 0
  end
  second_shift_array << (number + shifted_array[x])
  x += 1
end

p second_shift_array
