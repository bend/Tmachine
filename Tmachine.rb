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
		puts 'parsing rules'
		@rules = Rules.new(r)
		puts '+-------------------+'
		puts '| initializing tape |'
		puts '+-------------------+'
		@tape = Tape.new
		puts '+-------------------+'
		puts '|    filling tape   |'
		puts '+-------------------+'
		tape.fillTape(initialState)
		puts '+-------------------+'
		puts '|    initial tape   |'
		puts '+-------------------+'
		print tape.toString
		puts ''
		puts ''
		@currentState = STATE_START
	end

	def start()
		iter = 0
		while currentState != STATE_STOP
			puts '+--------------------------'
			puts '| Current state : '+currentState
			puts '+--------------------------'
			puts '| Reading Symbol: '+tape.getUnderCur
			arr = rules.applyRule(currentState, tape.getUnderCur)
			if arr == nil 
				puts 'No rules found'
				return
			end
			puts '+--------------------------'
			puts '| Applying rules :' 
			puts '|	new state	: '+ arr[POS_STATE]
			puts '|	new symbol	: '+ arr[POS_SYM]
			puts '|	move		: '+ arr[POS_MOVE]
			@currentState = arr[POS_STATE] 	# new state
			tape.putSymbol(arr[POS_SYM])
			case arr[POS_MOVE]
			when SHIFT_RIGHT:
				tape.rightMove
			when SHIFT_LEFT:
				tape.leftMove
			end
			puts '+--------------------------'
			puts '| Tape @iteration '+iter.to_s
			print '|	'
			print tape.toString
			puts ''
			iter+=1
			puts '+--------------------------'
			puts ''
		end
		puts '+--------------------------'
		puts '| Final tape:'
		print tape.toString
		puts '|	'
		puts '+--------------------------'
		puts '| Number of iterations: ' + iter.to_s
		puts '+--------------------------'
	end
		
end


