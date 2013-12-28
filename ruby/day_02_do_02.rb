#!/usr/bin/env ruby

# Second exercise in the Do section of Ruby day two.

#
# Enhance Tree sample class to accept hash as initial value.

require './tree.to_s.rb'

test_hash = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

# Open up the Tree class so we can redefine the original initialize method.
class Tree
  # Save an alias of the original initialize method so we can still use it.
  alias orig_init initialize

  def initialize(hash)
    # Check preconditions.
    fail 'empty hash' if hash.empty?
    fail 'too many in hash' if hash.size > 1

    # Get the first (and only) entry in the hash.
    node = hash.first
    name = node.first
    child_hash = node.last

    children = []
    child_hash.each do |key, val|
      children << Tree.new({key => val})
    end

    # Call the original initialize method.
    orig_init(name, children)
  end
end

puts "\n\n"
puts "Tree from hash: #{Tree.new(test_hash)}"
