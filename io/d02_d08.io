#!/usr/bin/env io

# #8: Number guessing game.

console := File standardInput
answer := Random value(100) floor + 1
lastGuess := nil
correct := false

for(i, 1, 10,
  "Enter guess #{i}: " interpolate print
  guess := console readLine asNumber

  if(answer == guess) then (
    "Correct!" println
    correct := true
    return
  ) elseif (lastGuess != nil) then (
    if((answer - guess) abs < (answer - lastGuess) abs) then (
      "Warmer!" println
    ) else (
      "Colder!" println
    )
  )

  lastGuess := guess
)

if(correct := true) then (
  "The correct answer is #{answer}. Better luck next time!" interpolate println
)

console close
