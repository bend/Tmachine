#!/usr/local/bin/ruby
$LOAD_PATH << '../'
require 'tests/Assert.rb'
require 'Node.rb'
require 'Global.rb'
$DEBUG = true
# Create the nodes
n1 = Node.new
n2 = Node.new
n3 = Node.new
n4 = Node.new
n5 = Node.new

# Check that the node is created with right value
assert("Failed"){n1.elem == EMPTY}
assert("Failed"){n2.elem == EMPTY}
assert("Failed"){n3.elem == EMPTY}
assert("Failed"){n4.elem == EMPTY}
assert("Failed"){n5.elem == EMPTY}

# Link the nodes
n1.setNext(n2)
n3.setPrev(n2)
n3.setNext(n4)
n5.setPrev(n4)

# Check that the linked list is OK
assert("Failed"){n1.next == n2}
assert("Failed"){n2.next == n3}
assert("Failed"){n3.next == n4}
assert("Failed"){n4.next == n5}

assert("Failed"){n5.prev == n4}
assert("Failed"){n4.prev == n3}
assert("Failed"){n3.prev == n2}
assert("Failed"){n2.prev == n1}
assert("Failed"){n1.prev == nil}

# Set the val of the nodes
n1.setElem(1)
n2.setElem(2)
n3.setElem(3)
n4.setElem(4)
n5.setElem(5)

# Check that the value is set
assert("Failed"){n1.elem == 1} 
assert("Failed"){n2.elem == 2} 
assert("Failed"){n3.elem == 3} 
assert("Failed"){n4.elem == 4} 
assert("Failed"){n5.elem == 5} 

puts 'All Node tests succeded'
