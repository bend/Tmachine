#!/usr/local/bin/ruby
require 'Tape.rb'
require 'Rules.rb'
require 'Global.rb'
require 'Exception.rb'
require 'Printer.rb'

class Tmachine

	attr_reader :alphabet
	attr_reader :rules
	attr_reader :tape
	attr_reader :currentState
	attr 		:printer

	def initialize(alphabet, initialState, r)
		@alphabet= alphabet
		@printer = Printer.new("/dev/stdout")
		printer.print('Parsing rules\n',INFO)
		@rules = Rules.new(r)
		printer.print('Initializing tape',INFO)
		@tape = Tape.new(alphabet)
		printer.print('Filling tape',INFO)
		begin
			tape.fillTape(initialState)
		rescue SymbolException 
			printer.print('Symbol not in alphabet',WARNING)
			exit
		end
		printer.print('Initial tape',STATUS)
		printer.print(tape.toString,TAPE)
		@currentState = STATE_START
	end

	def start()
		iter = 0
		while currentState != STATE_STOP
			printer.print("Current state : "+currentState, STATUS)
			printer.print("Reading Symbol: "+tape.getUnderCur,STATUS)
			arr = rules.applyRule(currentState, tape.getUnderCur)
			if arr == nil 
				printer.print("No rules found",WARNING)
				printer.print("STOPPED ON ITERATION "+iter.to_s, WARNING)
				printer.print("WITH STATE "+currentState,WARNING)
				printer.print("WITH SYMBOL"+tape.getUnderCur,WARNING)
				return
			end
			printer.print("Applying rules :",STATUS)
			printer.print("	new state	: "+ arr[POS_STATE],STATUS)
			printer.print("	new symbol	: "+ arr[POS_SYM],STATUS)
			printer.print("	move		: "+ arr[POS_MOVE],STATUS)
			@currentState = arr[POS_STATE] 	# new state
			begin 
				tape.putSymbol(arr[POS_SYM])
			rescue
				printer.print("Symbol not in alphabet",WARNING)
				exit
			end
			case arr[POS_MOVE]
			when SHIFT_RIGHT:
				tape.rightMove
			when SHIFT_LEFT:
				tape.leftMove
			end
			printer.print("Tape @iteration "+iter.to_s,STATUS)
			printer.print(tape.toString,TAPE)
			iter+=1
		end
		printer.print("Final tape:",TAPE)
		printer.print(tape.toString,Tape)
		printer.print("Number of iterations: " + iter.to_s,STATUS)
	end
end


