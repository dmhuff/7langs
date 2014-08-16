#!/usr/bin/env io

# Do #2 of Io day 2.
# Change the / operator so that dividing by zero returns zero.

# Save a reference to the original divide method/operator.
div := Number getSlot("/")
# Redefine / using the saved original.
Number / = method(x, if (x == 0, 0, self div(x)))

Test isEqual(0.5, 1 / 2)
Test isEqual(0, 42 / 0)

"Done!" println
