#!/usr/bin/env ruby

# First exercise in the Do section of Ruby day two.

#
# Print array in groups of four.
sixteen = 16.times.to_a

# Using only Array#each.
count = 0
group = []
sixteen.each do |n|
  count += 1
  group << n
  if count % 4 == 0
    puts "group ##{count / 4}: #{group}"
    group = []
  end
end
puts "\n"

# Using Array#each_slice.
sixteen.each_slice(4) { |slice| p slice }
