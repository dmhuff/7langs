#!/usr/bin/env ruby

# Print the string "Hello, world".
puts 'Hello, world'

# For the string "Hello, Ruby", find the index of the word "Ruby".
hello_ruby = 'Hello, Ruby'
puts "Index of 'Ruby' in '#{hello_ruby}': #{hello_ruby.index('Ruby')}"

# Print your name ten times.
10.times { puts 'Dave' }

# Print the string "This is sentence number 1", where the number 1 changes from 1 to 10.
(1..10).each { |i| puts "This is sentence number #{i}." }
