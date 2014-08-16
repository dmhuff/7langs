#!/usr/bin/env io

# Dos #3-7 of Io day 2.

# Add a method to List that will sum all numbers in a list.
List sum = method(
  total := 0
  for(i, 0, self size - 1,
    currentItem := at(i)
    if(currentItem type == "Number") then(
      total = total + currentItem
    ) elseif(currentItem type == "List") then(
      # Handle lists as list items. This will allow for summing two-dimensional
      # arrays, providing a solution for #3.
      total = total + (currentItem sum)
    ) else (
      Exception raise("#{currentItem} is not a Number or a List!" interpolate)
    )
  )
  total
)

Test isEqual(10, list(1, 2, 3, 4) sum)

2dArray := list(
  list(0, 1, 2,  3),
  list(4, 5, 6,  7),
  list(8, 9, 10, 11)
)
Test isEqual(66, 2dArray sum)


# Compute the average of the numbers in a List; solves #4.
List myAverage := method(
  self sum / self size
)

Test isEqual(4, list(4, 4, 4, 4) myAverage)
Test isEqual(5, list(1, 2, 3, 7, 8, 9) myAverage)


# Matrix prototype object. Solves #5.
Matrix := Object clone

Matrix dim := method(x, y,
  self width := x
  self height := y

  self data := List clone
  self data setSize(x)
  for(i, 0, x - 1,
    row := List clone
    row setSize(y)
    self data atPut(i, row)
  )
)

Matrix set := method(x, y, value,
  self data at(x) atPut(y, value)
)

Matrix get := method(x, y,
  self data at(x) at(y)
)

# Return a transposed version of the matrix. Solves #6.
Matrix transpose := method(
  transposed := Matrix clone
  transposed dim(self height, self width)

  for(x, 0, self width - 1,
    for(y, 0, self height - 1,
      transposed set(y, x, self get(x, y))
    )
  )
  transposed
)

# Write the matrix to a file, using a very simple format (the first two lines
# of the file are the matrix's dimensions, with each following line containing
# one value in sequence). This solves #7.
Matrix save := method(fileName,
  file := File with(fileName)
  file remove
  file openForUpdating

  file write(self width asString .. "\n")
  file write(self height asString .. "\n")
  for(x, 0, self width - 1,
    for(y, 0, self height - 1,
      value := get(x, y)
      if(value == nil) then(value = "")
      file write(value asString .. "\n")
    )
  )

  file close
)

Matrix load := method(fileName,
  file := File with(fileName)
  file openForReading

  width := file readLine asNumber
  height := file readLine asNumber
  lines := file readLines

  self dim(width, height)
  for(x, 0, width - 1,
    for(y, 0, height - 1,
      value := lines at(x * width + y)

      if(value == "") then(value = nil)
      if(value != nil) then(value = value asNumber)

      self set(x, y, value)
    )
  )
)

matrix := Matrix clone
matrix dim(4, 4)

matrix set(2, 1, 1)
Test isEqual(1, matrix get(2, 1))
Test isEqual(1, matrix transpose get(1, 2))

matrix set(3, 3, 42)
Test isEqual(42, matrix get(3, 3))

matrix save("matrix.txt")
loadedMatrix := Matrix clone
loadedMatrix load("matrix.txt")
Test isEqual(matrix width, loadedMatrix width)
Test isEqual(matrix height, loadedMatrix height)
for(x, 0, matrix width - 1,
  for(y, 0, matrix height - 1,
    Test isEqual(matrix get(x,y), loadedMatrix get(x,y))
  )
)

"Done!" println
