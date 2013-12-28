#!/usr/bin/env ruby

# Thirs exercise in the Do section of Ruby day two.

#
# Enhance the book's CSV example program via metaprogramming.

begin
  require './acts_as_csv_module.rb'
rescue
  # Do nothing; this rescue is to work around missing file errors thrown when
  # the book's program is included as a library.
end

# Create a class for the file, as per the book's program's design.
class DayThreeCsv
  include ActsAsCsv
  acts_as_csv
end

# Class representing a row of CSV data.
class CsvRow
  def initialize row
    @row = row
  end

  def to_s
    "#{super.to_s} :: #{@row.to_s}"
  end

  def method_missing(name, *args, &block)
    # Attempt to convert the method called to a number.
    column = case name.to_sym
      when :one;    1
      when :two;    2
      when :three;  3
      when :four;   4
      when :five;   5
      when :six;    6
      when :seven;  7
      when :eight;  8
      when :nine;   9
      when :ten;   10
      else nil
    end

    # Fall back to the super class's method_missing handler if needed.
    column.nil? ? super.method_missing(name, *args, &block) : @row[column - 1]
  end
end

# Open up the ActsAsCsv module to make our enhancements.
module ActsAsCsv
  def each
    @csv_contents.each { |row| yield CsvRow.new(row) }
  end
end

# Run the book's test (should print "lions" to the console).
csv = DayThreeCsv.new
csv.each { |row| puts row.one }
