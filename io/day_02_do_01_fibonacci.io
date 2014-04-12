#!/usr/bin/env io

# Do #1 of Io day 2.

Fibonacci := Object clone

# Default implementation; always returns the wrong result.
Fibonacci compute := method(-1)

Fibonacci testRun := method(
  # Test the first 21 numbers in the sequence (according to Wikipedia).
  sequence := list(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233,
      377, 610, 987, 1597, 2584, 4181, 6765)
  for (i, 0, sequence size - 1, Test isEqual(sequence at(i), compute(i)))
)

# Recursive implementation.
fibRecursive := Fibonacci clone
fibRecursive compute := method(n,
  if(n == 0) then (
    return 0
  ) elseif(n == 1) then (
    return 1
  )
  return compute(n - 1) + compute (n - 2)
)
fibRecursive testRun

# Loop implementation.
fibLoop := Fibonacci clone
fibLoop compute := method(n,
  if(n == 0) then (
    return 0
  ) elseif(n == 1) then (
    return 1
  )

  oldest := 0
  newest := 1
  i := 1
  while(i < n,
    current := oldest + newest
    oldest = newest
    newest = current
    i = i + 1
  )
  current
)
fibLoop testRun

"Done!" println
