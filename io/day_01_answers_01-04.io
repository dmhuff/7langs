#!/usr/bin/env io

# The Answers section of Io day 1.


# 1
# Is Io strongly or weakly typed?

(1 + 1) println # prints "2".

# This will cause an error:
# "Exception: argument 0 to method '+' must be a Number, not a 'Sequence'"
# 1 + "one"

# Io is strongly typed, since it requires that method arguments be of a
# specific type. The plus method/operator for a Number expects to be passed
# a Number. This is why the first line works and the second does not.

"\n" println



# 2
# True and false values.

# 0 (zero).
if (0) then("0 is true" println) else("0 is false" println) # prints "0 is true".

# "" (empty string).
if ("") then("\"\" is true" println) else("\"\" is false" println) # prints """ is true".

# nil.
if (nil) then("nil is true" println) else("nil is false" println) # prints "nil is false".

"\n" println



# 3
# How can you tell what slots a prototype supports?

foo := Object clone
foo a := 1
foo b := 2
foo c := 3

# Use the slotNames method to get a list of all of an object's slots
# (including prototypes).
foo slotNames println # prints "list(b, a, c)".

"\n" println



# 4
# What is the difference between the equals operators, and when should you use them?

bar := Object clone

# ::= Creates a slot and setter, and assigns a value.
# Use when you need to assign a new slot and want the convenience of a setter method too.

# bar setable   # Will throw an error: "Object does not respond to 'setable'"
bar setable ::= "Change me!"
bar setable println # prints "Change me!"

bar setSetable("I'm different")
bar setable println # prints "I'm different".

# :=  Creates slot, assigns value

# bar notSetable   # Error: "Object does not respond to 'notSetable'"
bar notSetable := "Somewhat harder to change!"
bar notSetable println # prints "Somewhat harder to change!".

# bar setNotSetable("Oh yeah?")   # Error: "Object does not respond to 'setNotSetable'"
bar notSetable := "But still changeable!"
bar notSetable println #prints "But still changeable!".

# =   Assigns value to slot if it exists, otherwise raises exception.
#bar doesNotExist = 42 # Error: "Slot foo not found. Must define slot using := operator before updating."
bar whatev := "whatev"
bar whatev println # prints "whatev"

bar whatev = "this is OK"
bar whatev println # prints "this is OK"
