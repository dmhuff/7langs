#!/usr/bin/env ruby

# Thirs exercise in the Do section of Ruby day two.

#
# Implement a simple grep with Ruby.

if ARGV.size != 2
  puts "usage: #{__FILE__} file_path search_phrase"
end

# Break out the CLI parameters and parse the search phrase as a regex.
file_path, search_phrase = ARGV
begin
  search_regexp = Regexp.new(search_phrase)
rescue Exception => e
  STDERR.puts "ERROR! Couldn't parse search phrase as a regular expression: #{e}"
  exit -1
end

begin
  # Open the file.
  File.open(file_path) do |f|
    line_number = 0
    # Search the file line-by-line for the search phrase.
    f.each_line do |line|
      line_number += 1
      puts("% 5d: #{line}" % line_number) if search_regexp =~ line
    end
  end
rescue Exception => e
  STDERR.puts "ERROR! Problem searching file: #{e}"
  exit -1
end
