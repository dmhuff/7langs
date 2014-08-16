# Defines a simple helper object for unit testing.

Test := Object clone

Test success := method("." print)

Test fail := method(failMsg,
  Exception raise(failMsg)
)

Test isEqual := method(left, right,
  if (left == right) then (
    success
  ) else (
    fail("Failure! [#{left}:#{left type}] not equal to [#{right}:#{right type}]" interpolate)
  )
)

Test isTrue := method(expression,
  if (expression) then (
    success
  ) else (
    fail("Failure! #{expression} is not true" interpolate)
  )
)
