#!/usr/local/bin/ruby
$LOAD_PATH << '../'
require 'tests/Assert.rb'
require 'Global.rb'
require 'Tape.rb'
$DEBUG = true
#create the tape
initState = "abcdef"
t = Tape.new()
t.fillTape(initState)

# Check that the Tape is filled
initState.each_char do |e|
	assert("Failed"){t.getUnderCur == e}
	t.rightMove
end

# Put the Cur at the beginning
t.leftMove
while t.getUnderCur != EMPTY
	t.leftMove
end
# Fill the Tape from 0 to -N
for i in 0..10 do
	t.putSymbol(-i)
	t.leftMove
end

# Check that values are correct
t.rightMove
10.downto 0 do |i|
	assert("Failed"){t.getUnderCur == -i}
	t.rightMove
end
initState.each_char do |e|
	assert("Failed"){t.getUnderCur == e}
	t.rightMove
end

puts 'All Tape tests succeded'



