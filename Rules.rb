#!/usr/local/bin/ruby

class Rules

	attr_reader :rules
	
	def initialize(r)
		@rules = {}
		parseRules(r)
	end

	def applyRule(state, symbol)
		return rules[state][symbol]
	end

private
	
	# |State|symbol||State|Sym|move
	# Hash(State, Hash(symbol, Array[State,Sym,mode]))
	# Rules are received with format array[State,Sym...]
	def parseRules(r)
		for i in 0..r.length do
			if i%5 ==0	# State
				state = r[i]
				sym = r[i+1]
				newState = r[i+2]
				newSym = r[i+3]
				move = r[i+4]
				arr = []
				arr.push(newState)
				arr.push(newSym)
				arr.push(move)
				if rules[state] == nil
					hash = {}
					hash[sym] = arr
					rules[state] = hash
				else
					rules[state][sym] = arr
				end
			end
		end

	end

end

