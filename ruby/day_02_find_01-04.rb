#!/usr/bin/env ruby

# Exercises in the Find section of Ruby day two.

# 1
# Access a file with a code block.
puts 'contents of file (with block):'
File.open('./dummy.txt') do |f|
  puts f.read
end
puts "\n"

# Access a file without a code block.
puts 'contents of file (sans block):'
begin 
  file = File.open('./dummy.txt')
  puts file.read
ensure
  if !(file == nil || file.closed?)
    puts 'closing file...'
    file.close
  end
end
puts "\n"

# 2
# Translate a hash into an array.
hash = {a: 1, b: 2, c: 3, d: 4}

# Convert the hash to an array as an array of arrays, each containing 
# a key/value pair.
hash_as_array = hash.keys.map { |k| [k, hash[k]] }

puts "the hash: #{hash}"
puts "as array: #{hash_as_array}"
puts 'same as ruby lib' if hash_as_array == hash.to_a
puts "\n"

# Translate an array into a hash.
hashed_array = {}
hash_as_array.each { |kv| hashed_array[kv.first] = kv.last }

puts "rehashed array: #{hashed_array}"
puts 'same as what we started with' if hashed_array == hash
puts "\n"

# 3
# Iterate through a hash.
puts 'hash contents:'
hash.each_with_index { |e, i| puts "#{i}: #{e}" }
puts "\n"

# 4
# Implement common data structures with an array.

puts 'FIFO Queue'
array = [] 
5.times { |i| array << i + 1 }
puts "array: #{array}"
5.times { |i| puts "removal ##{i + 1}: #{array.shift}" }
puts "array: #{array}"
puts "\n"

puts "Set"
class Array
  def add_no_dups(value)
    self.push(value) unless self.include?(value)
  end
end
set = [] 
5.times { |i| set.add_no_dups(i + 1) }
puts "set: #{set}"
6.times do |i| 
  value = i + 1
  puts "add #{value} ?"
  set.add_no_dups(value)
  puts "set: #{set}, length: #{set.length}"
end

puts "\n"