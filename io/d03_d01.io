#!/usr/bin/env io

# Add indentation to the sample XML builder.

Builder := Object clone
Builder depth := -1
Builder forward := method(
  self depth = self depth + 1

  indent := ""
  for(i, 1, depth,
    indent = indent with("  ")
  )

  writeln(indent, "<", call message name, ">")
  call message arguments foreach(arg,
    content := self doMessage(arg);

    if(content type == "Sequence", writeln(indent with ("  "), content))
  )
  writeln(indent, "</", call message name, ">")
  self depth = self depth - 1
)

Builder div(
  ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
  )
)
