#!/usr/local/bin/ruby
require 'Tape.rb'
require 'Rules.rb'

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
		@currentState = 'START'
	end

	def start()
		while currentState != 'STOP'
			arr = rules.applyRule(currentState, tape.getUnderCur)
			@currentState = arr[0] 	# new state
			tape.putSymbol(arr[1])
			if arr[2] =='->'
				tape.rightMove
			elsif arr[2] =='<-'
				tape.leftMove
			end
			puts tape.toString
		end
	end
		
end


r = ['START','0','CONT','b','->',
	 'CONT' ,'0','CONT','c','->',
	 'STOP' ,'0','STOP','d','<>']

init = '0000000000000000'
alp = '0B'

tm = Tmachine.new(alp, init, r)
tm.start()

