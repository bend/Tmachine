#!/usr/local/bin/ruby
require 'Tape.rb'
require 'Rules.rb'
require 'Global.rb'

class Tmachine

	attr_reader :alphabet
	attr_reader :rules
	attr_reader :tape
	attr_reader :currentState

	def initialize(alphabet, initialState, r)
		@h= alphabet
		@rules = Rules.new(r)
		@tape = Tape.new
		tape.fillTape(initialState)
		@currentState = STATE_START
	end

	def start()
		while currentState != STATE_STOP
			arr = rules.applyRule(currentState, tape.getUnderCur)
			@currentState = arr[POS_STATE] 	# new state
			tape.putSymbol(arr[POS_SYM])
			case arr[POS_MOVE]
			when SHIFT_RIGHT:
				tape.rightMove
			when SHIFT_LEFT:
				tape.leftMove
			end
		end
	end
		
end


r = ['START','0','CONT','b','->',
	 'CONT' ,'0','CONT','c','->',
	 'CONT' ,'B','STOP','B','->',
	]
init = '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
alp = '0B'

tm = Tmachine.new(alp, init, r)
tm.start()
print tm.tape.toString()
puts ''

