#!/usr/bin/env ruby

# Simple guessing game; have the user guess a number from 1 to 10.

success = false
answer = rand(10) + 1

begin
  # Prompt the user.
  print 'Guess a number from 1 - 10: '
  guess = gets.to_i

  # Evaluate the user's guess.
  if guess < answer
    puts 'Too low!'
  elsif guess > answer
    puts 'Too high!'
  else
    puts "Success! The number is #{answer}."
    success = true
  end
end until success
